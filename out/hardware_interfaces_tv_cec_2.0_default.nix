{ cc_binary, cc_library_shared }:
let

"android.hardware.tv.cec@2.0-impl" = cc_library_shared {
    name = "android.hardware.tv.cec@2.0-impl";
    defaults = ["hidl_defaults"];
    vendor = true;
    relative_install_path = "hw";
    srcs = ["HdmiCec.cpp"];

    shared_libs = [
        "libhidlbase"
        "liblog"
        "libbase"
        "libutils"
        "libhardware"
        "android.hardware.tv.cec@2.0"
    ];

};

"android.hardware.tv.cec@2.0-service" = cc_binary {
    name = "android.hardware.tv.cec@2.0-service";
    vintf_fragments = ["android.hardware.tv.cec@2.0-service.xml"];
    defaults = ["hidl_defaults"];
    relative_install_path = "hw";
    vendor = true;
    init_rc = ["android.hardware.tv.cec@2.0-service.rc"];
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
        "android.hardware.tv.cec@2.0"
    ];

};

in { inherit "android.hardware.tv.cec@2.0-impl" "android.hardware.tv.cec@2.0-service"; }
