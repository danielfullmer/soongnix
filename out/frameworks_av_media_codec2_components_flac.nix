{ cc_library_shared }:
let

libcodec2_soft_flacdec = cc_library_shared {
    name = "libcodec2_soft_flacdec";
    defaults = [
        "libcodec2_soft-defaults"
        "libcodec2_soft_sanitize_all-defaults"
    ];

    header_libs = ["libFLAC-headers"];

    srcs = ["C2SoftFlacDec.cpp"];

    shared_libs = [
        "libstagefright_flacdec"
    ];
};

libcodec2_soft_flacenc = cc_library_shared {
    name = "libcodec2_soft_flacenc";
    defaults = [
        "libcodec2_soft-defaults"
        "libcodec2_soft_sanitize_all-defaults"
    ];

    srcs = ["C2SoftFlacEnc.cpp"];

    shared_libs = [
        "libaudioutils"
    ];

    static_libs = [
        "libFLAC"
    ];
};

in { inherit libcodec2_soft_flacdec libcodec2_soft_flacenc; }
