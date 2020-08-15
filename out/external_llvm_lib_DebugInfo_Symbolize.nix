{ cc_library_static }:
let

libLLVMSymbolize = cc_library_static {
    name = "libLLVMSymbolize";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = [
        "DIPrinter.cpp"
        "SymbolizableObjectFile.cpp"
        "Symbolize.cpp"
    ];
};

in { inherit libLLVMSymbolize; }
