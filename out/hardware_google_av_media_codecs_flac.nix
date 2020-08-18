{ cc_library_shared }:
let

libstagefright_soft_c2flacdec = cc_library_shared {
    name = "libstagefright_soft_c2flacdec";
    defaults = [
        "libstagefright_soft_c2-defaults"
        "libstagefright_soft_c2_sanitize_all-defaults"
    ];

    header_libs = ["libFLAC-headers"];

    srcs = ["C2SoftFlacDec.cpp"];

    shared_libs = [
        "libstagefright_flacdec"
    ];
};

libstagefright_soft_c2flacenc = cc_library_shared {
    name = "libstagefright_soft_c2flacenc";
    defaults = [
        "libstagefright_soft_c2-defaults"
        "libstagefright_soft_c2_sanitize_all-defaults"
    ];

    srcs = ["C2SoftFlacEnc.cpp"];

    static_libs = ["libFLAC"];
};

in { inherit libstagefright_soft_c2flacdec libstagefright_soft_c2flacenc; }
