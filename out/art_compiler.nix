{ art_cc_defaults, art_cc_library, art_cc_test, cc_defaults, gensrcs }:
let

#
#  Copyright (C) 2012 The Android Open Source Project
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

#  TODO We should really separate out those files that are actually needed for both variants of an
#  architecture into its own category. Currently we just include all of the 32bit variant in the
#  64bit variant. It also might be good to allow one to compile only the 64bit variant without the
#  32bit one.

libart-compiler-defaults = art_cc_defaults {
    name = "libart-compiler-defaults";
    defaults = ["art_defaults"];
    host_supported = true;
    srcs = [
        "compiled_method.cc"
        "debug/elf_debug_writer.cc"
        "dex/inline_method_analyser.cc"
        "dex/verified_method.cc"
        "dex/verification_results.cc"
        "driver/compiled_method_storage.cc"
        "driver/compiler_options.cc"
        "driver/dex_compilation_unit.cc"
        "jit/jit_compiler.cc"
        "jit/jit_logger.cc"
        "jni/quick/calling_convention.cc"
        "jni/quick/jni_compiler.cc"
        "optimizing/block_builder.cc"
        "optimizing/bounds_check_elimination.cc"
        "optimizing/builder.cc"
        "optimizing/cha_guard_optimization.cc"
        "optimizing/code_generator.cc"
        "optimizing/code_generator_utils.cc"
        "optimizing/code_sinking.cc"
        "optimizing/constant_folding.cc"
        "optimizing/constructor_fence_redundancy_elimination.cc"
        "optimizing/data_type.cc"
        "optimizing/dead_code_elimination.cc"
        "optimizing/escape.cc"
        "optimizing/graph_checker.cc"
        "optimizing/graph_visualizer.cc"
        "optimizing/gvn.cc"
        "optimizing/induction_var_analysis.cc"
        "optimizing/induction_var_range.cc"
        "optimizing/inliner.cc"
        "optimizing/instruction_builder.cc"
        "optimizing/instruction_simplifier.cc"
        "optimizing/intrinsic_objects.cc"
        "optimizing/intrinsics.cc"
        "optimizing/licm.cc"
        "optimizing/linear_order.cc"
        "optimizing/load_store_analysis.cc"
        "optimizing/load_store_elimination.cc"
        "optimizing/locations.cc"
        "optimizing/loop_analysis.cc"
        "optimizing/loop_optimization.cc"
        "optimizing/nodes.cc"
        "optimizing/optimization.cc"
        "optimizing/optimizing_compiler.cc"
        "optimizing/parallel_move_resolver.cc"
        "optimizing/prepare_for_register_allocation.cc"
        "optimizing/reference_type_propagation.cc"
        "optimizing/register_allocation_resolver.cc"
        "optimizing/register_allocator.cc"
        "optimizing/register_allocator_graph_color.cc"
        "optimizing/register_allocator_linear_scan.cc"
        "optimizing/select_generator.cc"
        "optimizing/scheduler.cc"
        "optimizing/sharpening.cc"
        "optimizing/side_effects_analysis.cc"
        "optimizing/ssa_builder.cc"
        "optimizing/ssa_liveness_analysis.cc"
        "optimizing/ssa_phi_elimination.cc"
        "optimizing/stack_map_stream.cc"
        "optimizing/superblock_cloner.cc"
        "trampolines/trampoline_compiler.cc"
        "utils/assembler.cc"
        "utils/jni_macro_assembler.cc"
        "utils/swap_space.cc"
        "compiler.cc"
    ];

    codegen = {
        arm = {
            srcs = [
                "jni/quick/arm/calling_convention_arm.cc"
                "optimizing/code_generator_arm_vixl.cc"
                "optimizing/code_generator_vector_arm_vixl.cc"
                "optimizing/instruction_simplifier_arm.cc"
                "optimizing/instruction_simplifier_shared.cc"
                "optimizing/intrinsics_arm_vixl.cc"
                "optimizing/nodes_shared.cc"
                "optimizing/scheduler_arm.cc"
                "utils/arm/assembler_arm_vixl.cc"
                "utils/arm/constants_arm.cc"
                "utils/arm/jni_macro_assembler_arm_vixl.cc"
                "utils/arm/managed_register_arm.cc"
            ];
        };
        arm64 = {
            srcs = [
                "jni/quick/arm64/calling_convention_arm64.cc"
                "optimizing/code_generator_arm64.cc"
                "optimizing/code_generator_vector_arm64.cc"
                "optimizing/scheduler_arm64.cc"
                "optimizing/instruction_simplifier_arm64.cc"
                "optimizing/intrinsics_arm64.cc"
                "utils/arm64/assembler_arm64.cc"
                "utils/arm64/jni_macro_assembler_arm64.cc"
                "utils/arm64/managed_register_arm64.cc"
            ];
        };
        mips = {
            srcs = [
                "jni/quick/mips/calling_convention_mips.cc"
                "optimizing/code_generator_mips.cc"
                "optimizing/code_generator_vector_mips.cc"
                "optimizing/instruction_simplifier_mips.cc"
                "optimizing/intrinsics_mips.cc"
                "optimizing/pc_relative_fixups_mips.cc"
                "utils/mips/assembler_mips.cc"
                "utils/mips/managed_register_mips.cc"
            ];
        };
        mips64 = {
            srcs = [
                "jni/quick/mips64/calling_convention_mips64.cc"
                "optimizing/code_generator_mips64.cc"
                "optimizing/code_generator_vector_mips64.cc"
                "optimizing/intrinsics_mips64.cc"
                "utils/mips64/assembler_mips64.cc"
                "utils/mips64/managed_register_mips64.cc"
            ];
        };
        x86 = {
            srcs = [
                "jni/quick/x86/calling_convention_x86.cc"
                "optimizing/code_generator_x86.cc"
                "optimizing/code_generator_vector_x86.cc"
                "optimizing/intrinsics_x86.cc"
                "optimizing/instruction_simplifier_x86_shared.cc"
                "optimizing/instruction_simplifier_x86.cc"
                "optimizing/pc_relative_fixups_x86.cc"
                "optimizing/x86_memory_gen.cc"
                "utils/x86/assembler_x86.cc"
                "utils/x86/jni_macro_assembler_x86.cc"
                "utils/x86/managed_register_x86.cc"
            ];
        };
        x86_64 = {
            srcs = [
                "jni/quick/x86_64/calling_convention_x86_64.cc"
                "optimizing/intrinsics_x86_64.cc"
                "optimizing/instruction_simplifier_x86_64.cc"
                "optimizing/code_generator_x86_64.cc"
                "optimizing/code_generator_vector_x86_64.cc"
                "utils/x86_64/assembler_x86_64.cc"
                "utils/x86_64/jni_macro_assembler_x86_64.cc"
                "utils/x86_64/managed_register_x86_64.cc"
            ];
        };
    };
    generated_sources = ["art_compiler_operator_srcs"];
    shared_libs = [
        "libbase"
    ];
    include_dirs = ["art/disassembler"];
    header_libs = [
        "art_cmdlineparser_headers" #  For compiler_options.
        "libnativehelper_header_only"
    ];

    export_include_dirs = ["."];
};

libart-compiler_static_base_defaults = cc_defaults {
    name = "libart-compiler_static_base_defaults";
    static_libs = [
        "libbase"
    ];
};

art_compiler_operator_srcs = gensrcs {
    name = "art_compiler_operator_srcs";
    cmd = "$(location generate_operator_out) art/compiler $(in) > $(out)";
    tools = ["generate_operator_out"];
    srcs = [
        "driver/compiler_options.h"
        "linker/linker_patch.h"
        "optimizing/locations.h"
        "optimizing/optimizing_compiler_stats.h"

        "utils/arm/constants_arm.h"
        "utils/mips/assembler_mips.h"
        "utils/mips64/assembler_mips64.h"
    ];
    output_extension = "operator_out.cc";
};

libart-compiler = art_cc_library {
    name = "libart-compiler";
    defaults = [
        "libart-compiler-defaults"
        "dex2oat-pgo-defaults"
    ];
    codegen = {
        arm = {
            #  VIXL assembly support for ARM targets.
            static = {
                whole_static_libs = [
                    "libvixl"
                ];
            };
            shared = {
                shared_libs = [
                    "libvixl"
                ];
            };
        };
        arm64 = {
            #  VIXL assembly support for ARM64 targets.
            static = {
                whole_static_libs = [
                    "libvixl"
                ];
            };
            shared = {
                shared_libs = [
                    "libvixl"
                ];
            };
        };
    };
    shared_libs = [
        "libart"
        "libartbase"
        "libartpalette"
        "libprofile"
        "libdexfile"
    ];
    whole_static_libs = ["libelffile"];

    target = {
        android = {
            lto = {
                thin = true;
            };
        };
    };
};

libart-compiler_static_defaults = cc_defaults {
    name = "libart-compiler_static_defaults";
    defaults = [
        "libart-compiler_static_base_defaults"
        "libart_static_defaults"
        "libartbase_static_defaults"
        "libdexfile_static_defaults"
        "libprofile_static_defaults"
    ];
    static_libs = ["libart-compiler"];
};

libartd-compiler = art_cc_library {
    name = "libartd-compiler";
    defaults = [
        "art_debug_defaults"
        "libart-compiler-defaults"
    ];
    codegen = {
        arm = {
            #  VIXL assembly support for ARM targets.
            static = {
                whole_static_libs = [
                    "libvixld"
                ];
            };
            shared = {
                shared_libs = [
                    "libvixld"
                ];
            };
        };
        arm64 = {
            #  VIXL assembly support for ARM64 targets.
            static = {
                whole_static_libs = [
                    "libvixld"
                ];
            };
            shared = {
                shared_libs = [
                    "libvixld"
                ];
            };
        };
    };
    shared_libs = [
        "libartbased"
        "libartd"
        "libartpalette"
        "libprofiled"
        "libdexfiled"
    ];
    whole_static_libs = ["libelffiled"];
};

libartd-compiler_static_defaults = cc_defaults {
    name = "libartd-compiler_static_defaults";
    defaults = [
        "libart-compiler_static_base_defaults"
        "libartd_static_defaults"
        "libartbased_static_defaults"
        "libdexfiled_static_defaults"
        "libprofiled_static_defaults"
    ];
    static_libs = ["libartd-compiler"];
};

libart-compiler-gtest = art_cc_library {
    name = "libart-compiler-gtest";
    defaults = ["libart-gtest-defaults"];
    srcs = [
        "common_compiler_test.cc"
    ];
    shared_libs = [
        "libartd-compiler"
        "libartd-disassembler"
        "libartbase-art-gtest"
        "libart-runtime-gtest"
        "libbase"
    ];
};

art_compiler_tests = art_cc_test {
    name = "art_compiler_tests";
    defaults = [
        "art_gtest_defaults"
    ];
    srcs = [
        "debug/dwarf/dwarf_test.cc"
        "debug/src_map_elem_test.cc"
        "driver/compiled_method_storage_test.cc"
        "exception_test.cc"
        "jni/jni_compiler_test.cc"
        "linker/linker_patch_test.cc"
        "linker/output_stream_test.cc"
        "optimizing/bounds_check_elimination_test.cc"
        "optimizing/superblock_cloner_test.cc"
        "optimizing/data_type_test.cc"
        "optimizing/dominator_test.cc"
        "optimizing/find_loops_test.cc"
        "optimizing/graph_checker_test.cc"
        "optimizing/graph_test.cc"
        "optimizing/gvn_test.cc"
        "optimizing/induction_var_analysis_test.cc"
        "optimizing/induction_var_range_test.cc"
        "optimizing/licm_test.cc"
        "optimizing/live_interval_test.cc"
        "optimizing/loop_optimization_test.cc"
        "optimizing/nodes_test.cc"
        "optimizing/nodes_vector_test.cc"
        "optimizing/parallel_move_test.cc"
        "optimizing/pretty_printer_test.cc"
        "optimizing/reference_type_propagation_test.cc"
        "optimizing/select_generator_test.cc"
        "optimizing/side_effects_test.cc"
        "optimizing/ssa_liveness_analysis_test.cc"
        "optimizing/ssa_test.cc"
        "optimizing/stack_map_test.cc"
        "optimizing/suspend_check_test.cc"
        "utils/atomic_dex_ref_map_test.cc"
        "utils/dedupe_set_test.cc"
        "utils/intrusive_forward_list_test.cc"
        "utils/swap_space_test.cc"

        "jni/jni_cfi_test.cc"
        "optimizing/codegen_test.cc"
        "optimizing/load_store_analysis_test.cc"
        "optimizing/optimizing_cfi_test.cc"
        "optimizing/scheduler_test.cc"
    ];

    codegen = {
        arm = {
            srcs = [
                "utils/arm/managed_register_arm_test.cc"
            ];
        };
        arm64 = {
            srcs = [
                "utils/arm64/managed_register_arm64_test.cc"
            ];
        };
        mips = {
            srcs = [
            ];
        };
        mips64 = {
            srcs = [
                "utils/mips64/managed_register_mips64_test.cc"
            ];
        };
        x86 = {
            srcs = [
                "utils/x86/managed_register_x86_test.cc"

                #  These tests are testing architecture-independent
                #  functionality, but happen to use x86 codegen as part of the
                #  test.
                "optimizing/constant_folding_test.cc"
                "optimizing/dead_code_elimination_test.cc"
                "optimizing/linearize_test.cc"
                "optimizing/live_ranges_test.cc"
                "optimizing/liveness_test.cc"
                "optimizing/register_allocator_test.cc"
            ];
        };
        x86_64 = {
            srcs = [
                #  Is this test a bit-rotten copy of the x86 test? b/77951326
                #  "utils/x86_64/managed_register_x86_64_test.cc",
            ];
        };
    };

    header_libs = [
        "libart_simulator_headers"
        "libnativehelper_header_only"
    ];

    shared_libs = [
        "libprofiled"
        "libartd-compiler"
        "libartd-simulator-container"
        "libvixld"

        "libbacktrace"
        "libnativeloader"
    ];

    include_dirs = [
        "external/zlib"
    ];

    target = {
        host = {
            shared_libs = [
                "libartd-simulator"
            ];
        };
    };
};

art_compiler_host_tests = art_cc_test {
    name = "art_compiler_host_tests";
    device_supported = false;
    defaults = [
        "art_gtest_defaults"
    ];
    codegen = {
        arm = {
            srcs = [
                "utils/assembler_thumb_test.cc"
            ];
        };
        mips = {
            srcs = [
                "optimizing/emit_swap_mips_test.cc"
                "utils/mips/assembler_mips_test.cc"
                "utils/mips/assembler_mips32r5_test.cc"
                "utils/mips/assembler_mips32r6_test.cc"
            ];
        };
        mips64 = {
            srcs = [
                "utils/mips64/assembler_mips64_test.cc"
            ];
        };
        x86 = {
            srcs = [
                "utils/x86/assembler_x86_test.cc"
            ];
        };
        x86_64 = {
            srcs = [
                "utils/x86_64/assembler_x86_64_test.cc"
            ];
        };
    };
    shared_libs = [
        "libartd-compiler"
        "libvixld"
    ];
};

in { inherit art_compiler_host_tests art_compiler_operator_srcs art_compiler_tests libart-compiler libart-compiler-defaults libart-compiler-gtest libart-compiler_static_base_defaults libart-compiler_static_defaults libartd-compiler libartd-compiler_static_defaults; }
