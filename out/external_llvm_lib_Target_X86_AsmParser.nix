{ cc_library_static }:
let

libLLVMX86AsmParser = cc_library_static {
    name = "libLLVMX86AsmParser";
    defaults = [
        "llvm-lib-defaults"
        "llvm-x86-defaults"
    ];
    srcs = ["*.cpp"];
};

in { inherit libLLVMX86AsmParser; }
