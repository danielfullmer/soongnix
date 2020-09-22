{ cc_library, cc_library_headers }:
let

libmedia_helper_headers = cc_library_headers {
    name = "libmedia_helper_headers";
    vendor_available = true;
    min_sdk_version = "29";
    export_include_dirs = ["include"];
};

libmedia_helper = cc_library {
    name = "libmedia_helper";
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    double_loadable = true;
    srcs = [
        "AudioParameter.cpp"
        "TypeConverter.cpp"
    ];
    cflags = [
        "-Werror"
        "-Wextra"
        "-Wall"
    ];
    shared_libs = [
        "libutils"
        "liblog"
    ];
    header_libs = [
        "libmedia_helper_headers"
        "libaudio_system_headers"
    ];
    export_header_lib_headers = [
        "libmedia_helper_headers"
    ];
    clang = true;
};

in { inherit libmedia_helper libmedia_helper_headers; }
