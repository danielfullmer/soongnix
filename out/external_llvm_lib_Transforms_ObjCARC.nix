{ cc_library_static }:
let

libLLVMTransformObjCARC = cc_library_static {
    name = "libLLVMTransformObjCARC";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = ["*.cpp"];
};

in { inherit libLLVMTransformObjCARC; }
