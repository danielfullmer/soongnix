{ cc_library_static }:
let

libLLVMX86AsmPrinter = cc_library_static {
    name = "libLLVMX86AsmPrinter";
    defaults = [
        "llvm-lib-defaults"
        "llvm-x86-defaults"
    ];
    srcs = [
        "X86ATTInstPrinter.cpp"
        "X86InstComments.cpp"
        "X86IntelInstPrinter.cpp"
    ];
};

in { inherit libLLVMX86AsmPrinter; }
