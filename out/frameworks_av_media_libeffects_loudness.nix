{ cc_library_shared }:
let

#  LoudnessEnhancer library
libldnhncr = cc_library_shared {
    name = "libldnhncr";

    vendor = true;
    srcs = [
        "EffectLoudnessEnhancer.cpp"
        "dsp/core/dynamic_range_compression.cpp"
    ];

    cflags = [
        "-O2"
        "-fvisibility=hidden"

        "-Wall"
        "-Werror"
    ];

    shared_libs = [
        "libcutils"
        "liblog"
    ];

    relative_install_path = "soundfx";

    header_libs = ["libaudioeffects"];
};

in { inherit libldnhncr; }
