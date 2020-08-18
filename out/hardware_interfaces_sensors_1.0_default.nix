{ cc_binary, cc_library_shared, cc_library_static }:
let

"android.hardware.sensors@1.0-impl" = cc_library_shared {
    name = "android.hardware.sensors@1.0-impl";
    defaults = ["hidl_defaults"];
    proprietary = true;
    relative_install_path = "hw";
    srcs = ["Sensors.cpp"];
    shared_libs = [
        "liblog"
        "libcutils"
        "libhardware"
        "libbase"
        "libutils"
        "libhidlbase"
        "libhidltransport"
        "android.hardware.sensors@1.0"
    ];
    static_libs = [
        "android.hardware.sensors@1.0-convert"
        "multihal"
    ];
    local_include_dirs = ["include/sensors"];
};

"android.hardware.sensors@1.0-convert" = cc_library_static {
    name = "android.hardware.sensors@1.0-convert";
    vendor_available = true;
    defaults = ["hidl_defaults"];
    srcs = ["convert.cpp"];
    export_include_dirs = ["include"];
    shared_libs = [
        "liblog"
        "libcutils"
        "libhardware"
        "libbase"
        "libutils"
        "libhidlbase"
        "libhidltransport"
        "android.hardware.sensors@1.0"
    ];
    local_include_dirs = ["include/sensors"];
    export_shared_lib_headers = [
        "libhardware"
    ];
};

"android.hardware.sensors@1.0-service" = cc_binary {
    name = "android.hardware.sensors@1.0-service";
    relative_install_path = "hw";
    vendor = true;
    init_rc = ["android.hardware.sensors@1.0-service.rc"];
    srcs = ["service.cpp"];

    shared_libs = [
        "liblog"
        "libcutils"
        "libdl"
        "libbase"
        "libutils"
        "libhidlbase"
        "libhidltransport"
        "android.hardware.sensors@1.0"
    ];
};

in { inherit "android.hardware.sensors@1.0-convert" "android.hardware.sensors@1.0-impl" "android.hardware.sensors@1.0-service"; }