{ cc_binary, cc_library_shared, cc_library_static }:
let

"android.hardware.health@1.0-convert" = cc_library_static {
    name = "android.hardware.health@1.0-convert";
    vendor_available = true;
    recovery_available = true;
    srcs = ["convert.cpp"];
    include_dirs = [
        "system/core/base/include"
    ];
    header_libs = ["libhealthd_headers"];
    export_header_lib_headers = ["libhealthd_headers"];
    export_include_dirs = ["include"];
    shared_libs = [
        "libcutils"
        "libhidlbase"
        "libutils"
        "android.hardware.health@1.0"
    ];

};

"android.hardware.health@1.0-impl-helper" = cc_library_static {
    name = "android.hardware.health@1.0-impl-helper";
    vendor = true;
    srcs = ["Health.cpp"];

    header_libs = [
        "libbase_headers"
        "libhealthd_headers"
    ];

    shared_libs = [
        "libcutils"
        "libhidlbase"
        "liblog"
        "libutils"
        "android.hardware.health@1.0"
    ];

    static_libs = [
        "android.hardware.health@1.0-convert"
    ];
};

"android.hardware.health@1.0-impl" = cc_library_shared {
    name = "android.hardware.health@1.0-impl";
    vendor = true;
    relative_install_path = "hw";

    static_libs = [
        "android.hardware.health@1.0-impl-helper"
        "android.hardware.health@1.0-convert"
        "libhealthd.default"
    ];
};

"android.hardware.health@1.0-service" = cc_binary {
    name = "android.hardware.health@1.0-service";
    vendor = true;
    relative_install_path = "hw";
    init_rc = ["android.hardware.health@1.0-service.rc"];
    srcs = ["HealthService.cpp"];

    shared_libs = [
        "liblog"
        "libcutils"
        "libdl"
        "libbase"
        "libutils"
        "libhidlbase"
        "android.hardware.health@1.0"
    ];
};

in { inherit "android.hardware.health@1.0-convert" "android.hardware.health@1.0-impl" "android.hardware.health@1.0-impl-helper" "android.hardware.health@1.0-service"; }
