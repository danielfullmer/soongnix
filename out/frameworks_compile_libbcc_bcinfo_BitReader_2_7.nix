{ cc_library_static }:
let

libLLVMBitReader_2_7 = cc_library_static {
    name = "libLLVMBitReader_2_7";
    vendor_available = true;
    defaults = ["llvm-defaults"];
    host_supported = true;

    #  We don't control the source files under this dir.
    #  So, disable tidy checks.
    tidy = false;

    srcs = ["BitcodeReader.cpp"];

    target = {
        host = {
            cflags = ["-D__HOST__"];
        };
        windows = {
            enabled = true;
        };
    };
};

in { inherit libLLVMBitReader_2_7; }
