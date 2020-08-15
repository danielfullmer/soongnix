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
    srcs = [
        "src/code-buffer-vixl.cc"
        "src/compiler-intrinsics-vixl.cc"
        "src/cpu-features.cc"
        "src/utils-vixl.cc"
    ];
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
        "test/test-aborts.cc"
        "test/test-api.cc"
        "test/test-code-buffer.cc"
        "test/test-code-generation-scopes.cc"
        "test/test-invalset.cc"
        "test/test-operands.cc"
        "test/test-pool-manager.cc"
        "test/test-runner.cc"
        "test/test-use-scratch-register-scope.cc"
        "test/test-utils.cc"
        "test/aarch32/test-assembler-aarch32.cc"
        "test/aarch32/test-assembler-cond-dt-drt-drd-drn-drm-float-f32-only-a32.cc"
        "test/aarch32/test-assembler-cond-dt-drt-drd-drn-drm-float-f32-only-t32.cc"
        "test/aarch32/test-assembler-cond-dt-drt-drd-drn-drm-float-not-f16-a32.cc"
        "test/aarch32/test-assembler-cond-dt-drt-drd-drn-drm-float-not-f16-t32.cc"
        "test/aarch32/test-assembler-cond-rd-memop-immediate-512-a32.cc"
        "test/aarch32/test-assembler-cond-rd-memop-immediate-8192-a32.cc"
        "test/aarch32/test-assembler-cond-rd-memop-rs-a32.cc"
        "test/aarch32/test-assembler-cond-rd-memop-rs-shift-amount-1to31-a32.cc"
        "test/aarch32/test-assembler-cond-rd-memop-rs-shift-amount-1to32-a32.cc"
        "test/aarch32/test-assembler-cond-rd-operand-const-can-use-pc-a32.cc"
        "test/aarch32/test-assembler-cond-rd-operand-const-cannot-use-pc-a32.cc"
        "test/aarch32/test-assembler-cond-rd-operand-const-t32.cc"
        "test/aarch32/test-assembler-cond-rd-operand-imm16-t32.cc"
        "test/aarch32/test-assembler-cond-rd-operand-rn-a32.cc"
        "test/aarch32/test-assembler-cond-rd-operand-rn-identical-low-registers-in-it-block-t32.cc"
        "test/aarch32/test-assembler-cond-rd-operand-rn-in-it-block-t32.cc"
        "test/aarch32/test-assembler-cond-rd-operand-rn-low-registers-in-it-block-t32.cc"
        "test/aarch32/test-assembler-cond-rd-operand-rn-ror-amount-a32.cc"
        "test/aarch32/test-assembler-cond-rd-operand-rn-ror-amount-t32.cc"
        "test/aarch32/test-assembler-cond-rd-operand-rn-shift-amount-1to31-a32.cc"
        "test/aarch32/test-assembler-cond-rd-operand-rn-shift-amount-1to31-in-it-block-t32.cc"
        "test/aarch32/test-assembler-cond-rd-operand-rn-shift-amount-1to31-t32.cc"
        "test/aarch32/test-assembler-cond-rd-operand-rn-shift-amount-1to32-a32.cc"
        "test/aarch32/test-assembler-cond-rd-operand-rn-shift-amount-1to32-in-it-block-t32.cc"
        "test/aarch32/test-assembler-cond-rd-operand-rn-shift-amount-1to32-t32.cc"
        "test/aarch32/test-assembler-cond-rd-operand-rn-shift-rs-a32.cc"
        "test/aarch32/test-assembler-cond-rd-operand-rn-shift-rs-in-it-block-t32.cc"
        "test/aarch32/test-assembler-cond-rd-operand-rn-shift-rs-narrow-out-it-block-t32.cc"
        "test/aarch32/test-assembler-cond-rd-operand-rn-shift-rs-t32.cc"
        "test/aarch32/test-assembler-cond-rd-operand-rn-t32.cc"
        "test/aarch32/test-assembler-cond-rd-pc-operand-imm12-t32.cc"
        "test/aarch32/test-assembler-cond-rd-pc-operand-imm8-t32.cc"
        "test/aarch32/test-assembler-cond-rd-rn-a32.cc"
        "test/aarch32/test-assembler-cond-rd-rn-operand-const-a32.cc"
        "test/aarch32/test-assembler-cond-rd-rn-operand-const-t32.cc"
        "test/aarch32/test-assembler-cond-rd-rn-operand-imm12-t32.cc"
        "test/aarch32/test-assembler-cond-rd-rn-operand-rm-a32.cc"
        "test/aarch32/test-assembler-cond-rd-rn-operand-rm-all-low-in-it-block-t32.cc"
        "test/aarch32/test-assembler-cond-rd-rn-operand-rm-all-low-rd-is-rn-in-it-block-t32.cc"
        "test/aarch32/test-assembler-cond-rd-rn-operand-rm-rd-is-rn-in-it-block-t32.cc"
        "test/aarch32/test-assembler-cond-rd-rn-operand-rm-rd-is-rn-is-sp-in-it-block-t32.cc"
        "test/aarch32/test-assembler-cond-rd-rn-operand-rm-rn-is-sp-in-it-block-t32.cc"
        "test/aarch32/test-assembler-cond-rd-rn-operand-rm-ror-amount-a32.cc"
        "test/aarch32/test-assembler-cond-rd-rn-operand-rm-ror-amount-t32.cc"
        "test/aarch32/test-assembler-cond-rd-rn-operand-rm-shift-amount-1to31-a32.cc"
        "test/aarch32/test-assembler-cond-rd-rn-operand-rm-shift-amount-1to31-t32.cc"
        "test/aarch32/test-assembler-cond-rd-rn-operand-rm-shift-amount-1to32-a32.cc"
        "test/aarch32/test-assembler-cond-rd-rn-operand-rm-shift-amount-1to32-t32.cc"
        "test/aarch32/test-assembler-cond-rd-rn-operand-rm-shift-rs-a32.cc"
        "test/aarch32/test-assembler-cond-rd-rn-operand-rm-t32.cc"
        "test/aarch32/test-assembler-cond-rd-rn-rm-a32.cc"
        "test/aarch32/test-assembler-cond-rd-rn-rm-t32.cc"
        "test/aarch32/test-assembler-cond-rd-rn-t32.cc"
        "test/aarch32/test-assembler-cond-rd-sp-operand-imm8-t32.cc"
        "test/aarch32/test-assembler-cond-rdlow-operand-imm8-in-it-block-t32.cc"
        "test/aarch32/test-assembler-cond-rdlow-operand-imm8-t32.cc"
        "test/aarch32/test-assembler-cond-rdlow-rnlow-operand-immediate-imm3-in-it-block-t32.cc"
        "test/aarch32/test-assembler-cond-rdlow-rnlow-operand-immediate-imm3-t32.cc"
        "test/aarch32/test-assembler-cond-rdlow-rnlow-operand-immediate-imm8-in-it-block-t32.cc"
        "test/aarch32/test-assembler-cond-rdlow-rnlow-operand-immediate-imm8-t32.cc"
        "test/aarch32/test-assembler-cond-rdlow-rnlow-operand-immediate-zero-in-it-block-t32.cc"
        "test/aarch32/test-assembler-cond-rdlow-rnlow-operand-immediate-zero-t32.cc"
        "test/aarch32/test-assembler-cond-rdlow-rnlow-rmlow-in-it-block-t32.cc"
        "test/aarch32/test-assembler-cond-rdlow-rnlow-rmlow-t32.cc"
        "test/aarch32/test-assembler-cond-sp-sp-operand-imm7-t32.cc"
        "test/aarch32/test-assembler-negative-cond-rd-rn-operand-rm-shift-rs-a32.cc"
        "test/aarch32/test-assembler-rd-rn-rm-a32.cc"
        "test/aarch32/test-assembler-rd-rn-rm-t32.cc"
        "test/aarch32/test-disasm-a32.cc"
        "test/aarch32/test-macro-assembler-cond-rd-rn-a32.cc"
        "test/aarch32/test-macro-assembler-cond-rd-rn-pc-a32.cc"
        "test/aarch32/test-macro-assembler-cond-rd-rn-t32.cc"
        "test/aarch32/test-simulator-cond-dt-drt-drd-drn-drm-float-f64-a32.cc"
        "test/aarch32/test-simulator-cond-dt-drt-drd-drn-drm-float-f64-t32.cc"
        "test/aarch32/test-simulator-cond-rd-memop-immediate-512-a32.cc"
        "test/aarch32/test-simulator-cond-rd-memop-immediate-8192-a32.cc"
        "test/aarch32/test-simulator-cond-rd-memop-rs-a32.cc"
        "test/aarch32/test-simulator-cond-rd-memop-rs-shift-amount-1to31-a32.cc"
        "test/aarch32/test-simulator-cond-rd-memop-rs-shift-amount-1to32-a32.cc"
        "test/aarch32/test-simulator-cond-rd-operand-const-a32.cc"
        "test/aarch32/test-simulator-cond-rd-operand-const-t32.cc"
        "test/aarch32/test-simulator-cond-rd-operand-imm16-t32.cc"
        "test/aarch32/test-simulator-cond-rd-operand-rn-a32.cc"
        "test/aarch32/test-simulator-cond-rd-operand-rn-ror-amount-a32.cc"
        "test/aarch32/test-simulator-cond-rd-operand-rn-ror-amount-t32.cc"
        "test/aarch32/test-simulator-cond-rd-operand-rn-shift-amount-1to31-a32.cc"
        "test/aarch32/test-simulator-cond-rd-operand-rn-shift-amount-1to31-t32.cc"
        "test/aarch32/test-simulator-cond-rd-operand-rn-shift-amount-1to32-a32.cc"
        "test/aarch32/test-simulator-cond-rd-operand-rn-shift-amount-1to32-t32.cc"
        "test/aarch32/test-simulator-cond-rd-operand-rn-shift-rs-a32.cc"
        "test/aarch32/test-simulator-cond-rd-operand-rn-shift-rs-t32.cc"
        "test/aarch32/test-simulator-cond-rd-operand-rn-t32.cc"
        "test/aarch32/test-simulator-cond-rd-rn-a32.cc"
        "test/aarch32/test-simulator-cond-rd-rn-operand-const-a32.cc"
        "test/aarch32/test-simulator-cond-rd-rn-operand-const-t32.cc"
        "test/aarch32/test-simulator-cond-rd-rn-operand-imm12-t32.cc"
        "test/aarch32/test-simulator-cond-rd-rn-operand-rm-a32.cc"
        "test/aarch32/test-simulator-cond-rd-rn-operand-rm-ror-amount-a32.cc"
        "test/aarch32/test-simulator-cond-rd-rn-operand-rm-ror-amount-t32.cc"
        "test/aarch32/test-simulator-cond-rd-rn-operand-rm-shift-amount-1to31-a32.cc"
        "test/aarch32/test-simulator-cond-rd-rn-operand-rm-shift-amount-1to31-t32.cc"
        "test/aarch32/test-simulator-cond-rd-rn-operand-rm-shift-amount-1to32-a32.cc"
        "test/aarch32/test-simulator-cond-rd-rn-operand-rm-shift-amount-1to32-t32.cc"
        "test/aarch32/test-simulator-cond-rd-rn-operand-rm-shift-rs-a32.cc"
        "test/aarch32/test-simulator-cond-rd-rn-operand-rm-t32.cc"
        "test/aarch32/test-simulator-cond-rd-rn-rm-a32.cc"
        "test/aarch32/test-simulator-cond-rd-rn-rm-ge-a32.cc"
        "test/aarch32/test-simulator-cond-rd-rn-rm-ge-t32.cc"
        "test/aarch32/test-simulator-cond-rd-rn-rm-q-a32.cc"
        "test/aarch32/test-simulator-cond-rd-rn-rm-q-t32.cc"
        "test/aarch32/test-simulator-cond-rd-rn-rm-sel-a32.cc"
        "test/aarch32/test-simulator-cond-rd-rn-rm-sel-t32.cc"
        "test/aarch32/test-simulator-cond-rd-rn-rm-t32.cc"
        "test/aarch32/test-simulator-cond-rd-rn-t32.cc"
        "test/aarch32/test-simulator-cond-rdlow-operand-imm8-t32.cc"
        "test/aarch32/test-simulator-cond-rdlow-rnlow-operand-immediate-t32.cc"
        "test/aarch32/test-simulator-cond-rdlow-rnlow-rmlow-t32.cc"
        "test/aarch32/test-simulator-rd-rn-rm-a32.cc"
        "test/aarch32/test-simulator-rd-rn-rm-t32.cc"
        "test/aarch32/test-utils-aarch32.cc"
        "test/aarch64/test-abi.cc"
        "test/aarch64/test-api-aarch64.cc"
        "test/aarch64/test-assembler-aarch64.cc"
        "test/aarch64/test-cpu-features-aarch64.cc"
        "test/aarch64/test-disasm-aarch64.cc"
        "test/aarch64/test-fuzz-aarch64.cc"
        "test/aarch64/test-pointer-auth-aarch64.cc"
        "test/aarch64/test-simulator-aarch64.cc"
        "test/aarch64/test-trace-aarch64.cc"
        "test/aarch64/test-utils-aarch64.cc"
    ];
    data = [
        "test/test-trace-reference/log-all"
        "test/test-trace-reference/log-all-colour"
        "test/test-trace-reference/log-branch"
        "test/test-trace-reference/log-branch-colour"
        "test/test-trace-reference/log-cpufeatures"
        "test/test-trace-reference/log-cpufeatures-colour"
        "test/test-trace-reference/log-cpufeatures-custom"
        "test/test-trace-reference/log-disasm"
        "test/test-trace-reference/log-disasm-colour"
        "test/test-trace-reference/log-none"
        "test/test-trace-reference/log-none-colour"
        "test/test-trace-reference/log-regs"
        "test/test-trace-reference/log-regs-colour"
        "test/test-trace-reference/log-state"
        "test/test-trace-reference/log-state-colour"
        "test/test-trace-reference/log-sysregs"
        "test/test-trace-reference/log-sysregs-colour"
        "test/test-trace-reference/log-vregs"
        "test/test-trace-reference/log-vregs-colour"
        "test/test-trace-reference/log-write"
        "test/test-trace-reference/log-write-colour"
    ];
    enabled = false;
    target = {
        linux_glibc_x86_64 = {
            enabled = true;
        };
    };
};

in { inherit libvixl libvixld vixl-arm vixl-arm64 vixl-common vixl-debug vixl-release vixl-test-runner; }
