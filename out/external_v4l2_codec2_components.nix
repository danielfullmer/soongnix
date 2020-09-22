{ cc_library }:
let

libv4l2_codec2_components = cc_library {
    name = "libv4l2_codec2_components";
    vendor = true;

    defaults = [
        "libcodec2-impl-defaults"
    ];

    srcs = [
        "VideoFrame.cpp"
        "VideoFramePool.cpp"
        "V4L2Decoder.cpp"
        "V4L2ComponentFactory.cpp"
        "V4L2DecodeComponent.cpp"
        "V4L2DecodeInterface.cpp"
        "VideoDecoder.cpp"
        "VideoTypes.cpp"
    ];
    export_include_dirs = [
        "include"
    ];

    shared_libs = [
        "android.hardware.graphics.common@1.0"
        "libc2plugin_store"
        "libchrome"
        "libcodec2_soft_common"
        "libcutils"
        "liblog"
        "libsfplugin_ccodec_utils"
        "libstagefright_bufferqueue_helper"
        "libstagefright_foundation"
        "libv4l2_codec2_store"
    ];
    static_libs = [
        "libv4l2_codec2_accel"
        "libv4l2_codec2_common"
    ];

    cflags = [
        "-Werror"
        "-Wall"
        "-Wno-unused-parameter" #  needed for libchrome/base codes
        "-Wthread-safety"
    ];
};

in { inherit libv4l2_codec2_components; }
