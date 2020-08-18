{ cc_binary }:
let

"android.hardware.gnss@1.1-service" = cc_binary {
    name = "android.hardware.gnss@1.1-service";
    init_rc = ["android.hardware.gnss@1.1-service.rc"];
    relative_install_path = "hw";
    vendor = true;
    srcs = [
        "Gnss.cpp"
        "GnssDebug.cpp"
        "GnssConfiguration.cpp"
        "GnssMeasurement.cpp"
        "service.cpp"
    ];
    shared_libs = [
        "libhidlbase"
        "libhidltransport"
        "libutils"
        "liblog"
        "android.hardware.gnss@1.1"
        "android.hardware.gnss@1.0"
    ];
    static_libs = [
        "android.hardware.gnss@common-default-lib"
    ];
};

in { inherit "android.hardware.gnss@1.1-service"; }
