{ cc_test }:
let

#  Copyright 2006 The Android Open Source Project

angeles = cc_test {
    name = "angeles";

    srcs = [
        "app-linux.cpp"
        "demo.c"
    ];

    cflags = [
        "-Wall"
        "-Werror"
    ];

    gtest = false;

    shared_libs = [
        "libEGL"
        "libGLESv1_CM"
        "libui"
        "libgui"
        "libutils"
    ];

    static_libs = ["libglTest"];
};

in { inherit angeles; }
