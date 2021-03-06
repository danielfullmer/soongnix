{ cc_test }:
let

#  Build testbench for downmix module.
downmixtest = cc_test {
    name = "downmixtest";
    host_supported = false;
    proprietary = true;
    include_dirs = [
        "frameworks/av/media/libeffects/downmix"
    ];

    header_libs = [
        "libaudioeffects"
    ];

    shared_libs = [
        "libaudioutils"
        "libdownmix"
        "liblog"
    ];

    relative_install_path = "soundfx";

    srcs = [
        "downmixtest.cpp"
    ];

    cflags = [
        "-Werror"
        "-Wextra"
    ];
};

in { inherit downmixtest; }
