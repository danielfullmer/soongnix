{ cc_library_static }:
let

libLLVMAnalysis = cc_library_static {
    name = "libLLVMAnalysis";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = ["*.cpp"];
};

in { inherit libLLVMAnalysis; }
