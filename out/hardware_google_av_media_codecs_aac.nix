{ cc_library_shared }:
let

libstagefright_soft_c2aacdec = cc_library_shared {
    name = "libstagefright_soft_c2aacdec";
    defaults = [
        "libstagefright_soft_c2-defaults"
        "libstagefright_soft_c2_sanitize_all-defaults"
    ];

    srcs = [
        "C2SoftAacDec.cpp"
        "DrcPresModeWrap.cpp"
    ];

    static_libs = [
        "libFraunhoferAAC"
    ];
};

libstagefright_soft_c2aacenc = cc_library_shared {
    name = "libstagefright_soft_c2aacenc";
    defaults = [
        "libstagefright_soft_c2-defaults"
        "libstagefright_soft_c2_sanitize_all-defaults"
    ];

    srcs = ["C2SoftAacEnc.cpp"];

    static_libs = [
        "libFraunhoferAAC"
    ];
};

in { inherit libstagefright_soft_c2aacdec libstagefright_soft_c2aacenc; }
