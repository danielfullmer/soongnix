{ filegroup }:
let

"deqp_spirv.core.grammar.json-1.0" = filegroup {
    name = "deqp_spirv.core.grammar.json-1.0";
    srcs = ["include/spirv/1.0/spirv.core.grammar.json"];
};

"deqp_spirv.core.grammar.json-1.1" = filegroup {
    name = "deqp_spirv.core.grammar.json-1.1";
    srcs = ["include/spirv/1.1/spirv.core.grammar.json"];
};

"deqp_spirv.core.grammar.json-1.2" = filegroup {
    name = "deqp_spirv.core.grammar.json-1.2";
    srcs = ["include/spirv/1.2/spirv.core.grammar.json"];
};

"deqp_spirv.core.grammar.json-unified1" = filegroup {
    name = "deqp_spirv.core.grammar.json-unified1";
    srcs = ["include/spirv/unified1/spirv.core.grammar.json"];
};

"deqp_spirv.glsl.grammar.json" = filegroup {
    name = "deqp_spirv.glsl.grammar.json";
    srcs = ["include/spirv/1.2/extinst.glsl.std.450.grammar.json"];
};

"deqp_spirv.opencl.grammar.json" = filegroup {
    name = "deqp_spirv.opencl.grammar.json";
    srcs = ["include/spirv/1.2/extinst.opencl.std.100.grammar.json"];
};

"deqp_spirv.registry.xml" = filegroup {
    name = "deqp_spirv.registry.xml";
    srcs = ["include/spirv/spir-v.xml"];
};

in { inherit "deqp_spirv.core.grammar.json-1.0" "deqp_spirv.core.grammar.json-1.1" "deqp_spirv.core.grammar.json-1.2" "deqp_spirv.core.grammar.json-unified1" "deqp_spirv.glsl.grammar.json" "deqp_spirv.opencl.grammar.json" "deqp_spirv.registry.xml"; }
