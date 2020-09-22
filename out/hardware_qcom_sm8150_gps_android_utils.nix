{ cc_library_headers, cc_library_static }:
let

liblocbatterylistener = cc_library_static {

    name = "liblocbatterylistener";
    vendor = true;

    sanitize = GNSS_SANITIZE;

    cflags = GNSS_CFLAGS ++ ["-DBATTERY_LISTENER_ENABLED"];
    local_include_dirs = ["."];

    srcs = ["battery_listener.cpp"];

    shared_libs = [
        "liblog"
        "libhidlbase"
        "libcutils"
        "libutils"
        "android.hardware.health@1.0"
        "android.hardware.health@2.0"
        "android.hardware.health@2.1"
        "android.hardware.power@1.2"
        "libbase"
    ];

    static_libs = ["libhealthhalutils"];

    header_libs = [
        "libgps.utils_headers"
        "libloc_pla_headers"
    ];
};

liblocbatterylistener_headers = cc_library_headers {

    name = "liblocbatterylistener_headers";
    export_include_dirs = ["."];
};

in { inherit liblocbatterylistener liblocbatterylistener_headers; }
