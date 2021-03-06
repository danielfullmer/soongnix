{ cc_binary, cc_library_shared }:
let

"android.hardware.tv.input@1.0-impl" = cc_library_shared {
    name = "android.hardware.tv.input@1.0-impl";
    defaults = ["hidl_defaults"];
    vendor = true;
    relative_install_path = "hw";
    srcs = ["TvInput.cpp"];

    shared_libs = [
        "libbase"
        "liblog"
        "libhardware"
        "libhidlbase"
        "libhidltransport"
        "libutils"
        "android.hardware.audio.common@2.0"
        "android.hardware.tv.input@1.0"
    ];

};

"android.hardware.tv.input@1.0-service" = cc_binary {
    name = "android.hardware.tv.input@1.0-service";
    defaults = ["hidl_defaults"];
    relative_install_path = "hw";
    vendor = true;
    init_rc = ["android.hardware.tv.input@1.0-service.rc"];
    srcs = ["service.cpp"];

    shared_libs = [
        "liblog"
        "libcutils"
        "libdl"
        "libbase"
        "libutils"
        "libhardware_legacy"
        "libhardware"
        "libhidlbase"
        "libhidltransport"
        "android.hardware.audio.common@2.0"
        "android.hardware.tv.input@1.0"
    ];

};

in { inherit "android.hardware.tv.input@1.0-impl" "android.hardware.tv.input@1.0-service"; }
