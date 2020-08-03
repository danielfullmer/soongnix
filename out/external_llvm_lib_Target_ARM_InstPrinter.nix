{ cc_library_static }:
let

libLLVMARMAsmPrinter = cc_library_static {
    name = "libLLVMARMAsmPrinter";
    defaults = [
        "llvm-lib-defaults"
        "llvm-arm-defaults"
    ];
    srcs = ["*.cpp"];
};

in { inherit libLLVMARMAsmPrinter; }
