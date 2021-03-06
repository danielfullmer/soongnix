{ cc_defaults, cc_library_shared, cc_library_static }:
let

piex_default_cflags = cc_defaults {
    name = "piex_default_cflags";
    cflags = [
        "-Wall"
        "-Werror"
        "-Wsign-compare"
    ];
};

libbinary_parse = cc_library_static {
    name = "libbinary_parse";
    host_supported = true;
    defaults = ["piex_default_cflags"];
    vendor_available = true;
    srcs = [
        "src/binary_parse/cached_paged_byte_array.cc"
        "src/binary_parse/range_checked_byte_ptr.cc"
    ];
    target = {
        windows = {
            enabled = true;
        };
    };
};

libimage_type_recognition = cc_library_static {
    name = "libimage_type_recognition";
    host_supported = true;
    defaults = ["piex_default_cflags"];
    vendor_available = true;
    srcs = [
        "src/image_type_recognition/image_type_recognition_lite.cc"
    ];
    static_libs = ["libbinary_parse"];
    target = {
        windows = {
            enabled = true;
        };
    };
};

libtiff_directory = cc_library_static {
    name = "libtiff_directory";
    host_supported = true;
    defaults = ["piex_default_cflags"];
    vendor_available = true;
    srcs = [
        "src/tiff_directory/tiff_directory.cc"
    ];
    static_libs = ["libbinary_parse"];
    target = {
        windows = {
            enabled = true;
        };
    };
};

libpiex = cc_library_shared {
    name = "libpiex";
    host_supported = true;
    defaults = ["piex_default_cflags"];
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    srcs = [
        "src/tiff_parser.cc"
        "src/piex.cc"
    ];
    export_include_dirs = ["."];
    static_libs = [
        "libbinary_parse"
        "libimage_type_recognition"
        "libtiff_directory"
    ];
    target = {
        windows = {
            enabled = true;
        };
    };
};

in { inherit libbinary_parse libimage_type_recognition libpiex libtiff_directory piex_default_cflags; }
