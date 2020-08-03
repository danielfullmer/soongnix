{ cc_library_shared }:
let

libcodec2_soft_amrnbdec = cc_library_shared {
    name = "libcodec2_soft_amrnbdec";
    defaults = [
        "libcodec2_soft-defaults"
        "libcodec2_soft_sanitize_all-defaults"
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

libcodec2_soft_amrwbdec = cc_library_shared {
    name = "libcodec2_soft_amrwbdec";
    defaults = [
        "libcodec2_soft-defaults"
        "libcodec2_soft_sanitize_all-defaults"
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

libcodec2_soft_amrnbenc = cc_library_shared {
    name = "libcodec2_soft_amrnbenc";
    defaults = [
        "libcodec2_soft-defaults"
        "libcodec2_soft_sanitize_all-defaults"
    ];

    srcs = ["C2SoftAmrNbEnc.cpp"];

    static_libs = [
        "libstagefright_amrnbenc"
    ];

    shared_libs = [
        "libstagefright_amrnb_common"
    ];
};

libcodec2_soft_amrwbenc = cc_library_shared {
    name = "libcodec2_soft_amrwbenc";
    defaults = [
        "libcodec2_soft-defaults"
        "libcodec2_soft_sanitize_all-defaults"
    ];

    srcs = ["C2SoftAmrWbEnc.cpp"];

    static_libs = [
        "libstagefright_amrwbenc"
    ];

    shared_libs = [
        "libstagefright_enc_common"
    ];
};

in { inherit libcodec2_soft_amrnbdec libcodec2_soft_amrnbenc libcodec2_soft_amrwbdec libcodec2_soft_amrwbenc; }
