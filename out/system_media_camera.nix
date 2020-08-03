{ cc_library_shared }:
let

subdirs = ["tests"];

libcamera_metadata = cc_library_shared {
    name = "libcamera_metadata";
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    double_loadable = true;
    srcs = ["src/camera_metadata.c"];

    include_dirs = ["system/media/private/camera/include"];
    local_include_dirs = ["include"];
    export_include_dirs = ["include"];
    export_shared_lib_headers = ["libcutils"];

    shared_libs = [
        "libcutils"
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
