{ cc_library_shared }:
let

libcodec2_soft_mp3dec = cc_library_shared {
    name = "libcodec2_soft_mp3dec";
    defaults = [
        "libcodec2_soft-defaults"
        "libcodec2_soft_sanitize_all-defaults"
    ];

    srcs = ["C2SoftMp3Dec.cpp"];

    static_libs = ["libstagefright_mp3dec"];
};

in { inherit libcodec2_soft_mp3dec; }
