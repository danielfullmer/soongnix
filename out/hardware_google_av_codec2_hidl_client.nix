{ cc_library }:
let

libcodec2_hidl_client = cc_library {
    name = "libcodec2_hidl_client";

    srcs = [
        "client.cpp"
    ];

    shared_libs = [
        "android.hardware.graphics.bufferqueue@1.0"
        "android.hardware.media.bufferpool@1.0"
        "hardware.google.media.c2@1.0"
        "libbase"
        "libbinder"
        "libcodec2_hidl_utils@1.0"
        "libcutils"
        "libgui"
        "libhidlbase"
        "libhidltransport"
        "liblog"
        "libstagefright_bufferpool@1.0"
        "libstagefright_bufferqueue_helper"
        "libstagefright_codec2"
        "libstagefright_codec2_vndk"
        "libui"
        "libutils"
    ];

    export_include_dirs = [
        "include"
    ];

    export_shared_lib_headers = [
        "libcodec2_hidl_utils@1.0"
        "libstagefright_codec2"
    ];

};

in { inherit libcodec2_hidl_client; }
