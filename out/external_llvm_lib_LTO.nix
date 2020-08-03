{ cc_library_static }:
let

libLLVMLTO = cc_library_static {
    name = "libLLVMLTO";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = ["*.cpp"];
};

in { inherit libLLVMLTO; }
