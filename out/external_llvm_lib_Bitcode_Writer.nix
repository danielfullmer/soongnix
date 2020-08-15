{ cc_library_static }:
let

libLLVMBitWriter = cc_library_static {
    name = "libLLVMBitWriter";
    defaults = [
        "llvm-lib-defaults"
    ];
    srcs = [
        "BitWriter.cpp"
        "BitcodeWriter.cpp"
        "BitcodeWriterPass.cpp"
        "ValueEnumerator.cpp"
    ];
};

in { inherit libLLVMBitWriter; }
