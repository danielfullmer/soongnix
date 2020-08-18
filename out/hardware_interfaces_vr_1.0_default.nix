{ cc_binary, cc_library_shared }:
let

"android.hardware.vr@1.0-impl" = cc_library_shared {
    name = "android.hardware.vr@1.0-impl";
    defaults = ["hidl_defaults"];
    proprietary = true;
    relative_install_path = "hw";
    srcs = ["Vr.cpp"];
    shared_libs = [
        "liblog"
        "libcutils"
        "libhardware"
        "libbase"
        "libcutils"
        "libutils"
        "libhidlbase"
        "libhidltransport"
        "android.hardware.vr@1.0"
    ];
};

"android.hardware.vr@1.0-service" = cc_binary {
    relative_install_path = "hw";
    defaults = ["hidl_defaults"];
    proprietary = true;
    name = "android.hardware.vr@1.0-service";
    init_rc = ["android.hardware.vr@1.0-service.rc"];
    srcs = ["service.cpp"];
    shared_libs = [
        "liblog"
        "libdl"
        "libutils"
        "libhardware"
        "libhidlbase"
        "libhidltransport"
        "android.hardware.vr@1.0"
    ];
};

in { inherit "android.hardware.vr@1.0-impl" "android.hardware.vr@1.0-service"; }
