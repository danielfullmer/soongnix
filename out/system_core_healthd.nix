{ cc_binary, cc_defaults, cc_library_headers, cc_library_static }:
let

libhealthd_headers = cc_library_headers {
    name = "libhealthd_headers";
    vendor_available = true;
    recovery_available = true;
    export_include_dirs = ["include"];
    header_libs = ["libbatteryservice_headers"];
    export_header_lib_headers = ["libbatteryservice_headers"];
};

libbatterymonitor = cc_library_static {
    name = "libbatterymonitor";
    srcs = ["BatteryMonitor.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    vendor_available = true;
    recovery_available = true;
    export_include_dirs = ["include"];
    shared_libs = [
        "libutils"
        "libbase"
    ];
    header_libs = ["libhealthd_headers"];
    export_header_lib_headers = ["libhealthd_headers"];
};

"android.hardware.health@2.0-service_defaults" = cc_defaults {
    name = "android.hardware.health@2.0-service_defaults";

    cflags = [
        "-Wall"
        "-Werror"
    ];

    static_libs = [
        "android.hardware.health@2.0-impl"
        "android.hardware.health@1.0-convert"
        "libhealthservice"
        "libhealthstoragedefault"
        "libbatterymonitor"
    ];

    shared_libs = [
        "libbase"
        "libcutils"
        "libhidlbase"
        "libhidltransport"
        "libhwbinder"
        "liblog"
        "libutils"
        "android.hardware.health@2.0"
    ];
};

"android.hardware.health@2.0-service" = cc_binary {
    name = "android.hardware.health@2.0-service";
    defaults = ["android.hardware.health@2.0-service_defaults"];

    vendor = true;
    relative_install_path = "hw";
    init_rc = ["android.hardware.health@2.0-service.rc"];
    srcs = [
        "HealthServiceDefault.cpp"
    ];

    overrides = [
        "healthd"
    ];
};

healthd = cc_binary {
    name = "healthd";
    defaults = ["android.hardware.health@2.0-service_defaults"];

    init_rc = ["healthd.rc"];
    srcs = [
        "HealthServiceHealthd.cpp"
    ];
    local_include_dirs = ["include"];

    shared_libs = [
        "android.hardware.health@1.0"
    ];

    vintf_fragments = [
        "manifest_healthd.xml"
    ];
};

libhealthd_charger_nops = cc_library_static {
    name = "libhealthd_charger_nops";

    srcs = [
        "healthd_mode_charger_nops.cpp"
    ];

    cflags = [
        "-Wall"
        "-Werror"
    ];

    header_libs = [
        "libhealthd_headers"
    ];

    static_libs = [
        "android.hardware.health@2.0-impl"
    ];

    shared_libs = [
        "android.hardware.health@2.0"
        "libutils"
    ];
};

in { inherit "android.hardware.health@2.0-service" "android.hardware.health@2.0-service_defaults" healthd libbatterymonitor libhealthd_charger_nops libhealthd_headers; }
