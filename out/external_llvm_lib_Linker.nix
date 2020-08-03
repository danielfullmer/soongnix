{ cc_library_static }:
let

libLLVMLinker = cc_library_static {
    name = "libLLVMLinker";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = ["*.cpp"];
};

in { inherit libLLVMLinker; }
