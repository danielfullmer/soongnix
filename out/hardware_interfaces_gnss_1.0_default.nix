{ cc_binary, cc_library_shared }:
let

"android.hardware.gnss@1.0-impl" = cc_library_shared {
    name = "android.hardware.gnss@1.0-impl";
    defaults = ["hidl_defaults"];
    vendor = true;
    relative_install_path = "hw";
    srcs = [
        "ThreadCreationWrapper.cpp"
        "AGnss.cpp"
        "AGnssRil.cpp"
        "Gnss.cpp"
        "GnssBatching.cpp"
        "GnssDebug.cpp"
        "GnssGeofencing.cpp"
        "GnssMeasurement.cpp"
        "GnssNavigationMessage.cpp"
        "GnssNi.cpp"
        "GnssXtra.cpp"
        "GnssConfiguration.cpp"
        "GnssUtils.cpp"
    ];

    shared_libs = [
        "liblog"
        "libhidlbase"
        "libhidltransport"
        "libutils"
        "android.hardware.gnss@1.0"
        "libhardware"
    ];

};

"android.hardware.gnss@1.0-service" = cc_binary {
    relative_install_path = "hw";
    vendor = true;
    name = "android.hardware.gnss@1.0-service";
    defaults = ["hidl_defaults"];
    init_rc = ["android.hardware.gnss@1.0-service.rc"];
    srcs = ["service.cpp"];

    shared_libs = [
        "liblog"
        "libcutils"
        "libdl"
        "libbase"
        "libutils"
        "libhardware"
        "libbinder"
        "libhidlbase"
        "libhidltransport"
        "android.hardware.gnss@1.0"
    ];

};

in { inherit "android.hardware.gnss@1.0-impl" "android.hardware.gnss@1.0-service"; }
