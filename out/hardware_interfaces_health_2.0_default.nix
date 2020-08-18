{ cc_defaults, cc_library_shared, cc_library_static }:
let

"android.hardware.health@2.0-impl_defaults" = cc_defaults {
    name = "android.hardware.health@2.0-impl_defaults";

    recovery_available = true;
    cflags = [
        "-Wall"
        "-Werror"
    ];

    shared_libs = [
        "libbase"
        "libhidlbase"
        "libhidltransport"
        "libhwbinder"
        "liblog"
        "libutils"
        "libcutils"
        "android.hardware.health@2.0"
    ];

    static_libs = [
        "libbatterymonitor"
        "android.hardware.health@1.0-convert"
    ];
};

#  Helper library for implementing health HAL. It is recommended that a health
#  service or passthrough HAL link to this library.
"android.hardware.health@2.0-impl" = cc_library_static {
    name = "android.hardware.health@2.0-impl";
    defaults = ["android.hardware.health@2.0-impl_defaults"];

    vendor_available = true;
    srcs = [
        "Health.cpp"
        "healthd_common.cpp"
    ];

    export_include_dirs = ["include"];
};

#  Default passthrough implementation for recovery. Vendors can implement
#  android.hardware.health@2.0-impl-recovery-<device> to customize the behavior
#  of the HAL in recovery.
#  The implementation does NOT start the uevent loop for polling.
"android.hardware.health@2.0-impl-default" = cc_library_shared {
    name = "android.hardware.health@2.0-impl-default";
    defaults = ["android.hardware.health@2.0-impl_defaults"];

    recovery_available = true;
    relative_install_path = "hw";

    static_libs = [
        "android.hardware.health@2.0-impl"
        "libhealthstoragedefault"
    ];

    srcs = [
        "HealthImplDefault.cpp"
    ];
};

in { inherit "android.hardware.health@2.0-impl" "android.hardware.health@2.0-impl-default" "android.hardware.health@2.0-impl_defaults"; }
