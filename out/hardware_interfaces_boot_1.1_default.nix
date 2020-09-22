{ cc_binary, cc_library_shared }:
let

"android.hardware.boot@1.1-impl" = cc_library_shared {
    name = "android.hardware.boot@1.1-impl";
    stem = "android.hardware.boot@1.0-impl-1.1";
    defaults = [
        "hidl_defaults"
        "libboot_control_defaults"
    ];
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
        "android.hardware.boot@1.1"
    ];
    static_libs = [
        "libboot_control"
        "libfstab"
    ];
};

"android.hardware.boot@1.1-service" = cc_binary {
    name = "android.hardware.boot@1.1-service";
    defaults = ["hidl_defaults"];
    relative_install_path = "hw";
    vendor = true;
    init_rc = ["android.hardware.boot@1.1-service.rc"];
    srcs = ["service.cpp"];

    vintf_fragments = [
        "android.hardware.boot@1.1.xml"
    ];

    shared_libs = [
        "liblog"
        "libhardware"
        "libhidlbase"
        "libutils"
        "android.hardware.boot@1.0"
        "android.hardware.boot@1.1"
    ];

};

in { inherit "android.hardware.boot@1.1-impl" "android.hardware.boot@1.1-service"; }
