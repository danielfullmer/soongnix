{ cc_library_shared }:
let

libcodec2_soft_g711alawdec = cc_library_shared {
    name = "libcodec2_soft_g711alawdec";
    defaults = [
        "libcodec2_soft-defaults"
        "libcodec2_soft_sanitize_all-defaults"
    ];

    srcs = ["C2SoftG711Dec.cpp"];

    cflags = [
        "-DALAW"
    ];
};

libcodec2_soft_g711mlawdec = cc_library_shared {
    name = "libcodec2_soft_g711mlawdec";
    defaults = [
        "libcodec2_soft-defaults"
        "libcodec2_soft_sanitize_all-defaults"
    ];

    srcs = ["C2SoftG711Dec.cpp"];
};

in { inherit libcodec2_soft_g711alawdec libcodec2_soft_g711mlawdec; }
