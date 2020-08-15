{ cc_library_static }:
let

libLLVMMIRParser = cc_library_static {
    name = "libLLVMMIRParser";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = [
        "MILexer.cpp"
        "MIParser.cpp"
        "MIRParser.cpp"
    ];
};

in { inherit libLLVMMIRParser; }
