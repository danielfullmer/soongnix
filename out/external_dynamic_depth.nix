{ cc_defaults, cc_library, cc_library_headers, cc_library_static }:
let

libdynamic_depth-defaults = cc_defaults {
    name = "libdynamic_depth-defaults";
    cflags = [
        "-DUNIX_ENV=1"
        "-Werror"
        "-Wno-reorder"
        "-Wno-unused-parameter"
        "-Wno-ignored-qualifiers"
        "-Wno-macro-redefined"
    ];
    rtti = true;
    cppflags = ["-fno-exceptions"];
    clang = true;
    sanitize = {
        misc_undefined = [
            "unsigned-integer-overflow"
            "signed-integer-overflow"
        ];
    };
    target = {
        darwin = {
            enabled = false;
        };
    };
};

libdynamic_depth-public_headers = cc_library_headers {
    name = "libdynamic_depth-public_headers";
    export_include_dirs = ["includes"];
};

libdynamic_depth-internal_headers = cc_library_headers {
    name = "libdynamic_depth-internal_headers";
    export_include_dirs = ["internal"];
};

libdynamic_depth = cc_library {
    name = "libdynamic_depth";
    defaults = ["libdynamic_depth-defaults"];
    vendor_available = false;
    header_libs = [
        "libdynamic_depth-public_headers"
        "libdynamic_depth-internal_headers"
    ];
    srcs = ["internal/**/*.cc"];
    shared_libs = [
        "libbase"
        "libimage_io"
        "libxml2"
    ];
};

libdynamic_depth_ndk = cc_library_static {
    name = "libdynamic_depth_ndk";
    defaults = ["libdynamic_depth-defaults"];
    vendor_available = false;
    export_include_dirs = [
        "includes"
        "internal"
    ];
    srcs = ["internal/**/*.cc"];
    shared_libs = [
        "liblog"
    ];
    static_libs = [
        "libimage_io_ndk"
        "libbase_ndk"
        "libxml2_ndk"
    ];
    cflags = [
        "-fvisibility=hidden"
        "-DSTATIC_LIBXML=1"
    ];
    sdk_version = "current";
    stl = "c++_static";
};

in { inherit libdynamic_depth libdynamic_depth-defaults libdynamic_depth-internal_headers libdynamic_depth-public_headers libdynamic_depth_ndk; }
