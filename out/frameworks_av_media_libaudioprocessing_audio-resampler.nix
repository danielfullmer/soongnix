{ cc_library_shared }:
let

libaudio-resampler = cc_library_shared {
    name = "libaudio-resampler";

    srcs = ["AudioResamplerCoefficients.cpp"];

    shared_libs = [
        "libutils"
        "liblog"
    ];

    cflags = [
        "-Werror"
        "-Wall"
    ];
};

in { inherit libaudio-resampler; }
