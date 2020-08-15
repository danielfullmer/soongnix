{ cc_library_static }:
let

libLLVMMipsAsmParser = cc_library_static {
    name = "libLLVMMipsAsmParser";
    defaults = [
        "llvm-lib-defaults"
        "llvm-mips-defaults"
    ];
    srcs = ["MipsAsmParser.cpp"];
};

in { inherit libLLVMMipsAsmParser; }
