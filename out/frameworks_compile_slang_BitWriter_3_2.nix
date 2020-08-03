{ cc_library_static }:
let

#  For the host and device
#  =====================================================
libLLVMBitWriter_3_2 = cc_library_static {
    name = "libLLVMBitWriter_3_2";
    vendor_available = true;
    host_supported = true;
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

in { inherit libLLVMBitWriter_3_2; }
