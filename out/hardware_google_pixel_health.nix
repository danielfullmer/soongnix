{ cc_library, cc_test }:
let

libpixelhealth = cc_library {
    name = "libpixelhealth";
    vendor = true;
    export_include_dirs = ["include"];

    srcs = [
        "BatteryMetricsLogger.cpp"
        "BatteryThermalControl.cpp"
        "CycleCountBackupRestore.cpp"
        "DeviceHealth.cpp"
        "LowBatteryShutdownMetrics.cpp"
        "BatteryDefender.cpp"
    ];

    cflags = [
        "-Wall"
        "-Werror"
    ];

    static_libs = [
        "libbatterymonitor"
    ];

    export_shared_lib_headers = [
        "android.frameworks.stats@1.0"
    ];

    shared_libs = [
        "android.frameworks.stats@1.0"
        "libbase"
        "libcutils"
        "libhidlbase"
        "libutils"
    ];
};

HealthTestCases = cc_test {
    name = "HealthTestCases";

    compile_multilib = "both";
    multilib = {
        lib32 = {
            suffix = "32";
        };
        lib64 = {
            suffix = "64";
        };
    };

    srcs = [
        "test/TestBatteryDefender.cpp"
    ];

    local_include_dirs = [
        "include/pixelhealth"
    ];

    static_libs = [
        "libgmock"
        "libpixelhealth"
    ];

    shared_libs = [
        "libbase"
        "libcutils"
        "libutils"
    ];

    test_suites = [
        "device-tests"
    ];
    vendor = true;
};

in { inherit HealthTestCases libpixelhealth; }
