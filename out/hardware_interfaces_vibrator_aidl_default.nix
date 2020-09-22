{ cc_binary, cc_library_static }:
let

libvibratorexampleimpl = cc_library_static {
    name = "libvibratorexampleimpl";
    vendor = true;
    shared_libs = [
        "libbase"
        "libbinder_ndk"
        "android.hardware.vibrator-ndk_platform"
    ];
    export_include_dirs = ["include"];
    srcs = ["Vibrator.cpp"];
    visibility = [
        ":__subpackages__"
        "//hardware/interfaces/tests/extension/vibrator:__subpackages__"
    ];
};

"android.hardware.vibrator-service.example" = cc_binary {
    name = "android.hardware.vibrator-service.example";
    relative_install_path = "hw";
    init_rc = ["vibrator-default.rc"];
    vintf_fragments = ["vibrator-default.xml"];
    vendor = true;
    shared_libs = [
        "libbase"
        "libbinder_ndk"
        "android.hardware.vibrator-ndk_platform"
    ];
    static_libs = [
        "libvibratorexampleimpl"
    ];
    srcs = ["main.cpp"];
};

in { inherit "android.hardware.vibrator-service.example" libvibratorexampleimpl; }
