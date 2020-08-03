{ cc_library_shared }:
let

libcodec2_soft_xaacdec = cc_library_shared {
    name = "libcodec2_soft_xaacdec";
    defaults = [
        "libcodec2_soft-defaults"
        "libcodec2_soft_sanitize_all-defaults"
    ];

    srcs = ["C2SoftXaacDec.cpp"];

    static_libs = ["libxaacdec"];
};

in { inherit libcodec2_soft_xaacdec; }
