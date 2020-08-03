{ cc_binary, cc_test }:
let

#  bugreportz
#  ==========
bugreportz = cc_binary {
    name = "bugreportz";

    srcs = [
        "bugreportz.cpp"
        "main.cpp"
    ];

    cflags = [
        "-Werror"
        "-Wall"
    ];

    shared_libs = [
        "libbase"
        "libcutils"
    ];
};

#  bugreportz_test
#  ===============
bugreportz_test = cc_test {
    name = "bugreportz_test";
    test_suites = ["device-tests"];

    cflags = [
        "-Werror"
        "-Wall"
    ];

    srcs = [
        "bugreportz.cpp"
        "bugreportz_test.cpp"
    ];

    static_libs = ["libgmock"];

    shared_libs = [
        "libbase"
        "libutils"
    ];
};

in { inherit bugreportz bugreportz_test; }
