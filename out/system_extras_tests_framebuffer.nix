{ cc_binary }:
let

test-fb-refresh = cc_binary {
    name = "test-fb-refresh";
    srcs = ["refresh.c"];
    shared_libs = ["libcutils"];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
    ];
};

test-fb-simple = cc_binary {
    name = "test-fb-simple";
    srcs = ["fb_test.c"];
    static_executable = true;
    static_libs = ["libc"];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
    ];
};

in { inherit test-fb-refresh test-fb-simple; }
