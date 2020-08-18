{ cc_library_shared }:
let

libstagefright_soft_c2avcdec = cc_library_shared {
    name = "libstagefright_soft_c2avcdec";
    defaults = [
        "libstagefright_soft_c2-defaults"
        "libstagefright_soft_c2_sanitize_signed-defaults"
    ];

    static_libs = ["libavcdec"];

    srcs = ["C2SoftAvcDec.cpp"];

    include_dirs = [
        "external/libavc/decoder"
        "external/libavc/common"
    ];
};

libstagefright_soft_c2avcenc = cc_library_shared {
    name = "libstagefright_soft_c2avcenc";
    defaults = [
        "libstagefright_soft_c2-defaults"
        "libstagefright_soft_c2_sanitize_signed-defaults"
    ];

    static_libs = ["libavcenc"];

    srcs = ["C2SoftAvcEnc.cpp"];

    include_dirs = [
        "external/libavc/encoder"
        "external/libavc/common"
    ];

    cflags = [
        "-Wno-unused-variable"
    ];
};

in { inherit libstagefright_soft_c2avcdec libstagefright_soft_c2avcenc; }
