{ cc_library }:
let

libv4l2_codec2_common = cc_library {
    name = "libv4l2_codec2_common";
    vendor = true;

    defaults = [
        "libcodec2-impl-defaults"
    ];

    srcs = [
        "EncodeHelpers.cpp"
        "FormatConverter.cpp"
        "V4L2ComponentCommon.cpp"
    ];

    export_include_dirs = [
        "include"
    ];

    shared_libs = [
        "libchrome"
        "libcutils"
        "liblog"
        "libui"
        "libutils"
        "libv4l2_codec2_accel"
    ];

    static_libs = [
        "libyuv_static"
    ];

    cflags = [
        "-Werror"
        "-Wall"
    ];
};

in { inherit libv4l2_codec2_common; }
