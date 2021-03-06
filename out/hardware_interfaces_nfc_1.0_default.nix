{ cc_binary, cc_library_shared }:
let

"android.hardware.nfc@1.0-impl" = cc_library_shared {
    name = "android.hardware.nfc@1.0-impl";
    defaults = ["hidl_defaults"];
    relative_install_path = "hw";
    proprietary = true;
    srcs = ["Nfc.cpp"];
    shared_libs = [
        "liblog"
        "libcutils"
        "libhardware"
        "libbase"
        "libcutils"
        "libutils"
        "libhidlbase"
        "libhidltransport"
        "android.hardware.nfc@1.0"
    ];
};

"android.hardware.nfc@1.0-service" = cc_binary {
    name = "android.hardware.nfc@1.0-service";
    defaults = ["hidl_defaults"];
    relative_install_path = "hw";
    proprietary = true;
    init_rc = ["android.hardware.nfc@1.0-service.rc"];
    srcs = ["service.cpp"];

    shared_libs = [
        "liblog"
        "libcutils"
        "libdl"
        "libbase"
        "libutils"
        "libhardware"
        "libhidlbase"
        "libhidltransport"
        "android.hardware.nfc@1.0"
    ];

};

in { inherit "android.hardware.nfc@1.0-impl" "android.hardware.nfc@1.0-service"; }
