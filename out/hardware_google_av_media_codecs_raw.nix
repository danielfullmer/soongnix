{ cc_library_shared }:
let

libstagefright_soft_c2rawdec = cc_library_shared {
    name = "libstagefright_soft_c2rawdec";
    defaults = [
        "libstagefright_soft_c2-defaults"
        "libstagefright_soft_c2_sanitize_all-defaults"
    ];

    srcs = ["C2SoftRawDec.cpp"];
};

in { inherit libstagefright_soft_c2rawdec; }
