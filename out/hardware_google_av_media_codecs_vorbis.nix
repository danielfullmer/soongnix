{ cc_library_shared }:
let

libstagefright_soft_c2vorbisdec = cc_library_shared {
    name = "libstagefright_soft_c2vorbisdec";
    defaults = [
        "libstagefright_soft_c2-defaults"
        "libstagefright_soft_c2_sanitize_all-defaults"
    ];

    srcs = ["C2SoftVorbisDec.cpp"];

    shared_libs = ["libvorbisidec"];
};

in { inherit libstagefright_soft_c2vorbisdec; }
