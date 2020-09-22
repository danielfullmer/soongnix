{ cc_library_headers, cc_library_shared }:
let

#  Copyright 2006 The Android Open Source Project

libhardware_headers = cc_library_headers {
    name = "libhardware_headers";
    header_libs = [
        "libaudio_system_headers"
        "libsystem_headers"
        "libcutils_headers"
        "libbluetooth-types-header"
    ];
    export_header_lib_headers = [
        "libaudio_system_headers"
        "libsystem_headers"
        "libcutils_headers"
        "libbluetooth-types-header"
    ];

    export_include_dirs = ["include"];
    recovery_available = true;
    vendor_available = true;
    #  TODO(b/153609531): remove when no longer needed.
    native_bridge_supported = true;
    target = {
        recovery = {
            exclude_header_libs = [
                "libaudio_system_headers"
                "libbluetooth-types-header"
            ];
        };
    };
    min_sdk_version = "29";

};

libhardware = cc_library_shared {
    name = "libhardware";

    srcs = ["hardware.c"];
    shared_libs = [
        "libcutils"
        "liblog"
        "libdl"
        "libvndksupport"
    ];
    cflags = [
        "-DQEMU_HARDWARE"
        "-Wall"
        "-Werror"
    ];

    header_libs = ["libhardware_headers"];
    export_header_lib_headers = ["libhardware_headers"];

    recovery_available = true;
    vendor_available = true;
    vndk = {
        enabled = true;
        support_system_process = true;
    };
    target = {
        recovery = {
            exclude_shared_libs = ["libvndksupport"];
        };
    };
    min_sdk_version = "29";
};

in { inherit libhardware libhardware_headers; }
