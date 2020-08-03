{ art_cc_binary, art_cc_defaults, art_cc_library_static, art_cc_test, cc_defaults, cc_library_headers, gensrcs }:
let

#
#  Copyright (C) 2011 The Android Open Source Project
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

libart-dex2oat-defaults = art_cc_defaults {
    name = "libart-dex2oat-defaults";
    defaults = ["art_defaults"];
    host_supported = true;
    srcs = [
        "dex/dex_to_dex_compiler.cc"
        "dex/quick_compiler_callbacks.cc"
        "driver/compiler_driver.cc"
        "linker/elf_writer.cc"
        "linker/elf_writer_quick.cc"
        "linker/image_writer.cc"
        "linker/multi_oat_relative_patcher.cc"
        "linker/oat_writer.cc"
        "linker/relative_patcher.cc"
    ];

    codegen = {
        arm = {
            srcs = [
                "linker/arm/relative_patcher_arm_base.cc"
                "linker/arm/relative_patcher_thumb2.cc"
            ];
        };
        arm64 = {
            srcs = [
                "linker/arm64/relative_patcher_arm64.cc"
            ];
        };
        mips = {
            srcs = [
                "linker/mips/relative_patcher_mips.cc"
            ];
        };
        mips64 = {
            srcs = [
                "linker/mips64/relative_patcher_mips64.cc"
            ];
        };
        x86 = {
            srcs = [
                "linker/x86/relative_patcher_x86.cc"
                "linker/x86/relative_patcher_x86_base.cc"
            ];
        };
        x86_64 = {
            srcs = [
                "linker/x86_64/relative_patcher_x86_64.cc"
            ];
        };
    };

    target = {
        android = {
            static_libs = [
                "libz"
            ];
        };
        host = {
            shared_libs = [
                "libz"
            ];
        };
    };
    generated_sources = ["art_dex2oat_operator_srcs"];
    shared_libs = [
        "libbase"
    ];
    export_include_dirs = ["."];

    #  For SHA-1 checksumming of build ID
    static = {
        whole_static_libs = ["libcrypto"];
    };
    shared = {
        shared_libs = ["libcrypto"];
    };
};

libart-dex2oat_static_base_defaults = cc_defaults {
    name = "libart-dex2oat_static_base_defaults";
    static_libs = [
        "libbase"
        "libz"
    ];
};

art_dex2oat_operator_srcs = gensrcs {
    name = "art_dex2oat_operator_srcs";
    cmd = "$(location generate_operator_out) art/dex2oat $(in) > $(out)";
    tools = ["generate_operator_out"];
    srcs = [
        "dex/dex_to_dex_compiler.h"
        "driver/compiler_driver.h"
        "linker/image_writer.h"
    ];
    output_extension = "operator_out.cc";
};

libart-dex2oat = art_cc_library_static {
    name = "libart-dex2oat";
    defaults = ["libart-dex2oat-defaults"];
    shared_libs = [
        "libart-compiler"
        "libart-dexlayout"
        "libart"
        "libartpalette"
        "libprofile"
    ];
};

libart-dex2oat_static_defaults = cc_defaults {
    name = "libart-dex2oat_static_defaults";
    defaults = [
        "libart-dex2oat_static_base_defaults"
        "libart_static_defaults"
        "libprofile_static_defaults"
    ];
    static_libs = [
        "libart-compiler"
        "libart-dexlayout"
        "libart-dex2oat"
    ];
};

libartd-dex2oat = art_cc_library_static {
    name = "libartd-dex2oat";
    defaults = [
        "art_debug_defaults"
        "libart-dex2oat-defaults"
    ];
    shared_libs = [
        "libartd-compiler"
        "libartd-dexlayout"
        "libartd"
        "libartpalette"
        "libprofiled"
    ];
};

libartd-dex2oat_static_defaults = cc_defaults {
    name = "libartd-dex2oat_static_defaults";
    defaults = [
        "libart-dex2oat_static_base_defaults"
        "libartd_static_defaults"
        "libprofiled_static_defaults"
    ];
    static_libs = [
        "libartd-compiler"
        "libartd-dexlayout"
        "libartd-dex2oat"
    ];
};

dex2oat_headers = cc_library_headers {
    name = "dex2oat_headers";
    host_supported = true;
    export_include_dirs = ["include"];
};

dex2oat-defaults = cc_defaults {
    name = "dex2oat-defaults";
    host_supported = true;
    defaults = ["art_defaults"];
    srcs = [
        "dex2oat_options.cc"
        "dex2oat.cc"
    ];

    target = {
        android = {
            #  Use the 32-bit version of dex2oat on devices.
            compile_multilib = "prefer32";
        };
    };
    header_libs = [
        "dex2oat_headers"
        "art_cmdlineparser_headers"
    ];
};

dex2oat-pgo-defaults = cc_defaults {
    name = "dex2oat-pgo-defaults";
    pgo = {
        instrumentation = true;
        benchmarks = ["dex2oat"];
    };
    target = {
        android_arm64 = {
            pgo = {
                profile_file = "art/dex2oat_arm_arm64.profdata";
            };
        };
        android_arm = {
            pgo = {
                profile_file = "art/dex2oat_arm_arm64.profdata";
            };
        };
        android_x86_64 = {
            pgo = {
                profile_file = "art/dex2oat_x86_x86_64.profdata";
            };
        };
        android_x86 = {
            pgo = {
                profile_file = "art/dex2oat_x86_x86_64.profdata";
            };
        };
        android_mips64 = {
            pgo = {
                profile_file = "art/dex2oat_mips_mips64.profdata";
            };
        };
        android_mips = {
            pgo = {
                profile_file = "art/dex2oat_mips_mips64.profdata";
            };
        };
    };
};

dex2oat = art_cc_binary {
    name = "dex2oat";
    defaults = [
        "dex2oat-defaults"
        "dex2oat-pgo-defaults"
    ];
    shared_libs = [
        "libprofile"
        "libart-compiler"
        "libart-dexlayout"
        "libart"
        "libdexfile"
        "libartbase"
        "libartpalette"
        "libbase"
        "libsigchain"
    ];
    static_libs = [
        "libart-dex2oat"
    ];

    pgo = {
        #  Additional cflags just for dex2oat during PGO instrumentation
        cflags = [
            #  Ignore frame-size increase resulting from instrumentation.
            "-Wno-frame-larger-than="
            "-DART_PGO_INSTRUMENTATION"
        ];
    };
    target = {
        android = {
            lto = {
                thin = true;
            };
            static_libs = [
                "libz"
            ];
        };
        host = {
            shared_libs = [
                "libz"
            ];
        };
    };
};

dex2oatd = art_cc_binary {
    name = "dex2oatd";
    defaults = [
        "art_debug_defaults"
        "dex2oat-defaults"
    ];
    shared_libs = [
        "libprofiled"
        "libartd-compiler"
        "libartd-dexlayout"
        "libartd"
        "libdexfiled"
        "libartbased"
        "libartpalette"
        "libbase"
        "libsigchain"
    ];
    static_libs = [
        "libartd-dex2oat"
    ];
    target = {
        android = {
            static_libs = [
                "libz"
            ];
            compile_multilib = "prefer32";
        };
        host = {
            shared_libs = [
                "libz"
            ];
            compile_multilib = "both";
            symlink_preferred_arch = true;
        };
        linux_glibc_x86 = {
            suffix = "32";
        };
        linux_glibc_x86_64 = {
            suffix = "64";
        };
        linux_bionic_x86_64 = {
            suffix = "64";
        };
    };
};

dex2oats-defaults = cc_defaults {
    name = "dex2oats-defaults";
    device_supported = false;
    static_executable = true;
    defaults = [
        "dex2oat-defaults"
    ];
    target = {
        darwin = {
            enabled = false;
        };
    };
    ldflags = [
        #  We need this because GC stress mode makes use of
        #  _Unwind_GetIP and _Unwind_Backtrace and the symbols are also
        #  defined in libgcc_eh.a(unwind-dw2.o)
        #  TODO: Having this is not ideal as it might obscure errors.
        #  Try to get rid of it.
        "-z muldefs"
    ];
    static_libs = [
        "libbase"
        "libsigchain_dummy"
        "libz"
    ];
};

dex2oats = art_cc_binary {
    name = "dex2oats";
    defaults = [
        "dex2oats-defaults"
        "libart_static_defaults"
        "libart-compiler_static_defaults"
        "libart-dexlayout_static_defaults"
        "libartbase_static_defaults"
        "libdexfile_static_defaults"
        "libprofile_static_defaults"
        "libart-dex2oat_static_defaults"
    ];
};

dex2oatds = art_cc_binary {
    name = "dex2oatds";
    defaults = [
        "art_debug_defaults"
        "dex2oats-defaults"
        "libartd_static_defaults"
        "libartd-compiler_static_defaults"
        "libartd-dexlayout_static_defaults"
        "libartbased_static_defaults"
        "libdexfiled_static_defaults"
        "libprofiled_static_defaults"
        "libartd-dex2oat_static_defaults"
    ];
    target = {
        linux_glibc_x86_64 = {
            use_clang_lld = true;
        };
    };
};

libart-dex2oat-gtest = art_cc_library_static {
    name = "libart-dex2oat-gtest";
    defaults = ["libart-gtest-defaults"];
    srcs = [
        "common_compiler_driver_test.cc"
    ];
    shared_libs = [
        "libartd-compiler"
        "libartd-disassembler"
        "libart-compiler-gtest"
        "libart-runtime-gtest"
        "libbase"
    ];
    static_libs = [
        "libartd-dex2oat"
    ];
};

art_dex2oat_tests = art_cc_test {
    name = "art_dex2oat_tests";
    defaults = [
        "art_gtest_defaults"
    ];
    srcs = [
        "dex2oat_test.cc"
        "dex2oat_image_test.cc"
        "dex/dex_to_dex_decompiler_test.cc"
        "driver/compiler_driver_test.cc"
        "linker/elf_writer_test.cc"
        "linker/image_test.cc"
        "linker/image_write_read_test.cc"
        "linker/index_bss_mapping_encoder_test.cc"
        "linker/multi_oat_relative_patcher_test.cc"
        "linker/oat_writer_test.cc"
        "verifier_deps_test.cc"
    ];

    codegen = {
        arm = {
            srcs = [
                "linker/arm/relative_patcher_thumb2_test.cc"
            ];
        };
        arm64 = {
            srcs = [
                "linker/arm64/relative_patcher_arm64_test.cc"
            ];
        };
        mips = {
            srcs = [
                "linker/mips/relative_patcher_mips_test.cc"
                "linker/mips/relative_patcher_mips32r6_test.cc"
            ];
        };
        mips64 = {
            srcs = [
                "linker/mips64/relative_patcher_mips64_test.cc"
            ];
        };
        x86 = {
            srcs = [
                "linker/x86/relative_patcher_x86_test.cc"
            ];
        };
        x86_64 = {
            srcs = [
                "linker/x86_64/relative_patcher_x86_64_test.cc"
            ];
        };
    };

    header_libs = ["dex2oat_headers"];
    include_dirs = [
        "external/zlib"
    ];
    shared_libs = [
        "libartbased"
        "libartd-compiler"
        "libartd-dexlayout"
        "libartpalette"
        "libbase"
        "libprofiled"
        "libsigchain"
        "libziparchive"
    ];
    static_libs = [
        "libart-dex2oat-gtest"
        "libartd-dex2oat"
    ];
};

in { inherit art_dex2oat_operator_srcs art_dex2oat_tests dex2oat dex2oat-defaults dex2oat-pgo-defaults dex2oat_headers dex2oatd dex2oatds dex2oats dex2oats-defaults libart-dex2oat libart-dex2oat-defaults libart-dex2oat-gtest libart-dex2oat_static_base_defaults libart-dex2oat_static_defaults libartd-dex2oat libartd-dex2oat_static_defaults; }
