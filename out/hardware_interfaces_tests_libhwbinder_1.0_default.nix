{ cc_library }:
let

"android.hardware.tests.libhwbinder@1.0-impl.test" = cc_library {
    name = "android.hardware.tests.libhwbinder@1.0-impl.test";
    defaults = ["hidl_defaults"];
    relative_install_path = "hw";
    srcs = [
        "Benchmark.cpp"
        "ScheduleTest.cpp"
    ];
    shared_libs = [
        "libcutils"
        "libhidlbase"
        "liblog"
        "libutils"
    ];
    static_libs = ["android.hardware.tests.libhwbinder@1.0"];
};

in { inherit "android.hardware.tests.libhwbinder@1.0-impl.test"; }
