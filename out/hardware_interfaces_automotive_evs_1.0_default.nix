{ cc_binary }:
let

"android.hardware.automotive.evs@1.0-service" = cc_binary {
    name = "android.hardware.automotive.evs@1.0-service";
    defaults = ["hidl_defaults"];
    proprietary = true;
    relative_install_path = "hw";
    srcs = [
        "service.cpp"
        "EvsCamera.cpp"
        "EvsEnumerator.cpp"
        "EvsDisplay.cpp"
    ];
    init_rc = ["android.hardware.automotive.evs@1.0-service.rc"];

    shared_libs = [
        "android.hardware.automotive.evs@1.0"
        "libbase"
        "libbinder"
        "libcutils"
        "libhardware"
        "libhidlbase"
        "liblog"
        "libui"
        "libutils"
    ];

    cflags = [
        "-O0"
        "-g"
    ];

    vintf_fragments = [
        "manifest_android.hardware.automotive.evs@1.0-service.xml"
    ];
};

in { inherit "android.hardware.automotive.evs@1.0-service"; }
