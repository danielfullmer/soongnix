{ cc_test }:
let

oob_oggpack_look = cc_test {
    name = "oob_oggpack_look";
    gtest = true;
    test_suites = ["device-tests"];

    srcs = ["test_floor0.cpp"];

    #  compile_multilib: "64",

    static_libs = [
        "libvorbisidec"
        "liblog"
    ];

    shared_libs = [
        "libutils"
        "liblog"
    ];

    cflags = [
        "-Wall"
        "-Werror"
    ];

    sanitize = {
        integer_overflow = true;
        misc_undefined = ["bounds"];
        diag = {
            integer_overflow = true;
            undefined = true;
            misc_undefined = ["bounds"];
        };
    };
};

in { inherit oob_oggpack_look; }
