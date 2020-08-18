{ cc_binary, cc_library_shared }:
let

"android.hardware.gatekeeper@1.0-impl" = cc_library_shared {
    name = "android.hardware.gatekeeper@1.0-impl";
    defaults = ["hidl_defaults"];
    relative_install_path = "hw";
    vendor = true;

    srcs = ["Gatekeeper.cpp"];

    shared_libs = [
        "android.hardware.gatekeeper@1.0"
        "libhardware"
        "libhidlbase"
        "libhidltransport"
        "libutils"
        "liblog"
    ];

};

"android.hardware.gatekeeper@1.0-service" = cc_binary {
    name = "android.hardware.gatekeeper@1.0-service";
    defaults = ["hidl_defaults"];
    relative_install_path = "hw";
    vendor = true;
    init_rc = ["android.hardware.gatekeeper@1.0-service.rc"];

    srcs = ["service.cpp"];

    shared_libs = [
        "android.hardware.gatekeeper@1.0"
        "libhardware"
        "libhidlbase"
        "libhidltransport"
        "libutils"
        "liblog"
    ];

};

in { inherit "android.hardware.gatekeeper@1.0-impl" "android.hardware.gatekeeper@1.0-service"; }
