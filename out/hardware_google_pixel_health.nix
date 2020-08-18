{ cc_library }:
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
        "libhidltransport"
        "libhwbinder"
        "libutils"
    ];
};

in { inherit libpixelhealth; }
