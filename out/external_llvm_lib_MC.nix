{ cc_library_static }:
let

libLLVMMC = cc_library_static {
    name = "libLLVMMC";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = ["*.cpp"];
};

subdirs = ["*"];

in { inherit libLLVMMC; }
