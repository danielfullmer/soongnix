{ cc_library_shared }:
let

libstagefright_soft_c2g711alawdec = cc_library_shared {
    name = "libstagefright_soft_c2g711alawdec";
    defaults = [
        "libstagefright_soft_c2-defaults"
        "libstagefright_soft_c2_sanitize_all-defaults"
    ];

    srcs = ["C2SoftG711Dec.cpp"];

    cflags = [
        "-DALAW"
    ];
};

libstagefright_soft_c2g711mlawdec = cc_library_shared {
    name = "libstagefright_soft_c2g711mlawdec";
    defaults = [
        "libstagefright_soft_c2-defaults"
        "libstagefright_soft_c2_sanitize_all-defaults"
    ];

    srcs = ["C2SoftG711Dec.cpp"];
};

in { inherit libstagefright_soft_c2g711alawdec libstagefright_soft_c2g711mlawdec; }
