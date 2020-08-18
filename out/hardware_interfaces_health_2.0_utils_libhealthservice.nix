{ cc_library_static }:
let

#  Reasonable defaults for android.hardware.health@2.0-service.<device>.
#  Vendor service can customize by implementing functions defined in
#  libhealthd and libhealthstoragedefault.

libhealthservice = cc_library_static {
    name = "libhealthservice";
    vendor_available = true;
    srcs = ["HealthServiceCommon.cpp"];

    export_include_dirs = ["include"];

    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = [
        "android.hardware.health@2.0"
    ];
    static_libs = [
        "android.hardware.health@2.0-impl"
        "android.hardware.health@1.0-convert"
    ];
    export_static_lib_headers = [
        "android.hardware.health@1.0-convert"
    ];
    header_libs = ["libhealthd_headers"];
    export_header_lib_headers = ["libhealthd_headers"];
};

in { inherit libhealthservice; }
