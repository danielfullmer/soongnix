{ cc_library_static }:
let

libLLVMAsmParser = cc_library_static {
    name = "libLLVMAsmParser";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = [
        "LLLexer.cpp"
        "LLParser.cpp"
        "Parser.cpp"
    ];
};

in { inherit libLLVMAsmParser; }
