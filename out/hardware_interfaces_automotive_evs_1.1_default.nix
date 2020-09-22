{ cc_binary, prebuilt_etc }:
let

"android.hardware.automotive.evs@1.1-service" = cc_binary {
    name = "android.hardware.automotive.evs@1.1-service";
    defaults = ["hidl_defaults"];
    proprietary = true;
    relative_install_path = "hw";
    srcs = [
        "service.cpp"
        "EvsCamera.cpp"
        "EvsEnumerator.cpp"
        "EvsDisplay.cpp"
        "ConfigManager.cpp"
        "ConfigManagerUtil.cpp"
        "EvsUltrasonicsArray.cpp"
    ];
    init_rc = ["android.hardware.automotive.evs@1.1-service.rc"];

    shared_libs = [
        "android.hardware.automotive.evs@1.0"
        "android.hardware.automotive.evs@1.1"
        "android.hardware.camera.device@3.3"
        "android.hidl.allocator@1.0"
        "android.hidl.memory@1.0"
        "libbase"
        "libbinder"
        "liblog"
        "libhardware"
        "libhidlbase"
        "libhidlmemory"
        "liblog"
        "libui"
        "libutils"
        "libcamera_metadata"
        "libtinyxml2"
        "android.hidl.token@1.0-utils"
        "android.frameworks.automotive.display@1.0"
        "android.hardware.graphics.bufferqueue@1.0"
        "android.hardware.graphics.bufferqueue@2.0"
    ];

    cflags = [
        "-O0"
        "-g"
    ];

    required = [
        "evs_default_configuration.xml"
    ];

    vintf_fragments = [
        "manifest_android.hardware.automotive.evs@1.1-service.xml"
    ];
};

"evs_default_configuration.xml" = prebuilt_etc {
    name = "evs_default_configuration.xml";
    soc_specific = true;
    src = "resources/evs_default_configuration.xml";
    sub_dir = "automotive/evs";
};

in { inherit "android.hardware.automotive.evs@1.1-service" "evs_default_configuration.xml"; }
