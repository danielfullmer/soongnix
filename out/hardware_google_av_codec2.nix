{ cc_library_shared }:
let

libstagefright_codec2 = cc_library_shared {
    name = "libstagefright_codec2";
    vendor_available = true;

    srcs = ["C2.cpp"];

    cflags = [
        "-Wall"
        "-Werror"
    ];

    include_dirs = [
        "frameworks/native/include/media/hardware"
    ];

    export_include_dirs = [
        "include"
    ];

    header_libs = [
        "libhardware_headers"
        "libutils_headers"
    ];

    export_header_lib_headers = [
        "libhardware_headers"
        "libutils_headers"
    ];

    sanitize = {
        misc_undefined = [
            "unsigned-integer-overflow"
            "signed-integer-overflow"
        ];
        cfi = false; #  true,
        diag = {
            cfi = false; #  true,
        };
    };

    ldflags = ["-Wl,-Bsymbolic"];
};

in { inherit libstagefright_codec2; }
