{ cc_library_static }:
let

libLLVMBitWriter = cc_library_static {
    name = "libLLVMBitWriter";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = ["*.cpp"];
};

in { inherit libLLVMBitWriter; }
