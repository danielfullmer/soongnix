{ cc_test }:
let

xaacdec = cc_test {
    name = "xaacdec";

    vendor_available = true;
    gtest = false;

    cflags = [
        "-O3"
        "-UARM_PROFILE_HW"
        "-UARM_PROFILE_BOARD"
        "-DECLIPSE"
        "-DDRC_ENABLE"
        "-DMULTICHANNEL_ENABLE"
        "-DENABLE_DRC"
    ];

    include_dirs = [
        "external/libxaac/decoder/"
    ];

    srcs = [
        "ixheaacd_error.c"
        "ixheaacd_fileifc.c"
        "ixheaacd_main.c"
        "ixheaacd_metadata_read.c"
    ];

    static_libs = ["libxaacdec"];

    shared_libs = ["liblog"];
};

in { inherit xaacdec; }
