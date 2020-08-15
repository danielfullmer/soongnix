{ cc_library_static }:
let

libLLVMPasses = cc_library_static {
    name = "libLLVMPasses";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = ["PassBuilder.cpp"];
};

in { inherit libLLVMPasses; }
