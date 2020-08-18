{ cc_library_shared }:
let

libstagefright_soft_c2mp3dec = cc_library_shared {
    name = "libstagefright_soft_c2mp3dec";
    defaults = [
        "libstagefright_soft_c2-defaults"
        "libstagefright_soft_c2_sanitize_all-defaults"
    ];

    srcs = ["C2SoftMp3Dec.cpp"];

    static_libs = ["libstagefright_mp3dec"];
};

in { inherit libstagefright_soft_c2mp3dec; }
