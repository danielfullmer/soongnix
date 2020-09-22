{ cc_library_shared }:
let

subdirs = ["tests"];

libcamera_metadata = cc_library_shared {
    name = "libcamera_metadata";
    vendor_available = true;
    #  TODO(b/153609531): remove when no longer needed.
    native_bridge_supported = true;
    vndk = {
        enabled = true;
    };
    double_loadable = true;
    srcs = ["src/camera_metadata.c"];

    include_dirs = ["system/media/private/camera/include"];
    local_include_dirs = ["include"];
    export_include_dirs = ["include"];

    header_libs = [
        "libcutils_headers"
    ];

    export_header_lib_headers = [
        "libcutils_headers"
    ];

    shared_libs = [
        "liblog"
    ];

    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
        "-fvisibility=hidden"
        "-std=c11"
    ];

    product_variables = {
        eng = {
            #  Enable assert()
            cflags = [
                "-UNDEBUG"
                "-DLOG_NDEBUG=1"
            ];
        };
    };
};

in { inherit libcamera_metadata; }
