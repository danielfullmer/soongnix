{ cc_test }:
let

#  Copyright 2006 The Android Open Source Project

time-unit-tests = cc_test {
    name = "time-unit-tests";
    cflags = [
        "-fstack-protector-all"
        "-g"
        "-Wextra"
        "-fno-builtin"
    ];
    srcs = [
        "rtc_test.cpp"
    ];
    shared_libs = [
        "libbase"
    ];
};

timetest = cc_test {
    name = "timetest";
    srcs = ["timetest.c"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    static_executable = true;
    static_libs = ["libc"];
};

in { inherit time-unit-tests timetest; }
