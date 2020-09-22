{ cc_binary }:
let

codec2play = cc_binary {
    name = "codec2play";
    defaults = ["libcodec2-impl-defaults"];

    srcs = [
        "codec2.cpp"
    ];

    include_dirs = [
    ];

    header_libs = [
        "libmediadrm_headers"
    ];

    shared_libs = [
        "libbase"
        "libbinder"
        "libcutils"
        "libdatasource"
        "libgui"
        "liblog"
        "libstagefright"
        "libstagefright_foundation"
        "libui"
        "libutils"
    ];

    cflags = [
        "-Werror"
        "-Wall"
    ];

    sanitize = {
        cfi = true;
        misc_undefined = [
            "unsigned-integer-overflow"
            "signed-integer-overflow"
        ];
    };
};

in { inherit codec2play; }
