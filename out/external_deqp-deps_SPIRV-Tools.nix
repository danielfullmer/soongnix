{ cc_library, filegroup, genrule }:
let

"deqp_spirv.debuginfo.grammar.json" = filegroup {
    name = "deqp_spirv.debuginfo.grammar.json";
    srcs = ["source/extinst.debuginfo.grammar.json"];
};

"deqp_gen_spvtools_grammar_tables_1.0" = genrule {
    name = "deqp_gen_spvtools_grammar_tables_1.0";
    out = [
        "core.insts-1.0.inc"
        "operand.kinds-1.0.inc"
        "glsl.std.450.insts.inc"
        "opencl.std.insts.inc"
    ];
    srcs = [
        ":deqp_spirv.core.grammar.json-1.0"
        ":deqp_spirv.glsl.grammar.json"
        ":deqp_spirv.opencl.grammar.json"
        ":deqp_spirv.debuginfo.grammar.json"
    ];
    tool_files = ["utils/generate_grammar_tables.py"];
    cmd = "$(location) --spirv-core-grammar=$(location :deqp_spirv.core.grammar.json-1.0) " +
        "--extinst-glsl-grammar=$(location :deqp_spirv.glsl.grammar.json) " +
        "--extinst-opencl-grammar=$(location :deqp_spirv.opencl.grammar.json) " +
        "--extinst-debuginfo-grammar=$(location :deqp_spirv.debuginfo.grammar.json) " +
        "--core-insts-output=$(location core.insts-1.0.inc) " +
        "--glsl-insts-output=$(location glsl.std.450.insts.inc) " +
        "--opencl-insts-output=$(location opencl.std.insts.inc) " +
        "--operand-kinds-output=$(location operand.kinds-1.0.inc)";
};

"deqp_gen_spvtools_grammar_tables_1.1" = genrule {
    name = "deqp_gen_spvtools_grammar_tables_1.1";
    out = [
        "core.insts-1.1.inc"
        "operand.kinds-1.1.inc"
    ];
    srcs = [
        ":deqp_spirv.core.grammar.json-1.1"
        ":deqp_spirv.debuginfo.grammar.json"
    ];
    tool_files = ["utils/generate_grammar_tables.py"];
    cmd = "$(location) --spirv-core-grammar=$(location :deqp_spirv.core.grammar.json-1.1) " +
        "--extinst-debuginfo-grammar=$(location :deqp_spirv.debuginfo.grammar.json) " +
        "--core-insts-output=$(location core.insts-1.1.inc) " +
        "--operand-kinds-output=$(location operand.kinds-1.1.inc)";
};

"deqp_gen_spvtools_grammar_tables_1.2" = genrule {
    name = "deqp_gen_spvtools_grammar_tables_1.2";
    out = [
        "core.insts-1.2.inc"
        "operand.kinds-1.2.inc"
    ];
    srcs = [
        ":deqp_spirv.core.grammar.json-1.2"
        ":deqp_spirv.debuginfo.grammar.json"
    ];
    tool_files = ["utils/generate_grammar_tables.py"];
    cmd = "$(location) --spirv-core-grammar=$(location :deqp_spirv.core.grammar.json-1.2) " +
        "--extinst-debuginfo-grammar=$(location :deqp_spirv.debuginfo.grammar.json) " +
        "--core-insts-output=$(location core.insts-1.2.inc) " +
        "--operand-kinds-output=$(location operand.kinds-1.2.inc)";
};

deqp_gen_spvtools_grammar_tables_unified1 = genrule {
    name = "deqp_gen_spvtools_grammar_tables_unified1";
    out = [
        "core.insts-unified1.inc"
        "operand.kinds-unified1.inc"
    ];
    srcs = [
        ":deqp_spirv.core.grammar.json-unified1"
        ":deqp_spirv.debuginfo.grammar.json"
    ];
    tool_files = ["utils/generate_grammar_tables.py"];
    cmd = "$(location) --spirv-core-grammar=$(location :deqp_spirv.core.grammar.json-unified1) " +
        "--extinst-debuginfo-grammar=$(location :deqp_spirv.debuginfo.grammar.json) " +
        "--core-insts-output=$(location core.insts-unified1.inc) " +
        "--operand-kinds-output=$(location operand.kinds-unified1.inc)";
};

deqp_gen_spvtools_grammar_tables_debuginfo = genrule {
    name = "deqp_gen_spvtools_grammar_tables_debuginfo";
    out = [
        "debuginfo.insts.inc"
    ];
    srcs = [
        ":deqp_spirv.debuginfo.grammar.json"
    ];
    tool_files = ["utils/generate_grammar_tables.py"];
    cmd = "$(location) --extinst-vendor-grammar=$(in) " +
        "--vendor-insts-output=$(out)";
};

deqp_gen_spvtools_grammar_tables_amd-gcn-shader = genrule {
    name = "deqp_gen_spvtools_grammar_tables_amd-gcn-shader";
    out = [
        "spv-amd-gcn-shader.insts.inc"
    ];
    srcs = [
        "source/extinst.spv-amd-gcn-shader.grammar.json"
    ];
    tool_files = ["utils/generate_grammar_tables.py"];
    cmd = "$(location) --extinst-vendor-grammar=$(in) " +
        "--vendor-insts-output=$(out)";
};

deqp_gen_spvtools_grammar_tables_amd-shader-ballot = genrule {
    name = "deqp_gen_spvtools_grammar_tables_amd-shader-ballot";
    out = [
        "spv-amd-shader-ballot.insts.inc"
    ];
    srcs = [
        "source/extinst.spv-amd-shader-ballot.grammar.json"
    ];
    tool_files = ["utils/generate_grammar_tables.py"];
    cmd = "$(location) --extinst-vendor-grammar=$(in) " +
        "--vendor-insts-output=$(out)";
};

deqp_gen_spvtools_grammar_tables_amd-shader-explicit-vertex-parameter = genrule {
    name = "deqp_gen_spvtools_grammar_tables_amd-shader-explicit-vertex-parameter";
    out = [
        "spv-amd-shader-explicit-vertex-parameter.insts.inc"
    ];
    srcs = [
        "source/extinst.spv-amd-shader-explicit-vertex-parameter.grammar.json"
    ];
    tool_files = ["utils/generate_grammar_tables.py"];
    cmd = "$(location) --extinst-vendor-grammar=$(in) " +
        "--vendor-insts-output=$(out)";
};

deqp_gen_spvtools_grammar_tables_amd-shader-trinary-minmax = genrule {
    name = "deqp_gen_spvtools_grammar_tables_amd-shader-trinary-minmax";
    out = [
        "spv-amd-shader-trinary-minmax.insts.inc"
    ];
    srcs = [
        "source/extinst.spv-amd-shader-trinary-minmax.grammar.json"
    ];
    tool_files = ["utils/generate_grammar_tables.py"];
    cmd = "$(location) --extinst-vendor-grammar=$(in) " +
        "--vendor-insts-output=$(out)";
};

deqp_gen_spvtools_lang_headers = genrule {
    name = "deqp_gen_spvtools_lang_headers";
    out = [
        "DebugInfo.h"
    ];
    srcs = [
        ":deqp_spirv.debuginfo.grammar.json"
    ];
    tool_files = ["utils/generate_language_headers.py"];
    cmd = "$(location) --extinst-name=DebugInfo " +
        "--extinst-grammar=$(location :deqp_spirv.debuginfo.grammar.json) " +
        "--extinst-output-base=$$(dirname $(location DebugInfo.h))/DebugInfo";
};

deqp_gen_spvtools_enum_string_mapping = genrule {
    name = "deqp_gen_spvtools_enum_string_mapping";
    out = [
        "extension_enum.inc"
        "enum_string_mapping.inc"
    ];
    srcs = [
        ":deqp_spirv.core.grammar.json-unified1"
        ":deqp_spirv.debuginfo.grammar.json"
    ];
    tool_files = ["utils/generate_grammar_tables.py"];
    cmd = "$(location) --spirv-core-grammar=$(location :deqp_spirv.core.grammar.json-unified1) " +
        "--extinst-debuginfo-grammar=$(location :deqp_spirv.debuginfo.grammar.json) " +
        "--extension-enum-output=$(location extension_enum.inc) " +
        "--enum-string-mapping-output=$(location enum_string_mapping.inc) ";
};

deqp_gen_spvtools_generators_inc = genrule {
    name = "deqp_gen_spvtools_generators_inc";
    out = [
        "generators.inc"
    ];
    srcs = [
        ":deqp_spirv.registry.xml"
    ];
    tool_files = ["utils/generate_registry_tables.py"];
    cmd = "$(location) --xml=$(location :deqp_spirv.registry.xml) --generator-output=$(location generators.inc)";
};

deqp_gen_spvtools_build_version_inc = genrule { #  FIXME this relies on `git` which is no good on build machines
    name = "deqp_gen_spvtools_build_version_inc";
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
        "source/id_descriptor.cpp"
        "source/libspirv.cpp"
        "source/name_mapper.cpp"
        "source/opcode.cpp"
        "source/operand.cpp"
        "source/parsed_operand.cpp"
        "source/pch_source.cpp"
        "source/print.cpp"
        "source/software_version.cpp"
        "source/spirv_endian.cpp"
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
        "source/val/validate_datarules.cpp"
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
        "source/val/validate_mode_setting.cpp"
        "source/val/validate_non_uniform.cpp"
        "source/val/validate_primitives.cpp"
        "source/val/validate_scopes.cpp"
        "source/val/validate_type.cpp"
        "source/val/validation_state.cpp"
        "source/opt/aggressive_dead_code_elim_pass.cpp"
        "source/opt/basic_block.cpp"
        "source/opt/block_merge_pass.cpp"
        "source/opt/build_module.cpp"
        "source/opt/ccp_pass.cpp"
        "source/opt/cfg.cpp"
        "source/opt/cfg_cleanup_pass.cpp"
        "source/opt/combine_access_chains.cpp"
        "source/opt/common_uniform_elim_pass.cpp"
        "source/opt/compact_ids_pass.cpp"
        "source/opt/composite.cpp"
        "source/opt/const_folding_rules.cpp"
        "source/opt/constants.cpp"
        "source/opt/copy_prop_arrays.cpp"
        "source/opt/dead_branch_elim_pass.cpp"
        "source/opt/dead_insert_elim_pass.cpp"
        "source/opt/dead_variable_elimination.cpp"
        "source/opt/decoration_manager.cpp"
        "source/opt/def_use_manager.cpp"
        "source/opt/dominator_analysis.cpp"
        "source/opt/dominator_tree.cpp"
        "source/opt/eliminate_dead_constant_pass.cpp"
        "source/opt/eliminate_dead_functions_pass.cpp"
        "source/opt/feature_manager.cpp"
        "source/opt/flatten_decoration_pass.cpp"
        "source/opt/fold.cpp"
        "source/opt/fold_spec_constant_op_and_composite_pass.cpp"
        "source/opt/folding_rules.cpp"
        "source/opt/freeze_spec_constant_value_pass.cpp"
        "source/opt/function.cpp"
        "source/opt/if_conversion.cpp"
        "source/opt/inline_exhaustive_pass.cpp"
        "source/opt/inline_opaque_pass.cpp"
        "source/opt/inline_pass.cpp"
        "source/opt/inst_bindless_check_pass.cpp"
        "source/opt/instruction.cpp"
        "source/opt/instruction_list.cpp"
        "source/opt/instrument_pass.cpp"
        "source/opt/ir_context.cpp"
        "source/opt/ir_loader.cpp"
        "source/opt/licm_pass.cpp"
        "source/opt/local_access_chain_convert_pass.cpp"
        "source/opt/local_redundancy_elimination.cpp"
        "source/opt/local_single_block_elim_pass.cpp"
        "source/opt/local_single_store_elim_pass.cpp"
        "source/opt/local_ssa_elim_pass.cpp"
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
        "source/opt/remove_duplicates_pass.cpp"
        "source/opt/replace_invalid_opc.cpp"
        "source/opt/scalar_analysis.cpp"
        "source/opt/scalar_analysis_simplification.cpp"
        "source/opt/scalar_replacement_pass.cpp"
        "source/opt/set_spec_constant_default_value_pass.cpp"
        "source/opt/simplification_pass.cpp"
        "source/opt/ssa_rewrite_pass.cpp"
        "source/opt/strength_reduction_pass.cpp"
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
        "deqp_gen_spvtools_grammar_tables_1.0"
        "deqp_gen_spvtools_grammar_tables_1.1"
        "deqp_gen_spvtools_grammar_tables_1.2"
        "deqp_gen_spvtools_grammar_tables_unified1"
        "deqp_gen_spvtools_grammar_tables_debuginfo"
        "deqp_gen_spvtools_grammar_tables_amd-gcn-shader"
        "deqp_gen_spvtools_grammar_tables_amd-shader-ballot"
        "deqp_gen_spvtools_grammar_tables_amd-shader-explicit-vertex-parameter"
        "deqp_gen_spvtools_grammar_tables_amd-shader-trinary-minmax"
        "deqp_gen_spvtools_enum_string_mapping"
        "deqp_gen_spvtools_generators_inc"
        "deqp_gen_spvtools_build_version_inc"
        "deqp_gen_spvtools_lang_headers"
    ];
    stl = "libc++_static";
    cppflags = [
        "-Wno-implicit-fallthrough"
    ];
};

in { inherit "deqp_gen_spvtools_grammar_tables_1.0" "deqp_gen_spvtools_grammar_tables_1.1" "deqp_gen_spvtools_grammar_tables_1.2" "deqp_spirv.debuginfo.grammar.json" deqp_gen_spvtools_build_version_inc deqp_gen_spvtools_enum_string_mapping deqp_gen_spvtools_generators_inc deqp_gen_spvtools_grammar_tables_amd-gcn-shader deqp_gen_spvtools_grammar_tables_amd-shader-ballot deqp_gen_spvtools_grammar_tables_amd-shader-explicit-vertex-parameter deqp_gen_spvtools_grammar_tables_amd-shader-trinary-minmax deqp_gen_spvtools_grammar_tables_debuginfo deqp_gen_spvtools_grammar_tables_unified1 deqp_gen_spvtools_lang_headers deqp_spirv-tools; }
