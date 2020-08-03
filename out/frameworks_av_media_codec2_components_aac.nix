{ cc_library_shared }:
let

libcodec2_soft_aacdec = cc_library_shared {
    name = "libcodec2_soft_aacdec";
    defaults = [
        "libcodec2_soft-defaults"
        "libcodec2_soft_sanitize_all-defaults"
    ];

    srcs = [
        "C2SoftAacDec.cpp"
        "DrcPresModeWrap.cpp"
    ];

    static_libs = [
        "libFraunhoferAAC"
    ];
};

libcodec2_soft_aacenc = cc_library_shared {
    name = "libcodec2_soft_aacenc";
    defaults = [
        "libcodec2_soft-defaults"
        "libcodec2_soft_sanitize_all-defaults"
    ];

    srcs = ["C2SoftAacEnc.cpp"];

    static_libs = [
        "libFraunhoferAAC"
    ];
};

in { inherit libcodec2_soft_aacdec libcodec2_soft_aacenc; }
