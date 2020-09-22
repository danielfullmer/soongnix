{ cc_binary }:
let

"android.hardware.dumpstate@1.1-service.example" = cc_binary {
    name = "android.hardware.dumpstate@1.1-service.example";
    vendor = true;
    relative_install_path = "hw";
    defaults = ["hidl_defaults"];
    init_rc = [
        "android.hardware.dumpstate@1.1-service.example.rc"
    ];
    vintf_fragments = [
        "android.hardware.dumpstate@1.1-service.example.xml"
    ];
    srcs = ["main.cpp"];
    shared_libs = [
        "android.hardware.dumpstate@1.0"
        "android.hardware.dumpstate@1.1"
        "libbase"
        "libcutils"
        "libdumpstateutil"
        "libhidlbase"
        "liblog"
        "libutils"
    ];
    cflags = [
        "-DLOG_TAG=\"android.hardware.dumpstate@1.1-service.example\""
    ];
};

in { inherit "android.hardware.dumpstate@1.1-service.example"; }
