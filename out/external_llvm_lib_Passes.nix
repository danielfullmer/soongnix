{ cc_library_static }:
let

libLLVMPasses = cc_library_static {
    name = "libLLVMPasses";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = ["*.cpp"];
};

in { inherit libLLVMPasses; }
