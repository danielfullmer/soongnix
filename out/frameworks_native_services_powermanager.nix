{ cc_library_shared }:
let

libpowermanager = cc_library_shared {
    name = "libpowermanager";

    srcs = ["IPowerManager.cpp"];

    shared_libs = [
        "libutils"
        "libbinder"
    ];

    cflags = [
        "-Wall"
        "-Werror"
        "-Wunused"
        "-Wunreachable-code"
    ];
};

in { inherit libpowermanager; }
