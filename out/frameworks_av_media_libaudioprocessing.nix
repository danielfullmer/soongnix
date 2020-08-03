{ cc_defaults, cc_library_shared, cc_library_static }:
let

libaudioprocessing_defaults = cc_defaults {
    name = "libaudioprocessing_defaults";

    export_include_dirs = ["include"];

    shared_libs = [
        "libaudiohal"
        "libaudioutils"
        "libcutils"
        "liblog"
        "libnbaio"
        "libnblog"
        "libsonic"
        "libutils"
        "libvibrator"
    ];

    header_libs = [
        "libbase_headers"
    ];

    cflags = [
        "-Werror"
        "-Wall"

        #  uncomment to disable NEON on architectures that actually do support NEON, for benchmarking
        #  "-DUSE_NEON=false",
    ];
};

libaudioprocessing = cc_library_shared {
    name = "libaudioprocessing";
    defaults = ["libaudioprocessing_defaults"];

    srcs = [
        "BufferProviders.cpp"
        "RecordBufferConverter.cpp"
    ];
    whole_static_libs = ["libaudioprocessing_arm"];
};

libaudioprocessing_arm = cc_library_static {
    name = "libaudioprocessing_arm";
    defaults = ["libaudioprocessing_defaults"];

    srcs = [
        "AudioMixer.cpp"
        "AudioResampler.cpp"
        "AudioResamplerCubic.cpp"
        "AudioResamplerSinc.cpp"
        "AudioResamplerDyn.cpp"
    ];

    arch = {
        arm = {
            instruction_set = "arm";
        };
    };
};

in { inherit libaudioprocessing libaudioprocessing_arm libaudioprocessing_defaults; }
