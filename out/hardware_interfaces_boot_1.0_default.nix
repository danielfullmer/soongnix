{ cc_binary, cc_library_shared }:
let

"android.hardware.boot@1.0-impl" = cc_library_shared {
    name = "android.hardware.boot@1.0-impl";
    defaults = ["hidl_defaults"];
    relative_install_path = "hw";
    vendor = true;
    recovery_available = true;
    srcs = ["BootControl.cpp"];

    shared_libs = [
        "liblog"
        "libhidlbase"
        "libhardware"
        "libutils"
        "android.hardware.boot@1.0"
    ];

};

"android.hardware.boot@1.0-service" = cc_binary {
    name = "android.hardware.boot@1.0-service";
    defaults = ["hidl_defaults"];
    relative_install_path = "hw";
    vendor = true;
    init_rc = ["android.hardware.boot@1.0-service.rc"];
    srcs = ["service.cpp"];

    shared_libs = [
        "liblog"
        "libhardware"
        "libhidlbase"
        "libutils"
        "android.hardware.boot@1.0"
    ];

};

in { inherit "android.hardware.boot@1.0-impl" "android.hardware.boot@1.0-service"; }
