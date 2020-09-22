{ cc_library }:
let

libstagefright_flacdec = cc_library {
    name = "libstagefright_flacdec";
    vendor_available = true;
    min_sdk_version = "29";

    srcs = [
        "FLACDecoder.cpp"
    ];

    export_include_dirs = ["."];

    cflags = ["-Werror"];

    sanitize = {
        misc_undefined = [
            "signed-integer-overflow"
            "unsigned-integer-overflow"
        ];
        cfi = true;
    };

    shared_libs = [
        "libaudioutils"
        "liblog"
    ];

    static_libs = [
        "libFLAC"
    ];

    export_static_lib_headers = [
        "libFLAC"
    ];

    header_libs = [
        "libmedia_headers"
    ];
};

in { inherit libstagefright_flacdec; }
