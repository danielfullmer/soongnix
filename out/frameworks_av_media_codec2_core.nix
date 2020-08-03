{ cc_library_headers, cc_library_shared }:
let

libcodec2_headers = cc_library_headers {
    name = "libcodec2_headers";
    vendor_available = true;
    export_include_dirs = ["include"];
};

libcodec2 = cc_library_shared {
    name = "libcodec2";
    vendor_available = true;
    vndk = {
        enabled = true;
    };

    srcs = ["C2.cpp"];

    cflags = [
        "-Wall"
        "-Werror"
    ];

    header_libs = [
        "libcodec2_headers"
        "libhardware_headers"
        "libutils_headers"
        "media_plugin_headers"
    ];

    export_header_lib_headers = [
        "libcodec2_headers"
        "libhardware_headers"
        "libutils_headers"
        "media_plugin_headers"
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

in { inherit libcodec2 libcodec2_headers; }
