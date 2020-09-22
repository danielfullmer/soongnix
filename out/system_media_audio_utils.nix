{ cc_defaults, cc_library, cc_library_headers, cc_library_shared, cc_library_static }:
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

libaudioutils_headers = cc_library_headers {
    name = "libaudioutils_headers";
    host_supported = true;
    vendor_available = true;
    export_include_dirs = ["include"];
    sdk_version = "current";
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
        "fifo_writer_T.cpp"
        "format.c"
        "limiter.c"
        "Metadata.cpp"
        "minifloat.c"
        "mono_blend.cpp"
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
                #  "mono_blend.cpp",
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
    min_sdk_version = "29";
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
    min_sdk_version = "29";
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
    min_sdk_version = "29";
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

in { inherit audio_utils_defaults libaudiospdif libaudioutils libaudioutils_fixedfft libaudioutils_headers libfifo libsndfile; }
