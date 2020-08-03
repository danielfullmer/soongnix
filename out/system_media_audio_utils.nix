{ cc_defaults, cc_library, cc_library_shared, cc_library_static }:
let

subdirs = ["tests"];

audio_utils_defaults = cc_defaults {
    name = "audio_utils_defaults";

    local_include_dirs = ["include"];
    export_include_dirs = ["include"];

    cflags = [
        "-Werror"
        "-Wall"
    ];
};

libaudioutils = cc_library {
    name = "libaudioutils";
    vendor_available = true;
    vndk = {
        enabled = true;
    };
    double_loadable = true;
    host_supported = true;
    defaults = ["audio_utils_defaults"];

    srcs = [
        "Balance.cpp"
        "channels.c"
        "ErrorLog.cpp"
        "fifo.cpp"
        "fifo_index.cpp"
        "fifo_writer32.cpp"
        "format.c"
        "limiter.c"
        "minifloat.c"
        "power.cpp"
        "PowerLog.cpp"
        "primitives.c"
        "roundup.c"
        "sample.c"
    ];

    header_libs = [
        "libaudio_system_headers"
        "libutils_headers"
    ];

    export_header_lib_headers = [
        "libaudio_system_headers"
        "libutils_headers"
    ];

    shared_libs = [
        "libcutils"
        "liblog"
    ];

    target = {
        android = {
            srcs = [
                "mono_blend.cpp"
                "resampler.c"
                "echo_reference.c"
            ];
            whole_static_libs = ["libaudioutils_fixedfft"];
            shared_libs = [
                "libspeexresampler"
            ];
        };
        host = {
            cflags = ["-D__unused=__attribute__((unused))"];
        };
    };
};

libaudioutils_fixedfft = cc_library_static {
    name = "libaudioutils_fixedfft";
    vendor_available = true;
    defaults = ["audio_utils_defaults"];

    arch = {
        arm = {
            instruction_set = "arm";
        };
    };

    srcs = ["fixedfft.cpp"];
};

libsndfile = cc_library_static {
    name = "libsndfile";
    defaults = ["audio_utils_defaults"];
    host_supported = true;
    srcs = ["tinysndfile.c"];
    cflags = [
        "-UHAVE_STDERR"
    ];
};

libfifo = cc_library_static {
    name = "libfifo";
    defaults = ["audio_utils_defaults"];
    srcs = [
        "fifo.cpp"
        "fifo_index.cpp"
        "primitives.c"
        "roundup.c"
    ];
};

libaudiospdif = cc_library_shared {
    name = "libaudiospdif";
    defaults = ["audio_utils_defaults"];

    srcs = [
        "spdif/BitFieldParser.cpp"
        "spdif/FrameScanner.cpp"
        "spdif/AC3FrameScanner.cpp"
        "spdif/DTSFrameScanner.cpp"
        "spdif/SPDIFEncoder.cpp"
    ];

    shared_libs = [
        "libcutils"
        "liblog"
    ];
};

in { inherit audio_utils_defaults libaudiospdif libaudioutils libaudioutils_fixedfft libfifo libsndfile; }
