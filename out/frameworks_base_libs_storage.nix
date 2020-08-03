{ cc_library_static }:
let

libstorage = cc_library_static {
    name = "libstorage";

    srcs = [
        "IMountServiceListener.cpp"
        "IMountShutdownObserver.cpp"
        "IObbActionListener.cpp"
        "IMountService.cpp"
        "ObbInfo.cpp"
    ];

    export_include_dirs = ["include"];

    cflags = [
        "-Wall"
        "-Werror"
    ];

    shared_libs = ["libbinder"];
};

in { inherit libstorage; }
