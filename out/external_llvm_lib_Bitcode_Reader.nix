{ cc_library_static }:
let

libLLVMBitReader = cc_library_static {
    name = "libLLVMBitReader";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = [
        "BitReader.cpp"
        "BitcodeReader.cpp"
        "BitstreamReader.cpp"
    ];
};

in { inherit libLLVMBitReader; }
