{ cc_defaults, cc_library, cc_library_headers, cc_library_shared, cc_test }:
let

#  Copyright 2006 The Android Open Source Project

libhardware_legacy_headers = cc_library_headers {
    name = "libhardware_legacy_headers";
    vendor_available = true;
    export_include_dirs = ["include"];

    header_libs = ["libcutils_headers"];
    export_header_lib_headers = ["libcutils_headers"];
};

libpower_defaults = cc_defaults {
    name = "libpower_defaults";
    defaults = ["system_suspend_defaults"];
    cflags = [
        "-Wexit-time-destructors"
        "-fno-c++-static-destructors"
    ];
};

libpower = cc_library {
    name = "libpower";
    defaults = ["libpower_defaults"];
    srcs = ["power.cpp"];
    export_include_dirs = ["include"];
    shared_libs = ["android.system.suspend@1.0"];
    vendor_available = true;
    vndk = {
        enabled = true;
    };
};

libpower_test = cc_test {
    name = "libpower_test";
    defaults = ["libpower_defaults"];
    srcs = ["power_test.cpp"];
    static_libs = ["libpower"];
    shared_libs = ["android.system.suspend@1.0"];
    test_suites = ["device-tests"];
};

libhardware_legacy = cc_library_shared {
    name = "libhardware_legacy";
    defaults = ["libpower_defaults"];
    vendor_available = true;
    vndk = {
        enabled = true;
    };

    shared_libs = [
        "android.system.suspend@1.0"
        "libdl"
    ];

    header_libs = [
        "libhardware_legacy_headers"
    ];
    export_header_lib_headers = ["libhardware_legacy_headers"];

    export_include_dirs = ["include"];

    cflags = [
        "-DQEMU_HARDWARE"
        "-Wall"
        "-Werror"
    ];

    srcs = [
        "power.cpp"
        "uevent.c"
    ];
};

in { inherit libhardware_legacy libhardware_legacy_headers libpower libpower_defaults libpower_test; }
