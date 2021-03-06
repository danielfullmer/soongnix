{ cc_library_shared }:
let

libsfplugin_ccodec_utils = cc_library_shared {
    name = "libsfplugin_ccodec_utils";
    vendor_available = true;

    srcs = [
        "Codec2BufferUtils.cpp"
        "Codec2Mapper.cpp"
    ];

    cflags = [
        "-Werror"
        "-Wall"
    ];

    export_include_dirs = [
        "."
    ];

    shared_libs = [
        "libbase"
        "libcodec2"
        "libcodec2_vndk"
        "libcutils"
        "liblog"
        "libstagefright_foundation"
        "libutils"
    ];

    static_libs = [
        "libyuv_static"
    ];

    sanitize = {
        cfi = true;
        misc_undefined = [
            "unsigned-integer-overflow"
            "signed-integer-overflow"
        ];
    };
};

in { inherit libsfplugin_ccodec_utils; }
