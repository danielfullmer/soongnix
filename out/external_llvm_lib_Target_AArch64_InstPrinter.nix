{ cc_library_static }:
let

libLLVMAArch64AsmPrinter = cc_library_static {
    name = "libLLVMAArch64AsmPrinter";
    defaults = [
        "llvm-lib-defaults"
        "llvm-aarch64-defaults"
    ];
    srcs = ["AArch64InstPrinter.cpp"];
};

in { inherit libLLVMAArch64AsmPrinter; }
