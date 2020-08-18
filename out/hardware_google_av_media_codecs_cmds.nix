{ cc_binary }:
let

codec2 = cc_binary {
    name = "codec2";
    defaults = ["libstagefright_codec2-impl-defaults"];

    srcs = [
        "codec2.cpp"
    ];

    include_dirs = [
    ];

    shared_libs = [
        "libbase"
        "libbinder"
        "libcutils"
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

in { inherit codec2; }
