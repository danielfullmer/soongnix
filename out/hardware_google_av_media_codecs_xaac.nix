{ cc_library_shared }:
let

libstagefright_soft_c2xaacdec = cc_library_shared {
    name = "libstagefright_soft_c2xaacdec";
    defaults = [
        "libstagefright_soft_c2-defaults"
        "libstagefright_soft_c2_sanitize_all-defaults"
    ];

    srcs = ["C2SoftXaacDec.cpp"];

    static_libs = ["libxaacdec"];
};

in { inherit libstagefright_soft_c2xaacdec; }
