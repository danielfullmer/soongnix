{ cc_library_shared }:
let

libmedialogservice = cc_library_shared {
    name = "libmedialogservice";

    srcs = [
        "IMediaLogService.cpp"
        "MediaLogService.cpp"
    ];

    header_libs = [
        "libmedia_headers"
    ];

    shared_libs = [
        "libaudioutils"
        "libbinder"
        "liblog"
        "libmediautils"
        "libnblog"
        "libutils"
    ];

    cflags = [
        "-Werror"
        "-Wall"
    ];
};

in { inherit libmedialogservice; }
