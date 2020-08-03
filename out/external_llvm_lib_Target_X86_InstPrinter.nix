{ cc_library_static }:
let

libLLVMX86AsmPrinter = cc_library_static {
    name = "libLLVMX86AsmPrinter";
    defaults = [
        "llvm-lib-defaults"
        "llvm-x86-defaults"
    ];
    srcs = ["*.cpp"];
};

in { inherit libLLVMX86AsmPrinter; }
