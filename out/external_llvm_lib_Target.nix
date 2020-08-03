{ cc_library_static }:
let

libLLVMTarget = cc_library_static {
    name = "libLLVMTarget";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = ["*.cpp"];
};

subdirs = ["*"];

in { inherit libLLVMTarget; }
