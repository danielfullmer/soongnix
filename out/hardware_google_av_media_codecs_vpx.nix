{ cc_library_shared }:
let

libstagefright_soft_c2vp9dec = cc_library_shared {
    name = "libstagefright_soft_c2vp9dec";
    defaults = [
        "libstagefright_soft_c2-defaults"
        "libstagefright_soft_c2_sanitize_all-defaults"
    ];

    srcs = ["C2SoftVpxDec.cpp"];

    shared_libs = ["libvpx"];

    cflags = [
        "-DVP9"
    ];
};

libstagefright_soft_c2vp8dec = cc_library_shared {
    name = "libstagefright_soft_c2vp8dec";
    defaults = [
        "libstagefright_soft_c2-defaults"
        "libstagefright_soft_c2_sanitize_all-defaults"
    ];

    srcs = ["C2SoftVpxDec.cpp"];

    shared_libs = ["libvpx"];
};

libstagefright_soft_c2vp9enc = cc_library_shared {
    name = "libstagefright_soft_c2vp9enc";
    defaults = [
        "libstagefright_soft_c2-defaults"
        "libstagefright_soft_c2_sanitize_all-defaults"
    ];

    srcs = [
        "C2SoftVp9Enc.cpp"
        "C2SoftVpxEnc.cpp"
    ];

    shared_libs = ["libvpx"];

    cflags = ["-DVP9"];
};

libstagefright_soft_c2vp8enc = cc_library_shared {
    name = "libstagefright_soft_c2vp8enc";
    defaults = [
        "libstagefright_soft_c2-defaults"
        "libstagefright_soft_c2_sanitize_all-defaults"
    ];

    srcs = [
        "C2SoftVp8Enc.cpp"
        "C2SoftVpxEnc.cpp"
    ];

    shared_libs = ["libvpx"];
};

in { inherit libstagefright_soft_c2vp8dec libstagefright_soft_c2vp8enc libstagefright_soft_c2vp9dec libstagefright_soft_c2vp9enc; }
