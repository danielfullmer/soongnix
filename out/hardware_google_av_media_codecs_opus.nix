{ cc_library_shared }:
let

libstagefright_soft_c2opusdec = cc_library_shared {
    name = "libstagefright_soft_c2opusdec";
    defaults = [
        "libstagefright_soft_c2-defaults"
        "libstagefright_soft_c2_sanitize_all-defaults"
    ];

    srcs = ["C2SoftOpusDec.cpp"];

    shared_libs = ["libopus"];
};

in { inherit libstagefright_soft_c2opusdec; }
