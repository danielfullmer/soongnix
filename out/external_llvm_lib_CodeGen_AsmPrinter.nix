{ cc_library_static }:
let

libLLVMAsmPrinter = cc_library_static {
    name = "libLLVMAsmPrinter";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = ["*.cpp"];
};

in { inherit libLLVMAsmPrinter; }
