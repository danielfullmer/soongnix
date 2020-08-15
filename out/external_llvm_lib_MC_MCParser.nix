{ cc_library_static }:
let

libLLVMMCParser = cc_library_static {
    name = "libLLVMMCParser";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = [
        "AsmLexer.cpp"
        "AsmParser.cpp"
        "COFFAsmParser.cpp"
        "DarwinAsmParser.cpp"
        "ELFAsmParser.cpp"
        "MCAsmLexer.cpp"
        "MCAsmParser.cpp"
        "MCAsmParserExtension.cpp"
        "MCTargetAsmParser.cpp"
    ];
};

in { inherit libLLVMMCParser; }
