{ cc_library_shared }:
let

libcodec2_soft_mpeg2dec = cc_library_shared {
    name = "libcodec2_soft_mpeg2dec";
    defaults = [
        "libcodec2_soft-defaults"
        "libcodec2_soft_sanitize_signed-defaults"
    ];

    srcs = ["C2SoftMpeg2Dec.cpp"];

    static_libs = ["libmpeg2dec"];

    include_dirs = [
        "external/libmpeg2/decoder"
        "external/libmpeg2/common"
    ];
};

in { inherit libcodec2_soft_mpeg2dec; }
