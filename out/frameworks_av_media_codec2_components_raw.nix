{ cc_library_shared }:
let

libcodec2_soft_rawdec = cc_library_shared {
    name = "libcodec2_soft_rawdec";
    defaults = [
        "libcodec2_soft-defaults"
        "libcodec2_soft_sanitize_all-defaults"
    ];

    srcs = ["C2SoftRawDec.cpp"];
};

in { inherit libcodec2_soft_rawdec; }
