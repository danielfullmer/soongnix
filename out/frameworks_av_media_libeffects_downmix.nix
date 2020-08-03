{ cc_library_shared }:
let

#  Multichannel downmix effect library
libdownmix = cc_library_shared {
    name = "libdownmix";

    vendor = true;
    srcs = ["EffectDownmix.c"];

    shared_libs = [
        "libcutils"
        "liblog"
    ];

    relative_install_path = "soundfx";

    cflags = [
        "-DBUILD_FLOAT"
        "-fvisibility=hidden"
        "-Wall"
        "-Werror"
    ];

    header_libs = [
        "libaudioeffects"
        "libhardware_headers"
    ];
    static_libs = ["libaudioutils"];
};

in { inherit libdownmix; }
