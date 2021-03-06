{ cc_library_shared }:
let

libcodec2_soft_avcdec = cc_library_shared {
    name = "libcodec2_soft_avcdec";
    defaults = [
        "libcodec2_soft-defaults"
        "libcodec2_soft_sanitize_signed-defaults"
    ];

    static_libs = ["libavcdec"];

    srcs = ["C2SoftAvcDec.cpp"];

    include_dirs = [
        "external/libavc/decoder"
        "external/libavc/common"
    ];
};

libcodec2_soft_avcenc = cc_library_shared {
    name = "libcodec2_soft_avcenc";
    defaults = [
        "libcodec2_soft-defaults"
        "libcodec2_soft_sanitize_signed-defaults"
    ];

    static_libs = ["libavcenc"];

    srcs = ["C2SoftAvcEnc.cpp"];

    include_dirs = [
        "external/libavc/encoder"
        "external/libavc/common"
    ];

    cflags = [
        "-Wno-unused-variable"
    ];
};

in { inherit libcodec2_soft_avcdec libcodec2_soft_avcenc; }
