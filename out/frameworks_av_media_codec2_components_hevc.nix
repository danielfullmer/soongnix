{ cc_library_shared }:
let

libcodec2_soft_hevcdec = cc_library_shared {
    name = "libcodec2_soft_hevcdec";
    defaults = [
        "libcodec2_soft-defaults"
        "libcodec2_soft_sanitize_signed-defaults"
    ];

    srcs = ["C2SoftHevcDec.cpp"];

    static_libs = ["libhevcdec"];

};

libcodec2_soft_hevcenc = cc_library_shared {
    name = "libcodec2_soft_hevcenc";
    defaults = [
        "libcodec2_soft-defaults"
        "libcodec2_soft_sanitize_signed-defaults"
    ];

    srcs = ["C2SoftHevcEnc.cpp"];

    static_libs = ["libhevcenc"];

};

in { inherit libcodec2_soft_hevcdec libcodec2_soft_hevcenc; }
