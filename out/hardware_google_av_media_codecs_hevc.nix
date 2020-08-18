{ cc_library_shared }:
let

libstagefright_soft_c2hevcdec = cc_library_shared {
    name = "libstagefright_soft_c2hevcdec";
    defaults = [
        "libstagefright_soft_c2-defaults"
        "libstagefright_soft_c2_sanitize_signed-defaults"
    ];

    srcs = ["C2SoftHevcDec.cpp"];

    static_libs = ["libhevcdec"];

    include_dirs = [
        "external/libhevc/decoder"
        "external/libhevc/common"
    ];
};

in { inherit libstagefright_soft_c2hevcdec; }
