{ cc_library, genrule }:
let

#  genrules were obtained from the CMake build:
#  $ cmake .. -G Ninja -DCMAKE_BUILD_TYPE=Debug
#  $ ninja -v -j 1 >log.log
#  Find Python invocations.
#  Use regex replacements to get "cmd:" lines below.

deqp_spvtools_generate_grammar_tables = genrule {
    name = "deqp_spvtools_generate_grammar_tables";
    out = [
        "core.insts-unified1.inc"
        "debuginfo.insts.inc"
        "enum_string_mapping.inc"
        "extension_enum.inc"
        "glsl.std.450.insts.inc"
        "opencl.debuginfo.100.insts.inc"
        "opencl.std.insts.inc"
        "operand.kinds-unified1.inc"
        "spv-amd-gcn-shader.insts.inc"
        "spv-amd-shader-ballot.insts.inc"
        "spv-amd-shader-explicit-vertex-parameter.insts.inc"
        "spv-amd-shader-trinary-minmax.insts.inc"
    ];
    srcs = [
        ":deqp_spirv_headers_unified1_extinst.glsl.std.450.grammar.json"
        ":deqp_spirv_headers_unified1_extinst.opencl.std.100.grammar.json"
        ":deqp_spirv_headers_unified1_spirv.core.grammar.json"
        "source/extinst.debuginfo.grammar.json"
        "source/extinst.opencl.debuginfo.100.grammar.json"
        "source/extinst.spv-amd-gcn-shader.grammar.json"
        "source/extinst.spv-amd-shader-ballot.grammar.json"
        "source/extinst.spv-amd-shader-explicit-vertex-parameter.grammar.json"
        "source/extinst.spv-amd-shader-trinary-minmax.grammar.json"
    ];
    tool_files = ["utils/generate_grammar_tables.py"];
    cmd = "$(location) --extinst-vendor-grammar=$(location source/extinst.spv-amd-gcn-shader.grammar.json) --vendor-insts-output=$(location spv-amd-gcn-shader.insts.inc) --vendor-operand-kind-prefix=; " +
        "$(location) --spirv-core-grammar=$(location :deqp_spirv_headers_unified1_spirv.core.grammar.json) --extinst-debuginfo-grammar=$(location source/extinst.debuginfo.grammar.json) --extinst-cldebuginfo100-grammar=$(location source/extinst.opencl.debuginfo.100.grammar.json) --core-insts-output=$(location core.insts-unified1.inc) --operand-kinds-output=$(location operand.kinds-unified1.inc); " +
        "$(location) --extinst-vendor-grammar=$(location source/extinst.debuginfo.grammar.json) --vendor-insts-output=$(location debuginfo.insts.inc) --vendor-operand-kind-prefix=; " +
        "$(location) --extinst-vendor-grammar=$(location source/extinst.spv-amd-shader-ballot.grammar.json) --vendor-insts-output=$(location spv-amd-shader-ballot.insts.inc) --vendor-operand-kind-prefix=; " +
        "$(location) --extinst-vendor-grammar=$(location source/extinst.spv-amd-shader-explicit-vertex-parameter.grammar.json) --vendor-insts-output=$(location spv-amd-shader-explicit-vertex-parameter.insts.inc) --vendor-operand-kind-prefix=; " +
        "$(location) --extinst-vendor-grammar=$(location source/extinst.spv-amd-shader-trinary-minmax.grammar.json) --vendor-insts-output=$(location spv-amd-shader-trinary-minmax.insts.inc) --vendor-operand-kind-prefix=; " +
        "$(location) --extinst-vendor-grammar=$(location source/extinst.opencl.debuginfo.100.grammar.json) --vendor-insts-output=$(location opencl.debuginfo.100.insts.inc) --vendor-operand-kind-prefix=CLDEBUG100_; " +
        "$(location) --spirv-core-grammar=$(location :deqp_spirv_headers_unified1_spirv.core.grammar.json) --extinst-debuginfo-grammar=$(location source/extinst.debuginfo.grammar.json) --extinst-cldebuginfo100-grammar=$(location source/extinst.opencl.debuginfo.100.grammar.json) --extension-enum-output=$(location extension_enum.inc) --enum-string-mapping-output=$(location enum_string_mapping.inc); " +
        "$(location) --extinst-opencl-grammar=$(location :deqp_spirv_headers_unified1_extinst.opencl.std.100.grammar.json) --opencl-insts-output=$(location opencl.std.insts.inc); " +
        "$(location) --extinst-glsl-grammar=$(location :deqp_spirv_headers_unified1_extinst.glsl.std.450.grammar.json) --glsl-insts-output=$(location glsl.std.450.insts.inc); ";
};

deqp_spvtools_generate_language_headers = genrule {
    name = "deqp_spvtools_generate_language_headers";
    out = [
        "DebugInfo.h"
        "OpenCLDebugInfo100.h"
    ];
    srcs = [
        "source/extinst.debuginfo.grammar.json"
        "source/extinst.opencl.debuginfo.100.grammar.json"
    ];
    tool_files = ["utils/generate_language_headers.py"];
    cmd = "$(location) --extinst-grammar=$(location source/extinst.debuginfo.grammar.json) --extinst-output-path=$(location DebugInfo.h); " +
        "$(location) --extinst-grammar=$(location source/extinst.opencl.debuginfo.100.grammar.json) --extinst-output-path=$(location OpenCLDebugInfo100.h); ";
};

deqp_spvtools_generate_registry_tables = genrule {
    name = "deqp_spvtools_generate_registry_tables";
    out = [
        "generators.inc"
    ];
    srcs = [
        ":deqp_spirv_headers_spir-v.xml"
    ];
    tool_files = ["utils/generate_registry_tables.py"];
    cmd = "$(location) --xml=$(location :deqp_spirv_headers_spir-v.xml) --generator-output=$(location generators.inc)";
};

deqp_spvtools_update_build_version = genrule { #  FIXME this relies on `git` which is no good on build machines
    name = "deqp_spvtools_update_build_version";
    out = ["build-version.inc"];
    srcs = ["CHANGES"];
    tool_files = ["utils/update_build_version.py"];
    cmd = "$(location) $$(dirname $(location CHANGES)) " +
        "$(location build-version.inc)";
};

deqp_spirv-tools = cc_library {
    name = "deqp_spirv-tools";
    sdk_version = "27";
    srcs = [
        "source/assembly_grammar.cpp"
        "source/binary.cpp"
        "source/diagnostic.cpp"
        "source/disassemble.cpp"
        "source/enum_string_mapping.cpp"
        "source/ext_inst.cpp"
        "source/extensions.cpp"
        "source/libspirv.cpp"
        "source/name_mapper.cpp"
        "source/opcode.cpp"
        "source/operand.cpp"
        "source/parsed_operand.cpp"
        "source/pch_source.cpp"
        "source/print.cpp"
        "source/software_version.cpp"
        "source/spirv_endian.cpp"
        "source/spirv_fuzzer_options.cpp"
        "source/spirv_optimizer_options.cpp"
        "source/spirv_reducer_options.cpp"
        "source/spirv_target_env.cpp"
        "source/spirv_validator_options.cpp"
        "source/table.cpp"
        "source/text.cpp"
        "source/text_handler.cpp"
        "source/util/bit_vector.cpp"
        "source/util/parse_number.cpp"
        "source/util/string_utils.cpp"
        "source/util/timer.cpp"
        "source/val/basic_block.cpp"
        "source/val/construct.cpp"
        "source/val/function.cpp"
        "source/val/instruction.cpp"
        "source/val/validate.cpp"
        "source/val/validate_adjacency.cpp"
        "source/val/validate_annotation.cpp"
        "source/val/validate_arithmetics.cpp"
        "source/val/validate_atomics.cpp"
        "source/val/validate_barriers.cpp"
        "source/val/validate_bitwise.cpp"
        "source/val/validate_builtins.cpp"
        "source/val/validate_capability.cpp"
        "source/val/validate_cfg.cpp"
        "source/val/validate_composites.cpp"
        "source/val/validate_constants.cpp"
        "source/val/validate_conversion.cpp"
        "source/val/validate_debug.cpp"
        "source/val/validate_decorations.cpp"
        "source/val/validate_derivatives.cpp"
        "source/val/validate_execution_limitations.cpp"
        "source/val/validate_extensions.cpp"
        "source/val/validate_function.cpp"
        "source/val/validate_id.cpp"
        "source/val/validate_image.cpp"
        "source/val/validate_instruction.cpp"
        "source/val/validate_interfaces.cpp"
        "source/val/validate_layout.cpp"
        "source/val/validate_literals.cpp"
        "source/val/validate_logicals.cpp"
        "source/val/validate_memory.cpp"
        "source/val/validate_memory_semantics.cpp"
        "source/val/validate_misc.cpp"
        "source/val/validate_mode_setting.cpp"
        "source/val/validate_non_uniform.cpp"
        "source/val/validate_primitives.cpp"
        "source/val/validate_scopes.cpp"
        "source/val/validate_small_type_uses.cpp"
        "source/val/validate_type.cpp"
        "source/val/validation_state.cpp"
        "source/opt/aggressive_dead_code_elim_pass.cpp"
        "source/opt/amd_ext_to_khr.cpp"
        "source/opt/basic_block.cpp"
        "source/opt/block_merge_pass.cpp"
        "source/opt/block_merge_util.cpp"
        "source/opt/build_module.cpp"
        "source/opt/ccp_pass.cpp"
        "source/opt/cfg.cpp"
        "source/opt/cfg_cleanup_pass.cpp"
        "source/opt/code_sink.cpp"
        "source/opt/combine_access_chains.cpp"
        "source/opt/compact_ids_pass.cpp"
        "source/opt/composite.cpp"
        "source/opt/const_folding_rules.cpp"
        "source/opt/constants.cpp"
        "source/opt/convert_to_half_pass.cpp"
        "source/opt/copy_prop_arrays.cpp"
        "source/opt/dead_branch_elim_pass.cpp"
        "source/opt/dead_insert_elim_pass.cpp"
        "source/opt/dead_variable_elimination.cpp"
        "source/opt/decompose_initialized_variables_pass.cpp"
        "source/opt/decoration_manager.cpp"
        "source/opt/def_use_manager.cpp"
        "source/opt/desc_sroa.cpp"
        "source/opt/dominator_analysis.cpp"
        "source/opt/dominator_tree.cpp"
        "source/opt/eliminate_dead_constant_pass.cpp"
        "source/opt/eliminate_dead_functions_pass.cpp"
        "source/opt/eliminate_dead_functions_util.cpp"
        "source/opt/eliminate_dead_members_pass.cpp"
        "source/opt/feature_manager.cpp"
        "source/opt/fix_storage_class.cpp"
        "source/opt/flatten_decoration_pass.cpp"
        "source/opt/fold.cpp"
        "source/opt/fold_spec_constant_op_and_composite_pass.cpp"
        "source/opt/folding_rules.cpp"
        "source/opt/freeze_spec_constant_value_pass.cpp"
        "source/opt/function.cpp"
        "source/opt/generate_webgpu_initializers_pass.cpp"
        "source/opt/graphics_robust_access_pass.cpp"
        "source/opt/if_conversion.cpp"
        "source/opt/inline_exhaustive_pass.cpp"
        "source/opt/inline_opaque_pass.cpp"
        "source/opt/inline_pass.cpp"
        "source/opt/inst_bindless_check_pass.cpp"
        "source/opt/inst_buff_addr_check_pass.cpp"
        "source/opt/inst_debug_printf_pass.cpp"
        "source/opt/instruction.cpp"
        "source/opt/instruction_list.cpp"
        "source/opt/instrument_pass.cpp"
        "source/opt/ir_context.cpp"
        "source/opt/ir_loader.cpp"
        "source/opt/legalize_vector_shuffle_pass.cpp"
        "source/opt/licm_pass.cpp"
        "source/opt/local_access_chain_convert_pass.cpp"
        "source/opt/local_redundancy_elimination.cpp"
        "source/opt/local_single_block_elim_pass.cpp"
        "source/opt/local_single_store_elim_pass.cpp"
        "source/opt/loop_dependence.cpp"
        "source/opt/loop_dependence_helpers.cpp"
        "source/opt/loop_descriptor.cpp"
        "source/opt/loop_fission.cpp"
        "source/opt/loop_fusion.cpp"
        "source/opt/loop_fusion_pass.cpp"
        "source/opt/loop_peeling.cpp"
        "source/opt/loop_unroller.cpp"
        "source/opt/loop_unswitch_pass.cpp"
        "source/opt/loop_utils.cpp"
        "source/opt/mem_pass.cpp"
        "source/opt/merge_return_pass.cpp"
        "source/opt/module.cpp"
        "source/opt/optimizer.cpp"
        "source/opt/pass.cpp"
        "source/opt/pass_manager.cpp"
        "source/opt/pch_source_opt.cpp"
        "source/opt/private_to_local_pass.cpp"
        "source/opt/process_lines_pass.cpp"
        "source/opt/propagator.cpp"
        "source/opt/reduce_load_size.cpp"
        "source/opt/redundancy_elimination.cpp"
        "source/opt/register_pressure.cpp"
        "source/opt/relax_float_ops_pass.cpp"
        "source/opt/remove_duplicates_pass.cpp"
        "source/opt/replace_invalid_opc.cpp"
        "source/opt/scalar_analysis.cpp"
        "source/opt/scalar_analysis_simplification.cpp"
        "source/opt/scalar_replacement_pass.cpp"
        "source/opt/set_spec_constant_default_value_pass.cpp"
        "source/opt/simplification_pass.cpp"
        "source/opt/split_invalid_unreachable_pass.cpp"
        "source/opt/ssa_rewrite_pass.cpp"
        "source/opt/strength_reduction_pass.cpp"
        "source/opt/strip_atomic_counter_memory_pass.cpp"
        "source/opt/strip_debug_info_pass.cpp"
        "source/opt/strip_reflect_info_pass.cpp"
        "source/opt/struct_cfg_analysis.cpp"
        "source/opt/type_manager.cpp"
        "source/opt/types.cpp"
        "source/opt/unify_const_pass.cpp"
        "source/opt/upgrade_memory_model.cpp"
        "source/opt/value_number_table.cpp"
        "source/opt/vector_dce.cpp"
        "source/opt/workaround1209.cpp"
        "source/opt/wrap_opkill.cpp"
    ];
    local_include_dirs = [
        "source"
    ];
    export_include_dirs = [
        "include"
    ];
    include_dirs = [
        "external/deqp-deps/SPIRV-Headers/include"
    ];
    generated_headers = [
        "deqp_spvtools_generate_grammar_tables"
        "deqp_spvtools_generate_language_headers"
        "deqp_spvtools_update_build_version"
        "deqp_spvtools_generate_registry_tables"
    ];
    stl = "libc++_static";
    cppflags = [
        "-Wno-implicit-fallthrough"
    ];
};

in { inherit deqp_spirv-tools deqp_spvtools_generate_grammar_tables deqp_spvtools_generate_language_headers deqp_spvtools_generate_registry_tables deqp_spvtools_update_build_version; }
