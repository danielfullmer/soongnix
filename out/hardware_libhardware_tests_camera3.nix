{ cc_test }:
let

camera3_tests = cc_test {
    name = "camera3_tests";
    srcs = ["camera3tests.cpp"];

    shared_libs = [
        "liblog"
        "libhardware"
        "libcamera_metadata"
    ];

    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
};

in { inherit camera3_tests; }
