{ cc_library }:
let

libcodec2_client = cc_library {
    name = "libcodec2_client";

    srcs = [
        "client.cpp"
    ];

    shared_libs = [
        "android.hardware.graphics.bufferqueue@1.0"
        "android.hardware.media.bufferpool@2.0"
        "android.hardware.media.c2@1.0"
        "libbase"
        "libbinder"
        "libcodec2"
        "libcodec2_hidl_client@1.0"
        "libcodec2_vndk"
        "libcutils"
        "libgui"
        "libhidlbase"
        "libhidltransport"
        "liblog"
        "libstagefright_bufferpool@2.0.1"
        "libui"
        "libutils"
    ];

    export_include_dirs = [
        "include"
    ];

    export_shared_lib_headers = [
        "libcodec2"
        "libcodec2_hidl_client@1.0"
        "libcodec2_vndk"
    ];

};

in { inherit libcodec2_client; }
