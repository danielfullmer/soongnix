{ cc_defaults, cc_library_shared, cc_library_static }:
let

libaudioprocessing_defaults = cc_defaults {
    name = "libaudioprocessing_defaults";

    export_include_dirs = ["include"];

    header_libs = ["libaudioclient_headers"];

    shared_libs = [
        "libaudioutils"
        "libcutils"
        "liblog"
        "libutils"
    ];

    cflags = [
        "-Werror"
        "-Wall"

        #  uncomment to disable NEON on architectures that actually do support NEON, for benchmarking
        #  "-DUSE_NEON=false",
    ];

    arch = {
        x86 = {
            avx2 = {
                cflags = [
                    "-mavx2"
                    "-mfma"
                ];
            };
        };
        x86_64 = {
            avx2 = {
                cflags = [
                    "-mavx2"
                    "-mfma"
                ];
            };
        };
    };
};

libaudioprocessing = cc_library_shared {
    name = "libaudioprocessing";
    defaults = ["libaudioprocessing_defaults"];

    srcs = [
        "AudioMixer.cpp"
        "BufferProviders.cpp"
        "RecordBufferConverter.cpp"
    ];

    header_libs = [
        "libaudiohal_headers"
        "libbase_headers"
        "libmedia_headers"
    ];

    shared_libs = [
        "libaudiohal"
        "libsonic"
        "libvibrator"
    ];

    whole_static_libs = ["libaudioprocessing_base"];
};

libaudioprocessing_base = cc_library_static {
    name = "libaudioprocessing_base";
    defaults = ["libaudioprocessing_defaults"];
    vendor_available = true;

    srcs = [
        "AudioMixerBase.cpp"
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

in { inherit libaudioprocessing libaudioprocessing_base libaudioprocessing_defaults; }
