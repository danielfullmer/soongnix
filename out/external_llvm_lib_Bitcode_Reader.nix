{ cc_library_static }:
let

libLLVMBitReader = cc_library_static {
    name = "libLLVMBitReader";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = ["*.cpp"];
};

in { inherit libLLVMBitReader; }
