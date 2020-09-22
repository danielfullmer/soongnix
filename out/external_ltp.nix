{ cc_defaults, genrule }:
let

#
#  Copyright (C) 2016 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#

#  Include the generated rules
build = ["gen.bp"];

ltp_syscalls_h = genrule {
    name = "ltp_syscalls_h";
    tool_files = ["include/lapi/syscalls/regen.sh"];
    cmd = "$(location) $(genDir)/lapi/syscalls.h";
    srcs = [
        "include/lapi/syscalls/aarch64.in"
        "include/lapi/syscalls/arm.in"
        "include/lapi/syscalls/hppa.in"
        "include/lapi/syscalls/i386.in"
        "include/lapi/syscalls/ia64.in"
        "include/lapi/syscalls/mips_n32.in"
        "include/lapi/syscalls/mips_n64.in"
        "include/lapi/syscalls/mips_o32.in"
        "include/lapi/syscalls/powerpc.in"
        "include/lapi/syscalls/powerpc64.in"
        "include/lapi/syscalls/s390.in"
        "include/lapi/syscalls/s390x.in"
        "include/lapi/syscalls/sh.in"
        "include/lapi/syscalls/sparc.in"
        "include/lapi/syscalls/sparc64.in"
        "include/lapi/syscalls/x86_64.in"
    ];
    out = ["lapi/syscalls.h"];
};

ltp_defaults = cc_defaults {
    name = "ltp_defaults";

    cflags = [
        #  Hacks for bionic compatibility
        "-include bionic-compat.h"

        "-Wall"
        "-Werror"
        #  These warnings should be checked and fixed upstream
        "-Wno-absolute-value"
        "-Wno-uninitialized"
        "-Wno-user-defined-warnings"
        #  Silence noisy warnings
        "-Wno-constant-conversion"
        "-Wno-deprecated"
        "-Wno-duplicate-decl-specifier"
        "-Wno-empty-body"
        "-Wno-format"
        "-Wno-gnu-designator"
        "-Wno-implicit-function-declaration"
        "-Wno-incompatible-pointer-types-discards-qualifiers"
        "-Wno-knr-promoted-parameter"
        "-Wno-macro-redefined"
        "-Wno-missing-braces"
        "-Wno-missing-field-initializers"
        "-Wno-parentheses-equality"
        "-Wno-pointer-arith"
        "-Wno-pointer-sign"
        "-Wno-sign-compare"
        "-Wno-tautological-compare"
        "-Wno-unneeded-internal-declaration"
        "-Wno-unreachable-code-loop-increment"
        "-Wno-unused-function"
        "-Wno-unused-parameter"
        "-Wno-unused-variable"
    ];

    local_include_dirs = [
        "android/include"
        "include"
    ];

    target = {
        #  bionic has broken signal handling for signum > 32 on 32-bit ARM and x86
        #  (for ABI reasons this can't be fixed)
        android_arm = {
            cflags = ["-DNUMSIGS=32"];
        };
        android_x86 = {
            cflags = ["-DNUMSIGS=32"];
        };
    };

    generated_headers = ["ltp_syscalls_h"];

    static_libs = ["libcap"];

    #  TODO: recover libaio when the external project created
    shared_libs = [
        "libselinux"
        "libasyncio"
    ];
};

ltp_test_defaults = cc_defaults {
    name = "ltp_test_defaults";
    defaults = ["ltp_defaults"];
    gtest = false;
    no_named_install_directory = true;
    relative_install_path = "ltp/testcases/bin";
};

in { inherit ltp_defaults ltp_syscalls_h ltp_test_defaults; }
