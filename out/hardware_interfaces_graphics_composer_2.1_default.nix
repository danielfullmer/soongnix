{ cc_binary, cc_library_shared }:
let

"android.hardware.graphics.composer@2.1-impl" = cc_library_shared {
    name = "android.hardware.graphics.composer@2.1-impl";
    defaults = ["hidl_defaults"];
    vendor = true;
    relative_install_path = "hw";
    srcs = ["passthrough.cpp"];
    header_libs = [
        "android.hardware.graphics.composer@2.1-passthrough"
    ];
    shared_libs = [
        "android.hardware.graphics.composer@2.1"
        "android.hardware.graphics.composer@2.1-resources"
        "libbase"
        "libcutils"
        "libfmq"
        "libhardware"
        "libhidlbase"
        "liblog"
        "libsync"
        "libutils"
        "libhwc2on1adapter"
        "libhwc2onfbadapter"
    ];
    cflags = [
        "-DLOG_TAG=\"ComposerHal\""
    ];
};

"android.hardware.graphics.composer@2.1-service" = cc_binary {
    name = "android.hardware.graphics.composer@2.1-service";
    defaults = ["hidl_defaults"];
    vendor = true;
    relative_install_path = "hw";
    srcs = ["service.cpp"];
    init_rc = ["android.hardware.graphics.composer@2.1-service.rc"];
    shared_libs = [
        "android.hardware.graphics.composer@2.1"
        "libbinder"
        "libhidlbase"
        "liblog"
        "libsync"
        "libutils"
    ];
};

in { inherit "android.hardware.graphics.composer@2.1-impl" "android.hardware.graphics.composer@2.1-service"; }
