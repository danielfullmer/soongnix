{ filegroup }:
let

"spirv.core.grammar.json-1.1" = filegroup {
    name = "spirv.core.grammar.json-1.1";
    srcs = ["include/spirv/1.1/spirv.core.grammar.json"];
};

in { inherit "spirv.core.grammar.json-1.1"; }
