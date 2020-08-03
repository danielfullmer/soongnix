{ cc_library_static }:
let

libLLVMTransformUtils = cc_library_static {
    name = "libLLVMTransformUtils";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = ["*.cpp"];
};

in { inherit libLLVMTransformUtils; }
