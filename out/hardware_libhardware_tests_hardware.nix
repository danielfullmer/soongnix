{ cc_library_static }:
let

static-hal-check = cc_library_static {
    name = "static-hal-check";
    srcs = [
        "struct-size.cpp"
        "struct-offset.cpp"
        "struct-last.cpp"
    ];
    shared_libs = ["libhardware"];
    cflags = [
        "-O0"
        "-Wall"
        "-Werror"
    ];

    include_dirs = ["system/media/camera/include"];
};

in { inherit static-hal-check; }
