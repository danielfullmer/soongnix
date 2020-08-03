{ cc_defaults }:
let

pixelflinger-tests = cc_defaults {
    name = "pixelflinger-tests";

    cflags = [
        "-Wall"
        "-Werror"
    ];

    header_libs = ["libpixelflinger_internal"];
    static_libs = [
        "libbase"
        "libcutils"
        "liblog"
        "libpixelflinger"
        "libutils"
    ];
};

in { inherit pixelflinger-tests; }
