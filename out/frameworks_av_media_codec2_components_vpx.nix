{ cc_library_shared }:
let

libcodec2_soft_vp9dec = cc_library_shared {
    name = "libcodec2_soft_vp9dec";
    defaults = [
        "libcodec2_soft-defaults"
        "libcodec2_soft_sanitize_all-defaults"
    ];

    srcs = ["C2SoftVpxDec.cpp"];

    shared_libs = ["libvpx"];

    cflags = [
        "-DVP9"
    ];
};

libcodec2_soft_vp8dec = cc_library_shared {
    name = "libcodec2_soft_vp8dec";
    defaults = [
        "libcodec2_soft-defaults"
        "libcodec2_soft_sanitize_all-defaults"
    ];

    srcs = ["C2SoftVpxDec.cpp"];

    shared_libs = ["libvpx"];
};

libcodec2_soft_vp9enc = cc_library_shared {
    name = "libcodec2_soft_vp9enc";
    defaults = [
        "libcodec2_soft-defaults"
        "libcodec2_soft_sanitize_all-defaults"
    ];

    srcs = [
        "C2SoftVp9Enc.cpp"
        "C2SoftVpxEnc.cpp"
    ];

    shared_libs = ["libvpx"];

    cflags = ["-DVP9"];
};

libcodec2_soft_vp8enc = cc_library_shared {
    name = "libcodec2_soft_vp8enc";
    defaults = [
        "libcodec2_soft-defaults"
        "libcodec2_soft_sanitize_all-defaults"
    ];

    srcs = [
        "C2SoftVp8Enc.cpp"
        "C2SoftVpxEnc.cpp"
    ];

    shared_libs = ["libvpx"];
};

in { inherit libcodec2_soft_vp8dec libcodec2_soft_vp8enc libcodec2_soft_vp9dec libcodec2_soft_vp9enc; }
