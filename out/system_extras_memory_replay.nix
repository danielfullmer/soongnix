{ cc_binary, cc_defaults, cc_test }:
let

memory_replay_defaults = cc_defaults {
    name = "memory_replay_defaults";
    host_supported = true;

    srcs = [
        "Action.cpp"
        "LineBuffer.cpp"
        "NativeInfo.cpp"
        "Pointers.cpp"
        "Thread.cpp"
        "Threads.cpp"
    ];
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
    shared_libs = ["libbase"];

    target = {
        darwin = {
            enabled = false;
        };
    };

    compile_multilib = "both";
    multilib = {
        lib32 = {
            suffix = "32";
        };
        lib64 = {
            suffix = "64";
        };
    };

};

memory_replay = cc_binary {
    name = "memory_replay";
    defaults = ["memory_replay_defaults"];

    srcs = ["main.cpp"];
};

memory_replay_tests = cc_test {
    name = "memory_replay_tests";
    defaults = ["memory_replay_defaults"];

    srcs = [
        "tests/ActionTest.cpp"
        "tests/LineBufferTest.cpp"
        "tests/NativeInfoTest.cpp"
        "tests/PointersTest.cpp"
        "tests/ThreadTest.cpp"
        "tests/ThreadsTest.cpp"
    ];

    local_include_dirs = ["tests"];

    target = {
        android = {
            test_suites = ["device-tests"];
        };
    };
};

in { inherit memory_replay memory_replay_defaults memory_replay_tests; }
