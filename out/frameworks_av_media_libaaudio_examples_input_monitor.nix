{ cc_test }:
let

input_monitor = cc_test {
    name = "input_monitor";
    gtest = false;
    srcs = ["src/input_monitor.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = ["libaaudio"];
    header_libs = ["libaaudio_example_utils"];
    pack_relocations = false;
};

input_monitor_callback = cc_test {
    name = "input_monitor_callback";
    gtest = false;
    srcs = ["src/input_monitor_callback.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = ["libaaudio"];
    header_libs = ["libaaudio_example_utils"];
    pack_relocations = false;
};

in { inherit input_monitor input_monitor_callback; }
