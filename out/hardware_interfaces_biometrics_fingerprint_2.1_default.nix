{ cc_binary }:
let

"android.hardware.biometrics.fingerprint@2.1-service" = cc_binary {
    name = "android.hardware.biometrics.fingerprint@2.1-service";
    defaults = ["hidl_defaults"];
    init_rc = ["android.hardware.biometrics.fingerprint@2.1-service.rc"];
    vendor = true;
    relative_install_path = "hw";
    srcs = [
        "BiometricsFingerprint.cpp"
        "service.cpp"
    ];

    shared_libs = [
        "libcutils"
        "liblog"
        "libhidlbase"
        "libhidltransport"
        "libhardware"
        "libutils"
        "android.hardware.biometrics.fingerprint@2.1"
    ];

};

in { inherit "android.hardware.biometrics.fingerprint@2.1-service"; }
