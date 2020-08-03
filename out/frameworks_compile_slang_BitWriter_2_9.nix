{ cc_library_host_static }:
let

#  For the host
#  =====================================================
libLLVMBitWriter_2_9 = cc_library_host_static {
    name = "libLLVMBitWriter_2_9";
    defaults = ["slang-defaults"];
    include_dirs = ["frameworks/compile/slang"];

    #  We don't control the source files under this dir.
    #  So, disable tidy checks.
    tidy = false;

    srcs = [
        "BitcodeWriter.cpp"
        "BitcodeWriterPass.cpp"
        "ValueEnumerator.cpp"
    ];
};

in { inherit libLLVMBitWriter_2_9; }
