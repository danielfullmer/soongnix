{ cc_library_shared }:
let

libstagefright_bufferqueue_helper = cc_library_shared {
    name = "libstagefright_bufferqueue_helper";
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    double_loadable = true;
    srcs = [
        "FrameDropper.cpp"
        "GraphicBufferSource.cpp"
    ];

    export_include_dirs = [
        "include"
    ];

    header_libs = [
        "media_plugin_headers"
    ];

    export_header_lib_headers = [
        "media_plugin_headers"
    ];

    shared_libs = [
        "libbinder"
        "libcutils"
        "libhidlbase"
        "libhidlmemory"
        "libhidltransport"
        "liblog"
        "libstagefright_foundation"
        "libui"
        "libutils"

        "android.hardware.graphics.bufferqueue@1.0"
        #  Following libs are from libgui_bufferqueue_static
        "android.hardware.graphics.bufferqueue@2.0"
        "android.hidl.token@1.0-utils"
        "libbase"
        "libEGL"
        "libhwbinder"
        "libnativewindow"
        "libvndksupport"
    ];

    static_libs = [
        "libgui_bufferqueue_static"
    ];

    export_shared_lib_headers = [
        "libhidlmemory"
        "libstagefright_foundation"
        "android.hardware.graphics.bufferqueue@1.0"
        "android.hardware.graphics.bufferqueue@2.0"
    ];

    cflags = [
        "-Werror"
        "-Wall"
        "-Wno-unused-parameter"
        "-Wno-documentation"
    ];

    sanitize = {
        misc_undefined = [
            "signed-integer-overflow"
            "unsigned-integer-overflow"
        ];
        cfi = true;
    };
};

in { inherit libstagefright_bufferqueue_helper; }
