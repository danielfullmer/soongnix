{ cc_library_static }:
let

libstagefright_timedtext = cc_library_static {
    name = "libstagefright_timedtext";

    srcs = ["TextDescriptions.cpp"];

    cflags = [
        "-Wno-multichar"
        "-Werror"
        "-Wall"
    ];

    sanitize = {
        misc_undefined = [
            "signed-integer-overflow"
        ];
        cfi = true;
    };

    include_dirs = [
        "frameworks/av/media/libstagefright"
    ];

    shared_libs = ["libmedia"];
};

in { inherit libstagefright_timedtext; }
