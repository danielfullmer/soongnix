{ cc_binary }:
let

"android.hardware.dumpstate@1.0-service.example" = cc_binary {
    name = "android.hardware.dumpstate@1.0-service.example";
    init_rc = ["android.hardware.dumpstate@1.0-service.rc"];
    relative_install_path = "hw";
    vendor = true;
    srcs = [
        "DumpstateDevice.cpp"
        "service.cpp"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];

    shared_libs = [
        "android.hardware.dumpstate@1.0"
        "libbase"
        "libcutils"
        "libdumpstateutil"
        "libhidlbase"
        "liblog"
        "libutils"
    ];

};

in { inherit "android.hardware.dumpstate@1.0-service.example"; }
