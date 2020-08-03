{ cc_library_static }:
let

libLLVMMCJIT = cc_library_static {
    name = "libLLVMMCJIT";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = ["*.cpp"];
};

in { inherit libLLVMMCJIT; }
