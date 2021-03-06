{ cc_library_shared }:
let

libcodec2_soft_gsmdec = cc_library_shared {
    name = "libcodec2_soft_gsmdec";
    defaults = [
        "libcodec2_soft-defaults"
        "libcodec2_soft_sanitize_all-defaults"
    ];

    srcs = ["C2SoftGsmDec.cpp"];

    static_libs = ["libgsm"];
};

in { inherit libcodec2_soft_gsmdec; }
