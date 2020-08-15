{ cc_library_static }:
let

libLLVMMCDisassembler = cc_library_static {
    name = "libLLVMMCDisassembler";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = [
        "Disassembler.cpp"
        "MCDisassembler.cpp"
        "MCExternalSymbolizer.cpp"
        "MCRelocationInfo.cpp"
        "MCSymbolizer.cpp"
    ];
};

in { inherit libLLVMMCDisassembler; }
