{ cc_library_shared }:
let

libsensorservicehidl = cc_library_shared {
    name = "libsensorservicehidl";
    srcs = [
        "EventQueue.cpp"
        "DirectReportChannel.cpp"
        "SensorManager.cpp"
        "utils.cpp"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = [
        "libbase"
        "libhidlbase"
        "libhidltransport"
        "libhwbinder"
        "libutils"
        "libsensor"
        "android.frameworks.sensorservice@1.0"
        "android.hardware.sensors@1.0"
    ];
    static_libs = [
        "android.hardware.sensors@1.0-convert"
    ];
    export_include_dirs = [
        "include/"
    ];
    local_include_dirs = [
        "include/sensorservicehidl/"
    ];
};

in { inherit libsensorservicehidl; }
