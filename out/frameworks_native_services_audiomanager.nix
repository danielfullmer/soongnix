{ cc_library_shared }:
let

libaudiomanager = cc_library_shared {
    name = "libaudiomanager";

    srcs = [
        "IAudioManager.cpp"
    ];

    shared_libs = [
        "libutils"
        "libbinder"
        "liblog"
    ];

    cflags = [
        "-Wall"
        "-Werror"
        "-Wunused"
        "-Wunreachable-code"
    ];
};

in { inherit libaudiomanager; }
