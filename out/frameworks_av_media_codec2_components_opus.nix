{ cc_library_shared }:
let

libcodec2_soft_opusdec = cc_library_shared {
    name = "libcodec2_soft_opusdec";
    defaults = [
        "libcodec2_soft-defaults"
        "libcodec2_soft_sanitize_all-defaults"
    ];

    srcs = ["C2SoftOpusDec.cpp"];

    shared_libs = ["libopus"];
};

libcodec2_soft_opusenc = cc_library_shared {
    name = "libcodec2_soft_opusenc";
    defaults = [
        "libcodec2_soft-defaults"
        "libcodec2_soft_sanitize_all-defaults"
    ];

    srcs = ["C2SoftOpusEnc.cpp"];

    shared_libs = ["libopus"];
};

in { inherit libcodec2_soft_opusdec libcodec2_soft_opusenc; }
