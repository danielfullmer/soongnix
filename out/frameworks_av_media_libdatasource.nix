{ cc_library }:
let

libdatasource = cc_library {
    name = "libdatasource";

    srcs = [
        "DataSourceFactory.cpp"
        "DataURISource.cpp"
        "FileSource.cpp"
        "HTTPBase.cpp"
        "MediaHTTP.cpp"
        "NuCachedSource2.cpp"
    ];

    aidl = {
        local_include_dirs = ["aidl"];
        export_aidl_headers = true;
    };

    header_libs = [
        "libstagefright_headers"
        "media_ndk_headers"
        "libmedia_headers"
    ];

    export_header_lib_headers = [
        "libstagefright_headers"
        "media_ndk_headers"
    ];

    shared_libs = [
        "liblog"
        "libcutils"
        "libutils"
        "libstagefright_foundation"
        "libdl"
    ];

    static_libs = [
        "libc_malloc_debug_backtrace" #  for memory heap analysis
        "libmedia_midiiowrapper"
    ];

    local_include_dirs = [
        "include"
    ];

    export_include_dirs = [
        "include"
    ];

    cflags = [
        "-Werror"
        "-Wno-error=deprecated-declarations"
        "-Wall"
    ];

    sanitize = {
        misc_undefined = [
            "unsigned-integer-overflow"
            "signed-integer-overflow"
        ];
        cfi = true;
    };
};

in { inherit libdatasource; }
