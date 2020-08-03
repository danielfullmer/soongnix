{ art_cc_defaults, art_cc_library, cc_defaults, cc_test_host }:
let

#  Copyright (C) 2016 The Android Open Source Project
#  All rights reserved.
#
#  Redistribution and use in source and binary forms, with or without
#  modification, are permitted provided that the following conditions
#  are met:
#   * Redistributions of source code must retain the above copyright
#     notice, this list of conditions and the following disclaimer.
#   * Redistributions in binary form must reproduce the above copyright
#     notice, this list of conditions and the following disclaimer in
#     the documentation and/or other materials provided with the
#     distribution.
#
#  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
#  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
#  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
#  FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
#  COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
#  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
#  BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS
#  OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED
#  AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
#  OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
#  OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
#  SUCH DAMAGE.
#
#
#  Copyright (c) 2016 VIXL authors
#  All rights reserved.
#
#  Redistribution and use in source and binary forms, with or without
#  modification, are permitted provided that the following conditions
#  are met:
#  1. Redistributions of source code must retain the above copyright
#     notice, this list of conditions and the following disclaimer.
#  2. Redistributions in binary form must reproduce the above copyright
#     notice, this list of conditions and the following disclaimer in the
#     documentation and/or other materials provided with the distribution.
#  3. The name of the company may not be used to endorse or promote
#     products derived from this software without specific prior written
#     permission.
#
#  THIS SOFTWARE IS PROVIDED BY ARM LTD ``AS IS'' AND ANY EXPRESS OR IMPLIED
#  WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF
#  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
#  IN NO EVENT SHALL ARM LTD BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
#  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
#  TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
#  PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF
#  LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
#  NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
#  SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

vixl-common = cc_defaults {
    name = "vixl-common";
    host_supported = true;
    srcs = ["src/*.cc"];
    clang_cflags = ["-Wimplicit-fallthrough"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    cppflags = [
        "-DVIXL_GENERATE_SIMULATOR_INSTRUCTIONS_VALUE=0"
        "-Wextra"
        "-fdiagnostics-show-option"
        "-Wredundant-decls"
        "-Wunreachable-code"
        "-Wmissing-noreturn"
        "-pedantic"

        #  Explicitly enable the write-strings warning. VIXL uses
        #  const correctly when handling string constants.
        "-Wwrite-strings"

        "-DVIXL_CODE_BUFFER_MALLOC"
    ];
    local_include_dirs = ["src"];
    native_coverage = false;
    sanitize = {
        recover = ["shift-exponent"];
    };
};

vixl-arm = art_cc_defaults {
    name = "vixl-arm";
    defaults = ["vixl-common"];
    codegen = {
        arm = {
            srcs = ["src/aarch32/*.cc"];
            cppflags = [
                "-DVIXL_INCLUDE_TARGET_T32"
            ];
        };
    };
};

vixl-arm64 = art_cc_defaults {
    name = "vixl-arm64";
    defaults = ["vixl-common"];
    codegen = {
        arm64 = {
            srcs = ["src/aarch64/*.cc"];
            cppflags = [
                "-DVIXL_INCLUDE_SIMULATOR_AARCH64"
                "-DVIXL_INCLUDE_TARGET_A64"
            ];
        };
    };
};

vixl-debug = cc_defaults {
    name = "vixl-debug";
    defaults = ["vixl-common"];
    cppflags = [
        "-DVIXL_DEBUG"
        "-UNDEBUG"

        "-O2"
        "-ggdb3"
    ];
};

vixl-release = cc_defaults {
    name = "vixl-release";
    defaults = ["vixl-common"];
    cppflags = [
        "-O3"
    ];
};

libvixl = art_cc_library {
    name = "libvixl";
    defaults = [
        "vixl-release"
        "vixl-arm"
        "vixl-arm64"
        "dex2oat-pgo-defaults"
    ];

    target = {
        android = {
            lto = {
                thin = true;
            };
        };
    };
};

libvixld = art_cc_library {
    name = "libvixld";
    defaults = [
        "vixl-debug"
        "vixl-arm"
        "vixl-arm64"
    ];
};

# ######## VIXL HOST TESTS #########
#
#  We only support 64bit host builds for now.
#  To run all the tests: vixl-test-runner --run_all
#
vixl-test-runner = cc_test_host {
    name = "vixl-test-runner";
    gtest = false;
    defaults = [
        "vixl-debug"
        "vixl-arm"
        "vixl-arm64"
    ];
    local_include_dirs = ["test"];
    srcs = [
        "test/*.cc"
        "test/aarch32/*.cc"
        "test/aarch64/*.cc"
    ];
    data = [
        "test/test-trace-reference/*"
    ];
    enabled = false;
    target = {
        linux_glibc_x86_64 = {
            enabled = true;
        };
    };
};

in { inherit libvixl libvixld vixl-arm vixl-arm64 vixl-common vixl-debug vixl-release vixl-test-runner; }
