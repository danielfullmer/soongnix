{ cc_library_static }:
let

libLLVMMipsAsmPrinter = cc_library_static {
    name = "libLLVMMipsAsmPrinter";
    defaults = [
        "llvm-lib-defaults"
        "llvm-mips-defaults"
    ];
    srcs = ["*.cpp"];
};

in { inherit libLLVMMipsAsmPrinter; }
