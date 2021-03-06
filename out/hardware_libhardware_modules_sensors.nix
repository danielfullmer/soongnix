{ cc_library_static, cc_test_host }:
let

multihal = cc_library_static {
    name = "multihal";
    vendor = true;
    srcs = [
        "multihal.cpp"
        "SensorEventQueue.cpp"
    ];
    header_libs = [
        "libhardware_headers"
    ];
    shared_libs = [
        "liblog"
        "libcutils"
        "libutils"
        "libdl"
    ];
    export_include_dirs = ["."];
    cflags = [
        "-Wall"
        "-Werror"
    ];
};

sensorstests = cc_test_host {
    name = "sensorstests";
    gtest = false;
    srcs = [
        "SensorEventQueue.cpp"
        "tests/SensorEventQueue_test.cpp"
    ];
    static_libs = [
        "libcutils"
        "libutils"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
};

in { inherit multihal sensorstests; }
