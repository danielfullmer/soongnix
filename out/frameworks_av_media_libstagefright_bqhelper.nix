{ cc_defaults, cc_library_shared }:
let

libstagefright_bufferqueue-defaults = cc_defaults {
    name = "libstagefright_bufferqueue-defaults";
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
        "libbase"
        "libcutils"
        "libhidlbase"
        "libhidlmemory"
        "liblog"
        "libstagefright_foundation"
        "libui"
        "libutils"

        "android.hardware.graphics.bufferqueue@1.0"
        "android.hardware.graphics.bufferqueue@2.0"
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

libstagefright_bufferqueue_helper = cc_library_shared {
    name = "libstagefright_bufferqueue_helper";
    defaults = ["libstagefright_bufferqueue-defaults"];
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    min_sdk_version = "29";

    shared_libs = ["libgui"];
    target = {
        vendor = {
            exclude_shared_libs = [
                "libgui"
            ];
            static_libs = [
                "libgui_bufferqueue_static"
            ];
            shared_libs = [
                "android.hidl.token@1.0-utils"
                "libEGL"
                "libnativewindow"
                "libvndksupport"
            ];
            cflags = [
                "-DNO_BINDER"
            ];
        };
    };
};

#  This lib is needed on devices that doesn't use vndk,
#  on these devices we still don't want libgui to be pulled
#  in onto the apex build. It should only be used by
#  libcodec2_hidl@1.x, etc. from service side. It could
#  be removed if all builds are using vndk.
libstagefright_bufferqueue_helper_novndk = cc_library_shared {
    name = "libstagefright_bufferqueue_helper_novndk";
    defaults = ["libstagefright_bufferqueue-defaults"];
    apex_available = [
        "com.android.media.swcodec"
        "test_com.android.media.swcodec"
        "//apex_available:platform"
    ];
    vendor_available = false;
    static_libs = [
        "libgui_bufferqueue_static"
    ];
    shared_libs = [
        "android.hidl.token@1.0-utils"
        "libEGL"
        "libnativewindow"
        "libvndksupport"
    ];
    cflags = [
        "-DNO_BINDER"
    ];
};

in { inherit libstagefright_bufferqueue-defaults libstagefright_bufferqueue_helper libstagefright_bufferqueue_helper_novndk; }
