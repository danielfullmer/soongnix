{ cc_library }:
let

libstagefright_flacdec = cc_library {
    name = "libstagefright_flacdec";
    vendor_available = true;

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

    static = {
        whole_static_libs = [
            "libFLAC"
            "libaudioutils"
        ];
    };

    shared = {
        static_libs = [
            "libFLAC"
            "libaudioutils"
        ];
        export_static_lib_headers = [
            "libFLAC"
        ];
    };

    shared_libs = [
        "liblog"
    ];

    header_libs = [
        "libmedia_headers"
        "libFLAC-headers"
    ];
};

in { inherit libstagefright_flacdec; }
