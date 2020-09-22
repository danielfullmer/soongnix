{ cc_binary }:
let

"android.hardware.lights-service.example" = cc_binary {
    name = "android.hardware.lights-service.example";
    relative_install_path = "hw";
    init_rc = ["lights-default.rc"];
    vintf_fragments = ["lights-default.xml"];
    vendor = true;
    shared_libs = [
        "libbase"
        "libbinder_ndk"
        "android.hardware.light-ndk_platform"
    ];
    srcs = [
        "Lights.cpp"
        "main.cpp"
    ];
};

in { inherit "android.hardware.lights-service.example"; }
