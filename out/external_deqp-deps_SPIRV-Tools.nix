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
        "source/*.cpp"
        "source/util/*.cpp"
        "source/val/*.cpp"
        "source/opt/*.cpp"
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
