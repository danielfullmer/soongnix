{ cc_library }:
let

libstagefright_httplive = cc_library {
    name = "libstagefright_httplive";

    srcs = [
        "HTTPDownloader.cpp"
        "LiveDataSource.cpp"
        "LiveSession.cpp"
        "M3UParser.cpp"
        "PlaylistFetcher.cpp"
    ];

    include_dirs = [
        "frameworks/av/media/libstagefright"
        "frameworks/native/include/media/openmax"
    ];

    cflags = [
        "-Werror"
        "-Wall"
    ];

    sanitize = {
        misc_undefined = [
            "signed-integer-overflow"
            "unsigned-integer-overflow"
        ];
        cfi = true;
    };

    shared_libs = [
        "liblog"
        "libcrypto"
        "libcutils"
        "libdatasource"
        "libmedia"
        "libmediandk"
        "libstagefright"
        "libstagefright_foundation"
        "libutils"
        "libhidlbase"
        "libhidlmemory"
        "android.hardware.cas@1.0"
        "android.hardware.cas.native@1.0"
        "android.hidl.allocator@1.0"
    ];

    header_libs = [
        "libbase_headers"
    ];

    static_libs = [
        "libstagefright_id3"
        "libstagefright_metadatautils"
        "libstagefright_mpeg2support"
    ];

};

in { inherit libstagefright_httplive; }
