{ cc_library_headers, cc_library_shared }:
let

liblocation_api = cc_library_shared {

    name = "liblocation_api";
    vendor = true;

    sanitize = GNSS_SANITIZE;

    shared_libs = [
        "libutils"
        "libcutils"
        "libgps.utils"
        "libdl"
        "liblog"
    ];

    srcs = [
        "LocationAPI.cpp"
        "LocationAPIClientBase.cpp"
    ];

    cflags = ["-fno-short-enums"] ++ GNSS_CFLAGS;

    header_libs = [
        "libloc_pla_headers"
        "libgps.utils_headers"
    ];

};

liblocation_api_headers = cc_library_headers {

    name = "liblocation_api_headers";
    export_include_dirs = ["."];
    vendor = true;
};

in { inherit liblocation_api liblocation_api_headers; }
