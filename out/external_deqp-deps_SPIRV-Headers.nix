{ filegroup }:
let

"deqp_spirv_headers_unified1_spirv.core.grammar.json" = filegroup {
    name = "deqp_spirv_headers_unified1_spirv.core.grammar.json";
    srcs = ["include/spirv/unified1/spirv.core.grammar.json"];
};

"deqp_spirv_headers_unified1_extinst.opencl.std.100.grammar.json" = filegroup {
    name = "deqp_spirv_headers_unified1_extinst.opencl.std.100.grammar.json";
    srcs = ["include/spirv/unified1/extinst.opencl.std.100.grammar.json"];
};

"deqp_spirv_headers_unified1_extinst.glsl.std.450.grammar.json" = filegroup {
    name = "deqp_spirv_headers_unified1_extinst.glsl.std.450.grammar.json";
    srcs = ["include/spirv/unified1/extinst.glsl.std.450.grammar.json"];
};

"deqp_spirv_headers_spir-v.xml" = filegroup {
    name = "deqp_spirv_headers_spir-v.xml";
    srcs = ["include/spirv/spir-v.xml"];
};

in { inherit "deqp_spirv_headers_spir-v.xml" "deqp_spirv_headers_unified1_extinst.glsl.std.450.grammar.json" "deqp_spirv_headers_unified1_extinst.opencl.std.100.grammar.json" "deqp_spirv_headers_unified1_spirv.core.grammar.json"; }
