{ cc_library_shared }:
let

libstagefright_soft_c2mpeg2dec = cc_library_shared {
    name = "libstagefright_soft_c2mpeg2dec";
    defaults = [
        "libstagefright_soft_c2-defaults"
        "libstagefright_soft_c2_sanitize_signed-defaults"
    ];

    srcs = ["C2SoftMpeg2Dec.cpp"];

    static_libs = ["libmpeg2dec"];

    include_dirs = [
        "external/libmpeg2/decoder"
        "external/libmpeg2/common"
    ];
};

in { inherit libstagefright_soft_c2mpeg2dec; }
