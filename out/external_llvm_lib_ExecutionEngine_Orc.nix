{ cc_library_static }:
let

libLLVMOrcJIT = cc_library_static {
    name = "libLLVMOrcJIT";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = ["*.cpp"];
};

in { inherit libLLVMOrcJIT; }
