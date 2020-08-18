{ cc_library_shared }:
let

libstagefright_soft_c2gsmdec = cc_library_shared {
    name = "libstagefright_soft_c2gsmdec";
    defaults = [
        "libstagefright_soft_c2-defaults"
        "libstagefright_soft_c2_sanitize_all-defaults"
    ];

    srcs = ["C2SoftGsmDec.cpp"];

    static_libs = ["libgsm"];
};

in { inherit libstagefright_soft_c2gsmdec; }
