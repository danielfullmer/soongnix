{ cc_binary, cc_defaults, cc_library_headers, cc_library_static, cc_test, sysprop_library }:
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

        #  Need latest HealthInfo definition from headers of this shared
        #  library. Clients don't need to link to this.
        "android.hardware.health@2.1"
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
    recovery_available = true;

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
        "libhealthloop"
        "libhealth2impl"
    ];

    shared_libs = [
        "android.hardware.health@2.1"
        "libutils"
    ];
};

charger_sysprop = sysprop_library {
    name = "charger_sysprop";
    recovery_available = true;
    srcs = ["charger.sysprop"];
    property_owner = "Platform";
    api_packages = ["android.sysprop"];
};

libhealthd_draw = cc_library_static {
    name = "libhealthd_draw";
    export_include_dirs = ["."];
    static_libs = [
        "libcharger_sysprop"
        "libminui"
    ];
    shared_libs = [
        "libbase"
    ];
    header_libs = ["libbatteryservice_headers"];

    srcs = ["healthd_draw.cpp"];
};

libhealthd_charger = cc_library_static {
    name = "libhealthd_charger";
    local_include_dirs = ["include"];
    export_include_dirs = [
        "."
        "include"
    ];

    static_libs = [
        "android.hardware.health@1.0-convert"
        "libcharger_sysprop"
        "libhealthd_draw"
        "libhealthloop"
        "libhealth2impl"
        "libminui"
    ];

    shared_libs = [
        "android.hardware.health@2.1"
        "libbase"
        "libcutils"
        "liblog"
        "libpng"
        "libsuspend"
        "libutils"
    ];

    srcs = [
        "healthd_mode_charger.cpp"
        "AnimationParser.cpp"
    ];
};

charger_defaults = cc_defaults {
    name = "charger_defaults";

    cflags = [
        "-Wall"
        "-Werror"
    ];

    shared_libs = [
        #  common
        "android.hardware.health@2.0"
        "android.hardware.health@2.1"
        "libbase"
        "libcutils"
        "libhidlbase"
        "liblog"
        "libutils"

        #  system charger only
        "libpng"
    ];

    static_libs = [
        #  common
        "android.hardware.health@1.0-convert"
        "libbatterymonitor"
        "libcharger_sysprop"
        "libhealthd_charger_nops"
        "libhealthloop"
        "libhealth2impl"

        #  system charger only
        "libhealthd_draw"
        "libhealthd_charger"
        "libminui"
        "libsuspend"
    ];
};

charger = cc_binary {
    name = "charger";
    defaults = ["charger_defaults"];
    recovery_available = true;
    srcs = [
        "charger.cpp"
        "charger_utils.cpp"
    ];

    target = {
        recovery = {
            #  No UI and libsuspend for recovery charger.
            cflags = [
                "-DCHARGER_FORCE_NO_UI=1"
            ];
            exclude_shared_libs = [
                "libpng"
            ];
            exclude_static_libs = [
                "libhealthd_draw"
                "libhealthd_charger"
                "libminui"
                "libsuspend"
            ];
        };
    };
};

charger_test = cc_test {
    name = "charger_test";
    defaults = ["charger_defaults"];
    srcs = ["charger_test.cpp"];
};

in { inherit "android.hardware.health@2.0-service" "android.hardware.health@2.0-service_defaults" charger charger_defaults charger_sysprop charger_test healthd libbatterymonitor libhealthd_charger libhealthd_charger_nops libhealthd_draw libhealthd_headers; }
