{ cc_library_shared }:
let

libstagefright_ccodec_utils = cc_library_shared {
    name = "libstagefright_ccodec_utils";
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
        "libcutils"
        "liblog"
        "libstagefright_codec2"
        "libstagefright_codec2_vndk"
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

in { inherit libstagefright_ccodec_utils; }
