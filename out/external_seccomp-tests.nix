{ cc_library_static }:
let

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

external_seccomp_tests = cc_library_static {
    name = "external_seccomp_tests";

    #  mips and mips64 don't support Seccomp.
    arch = {
        mips = {
            enabled = false;
        };
        mips64 = {
            enabled = false;
        };
    };

    srcs = [
        "linux/seccomp_bpf.c"
        "seccomp_bpf_tests.c"
    ];

    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-gnu-designator"
        "-Wno-unused-parameter"
        "-Wno-literal-conversion"
        "-Wno-incompatible-pointer-types-discards-qualifiers"
        "-Wno-sign-compare"
        "-Wno-empty-body"
        "-Wno-unused-function"
        #  TODO(rsesek): Remove after syncing in upstream.
        "-D__ARCH_WANT_SYSCALL_DEPRECATED"
    ];

    shared_libs = ["liblog"];

    export_include_dirs = ["."];
};

in { inherit external_seccomp_tests; }
