{ cc_library_shared }:
let

libstagefright_soft_c2amrnbdec = cc_library_shared {
    name = "libstagefright_soft_c2amrnbdec";
    defaults = [
        "libstagefright_soft_c2-defaults"
        "libstagefright_soft_c2_sanitize_all-defaults"
    ];

    srcs = ["C2SoftAmrDec.cpp"];

    cflags = [
        "-DAMRNB"
    ];

    static_libs = [
        "libstagefright_amrnbdec"
        "libstagefright_amrwbdec"
    ];

    shared_libs = [
        "libstagefright_amrnb_common"
    ];
};

libstagefright_soft_c2amrwbdec = cc_library_shared {
    name = "libstagefright_soft_c2amrwbdec";
    defaults = [
        "libstagefright_soft_c2-defaults"
        "libstagefright_soft_c2_sanitize_all-defaults"
    ];

    srcs = ["C2SoftAmrDec.cpp"];

    static_libs = [
        "libstagefright_amrnbdec"
        "libstagefright_amrwbdec"
    ];

    shared_libs = [
        "libstagefright_amrnb_common"
    ];
};

libstagefright_soft_c2amrnbenc = cc_library_shared {
    name = "libstagefright_soft_c2amrnbenc";
    defaults = [
        "libstagefright_soft_c2-defaults"
        "libstagefright_soft_c2_sanitize_all-defaults"
    ];

    srcs = ["C2SoftAmrNbEnc.cpp"];

    static_libs = [
        "libstagefright_amrnbenc"
    ];

    shared_libs = [
        "libstagefright_amrnb_common"
    ];
};

libstagefright_soft_c2amrwbenc = cc_library_shared {
    name = "libstagefright_soft_c2amrwbenc";
    defaults = [
        "libstagefright_soft_c2-defaults"
        "libstagefright_soft_c2_sanitize_all-defaults"
    ];

    srcs = ["C2SoftAmrWbEnc.cpp"];

    static_libs = [
        "libstagefright_amrwbenc"
    ];

    shared_libs = [
        "libstagefright_enc_common"
    ];
};

in { inherit libstagefright_soft_c2amrnbdec libstagefright_soft_c2amrnbenc libstagefright_soft_c2amrwbdec libstagefright_soft_c2amrwbenc; }
