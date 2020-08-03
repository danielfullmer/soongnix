{ cc_library_static }:
let

libLLVMInstCombine = cc_library_static {
    name = "libLLVMInstCombine";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = ["*.cpp"];
};

in { inherit libLLVMInstCombine; }
