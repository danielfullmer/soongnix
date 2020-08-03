{ cc_defaults, cc_library, cc_library_headers, cc_library_static }:
let

libimage_io-defaults = cc_defaults {
    name = "libimage_io-defaults";
    cflags = [
        "-DUNIX_ENV=1"
        "-Werror"
        "-Wno-reorder"
        "-Wno-unused-parameter"
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
};

libimage_io-headers = cc_library_headers {
    name = "libimage_io-headers";
    export_include_dirs = ["includes"];
};

libimage_io = cc_library {
    name = "libimage_io";
    defaults = ["libimage_io-defaults"];
    vendor_available = false;
    header_libs = ["libimage_io-headers"];
    export_include_dirs = ["includes"];
    srcs = ["src/**/*.cc"];
    static_libs = [
        "libmodpb64"
    ];
};

libimage_io_ndk-headers = cc_library_headers {
    name = "libimage_io_ndk-headers";
    export_include_dirs = ["includes"];
    sdk_version = "current";
};

libimage_io_ndk = cc_library_static {
    name = "libimage_io_ndk";
    defaults = ["libimage_io-defaults"];
    vendor_available = false;
    header_libs = ["libimage_io_ndk-headers"];
    export_include_dirs = ["includes"];
    srcs = ["src/**/*.cc"];
    static_libs = [
        "libmodpb64_ndk"
    ];
    sdk_version = "current";
    stl = "c++_static";
};

in { inherit libimage_io libimage_io-defaults libimage_io-headers libimage_io_ndk libimage_io_ndk-headers; }
