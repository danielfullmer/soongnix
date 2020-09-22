{ cc_library_shared }:
let

libcodec2_soft_vorbisdec = cc_library_shared {
    name = "libcodec2_soft_vorbisdec";
    defaults = [
        "libcodec2_soft-defaults"
        "libcodec2_soft_sanitize_all-defaults"
    ];

    srcs = ["C2SoftVorbisDec.cpp"];

    static_libs = ["libvorbisidec"];
};

in { inherit libcodec2_soft_vorbisdec; }
