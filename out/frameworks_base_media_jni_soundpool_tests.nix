{ cc_binary }:
let

soundpool_stress = cc_binary {
    name = "soundpool_stress";
    host_supported = false;

    include_dirs = [
        "frameworks/base/media/jni/"
    ];

    shared_libs = [
        "libaudioutils"
        "libbinder"
        "liblog"
        "libmedia"
        "libsoundpool"
        "libstagefright"
        "libutils"
    ];

    header_libs = [
        "libmediametrics_headers"
    ];

    srcs = [
        "soundpool_stress.cpp"
    ];

    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
    ];
};

in { inherit soundpool_stress; }
