{ cc_binary }:
let

"android.hardware.media.c2@1.0-service-v4l2" = cc_binary {
    name = "android.hardware.media.c2@1.0-service-v4l2";

    defaults = [
        "hidl_defaults"
        "libcodec2-hidl-defaults"
    ];
    vendor = true;
    relative_install_path = "hw";

    srcs = [
        "service.cpp"
    ];

    init_rc = ["android.hardware.media.c2@1.0-service-v4l2.rc"];

    shared_libs = [
        "libv4l2_codec2_store"
        "libavservices_minijail_vendor"
        "libchrome"
        "libcutils"
        "libhidlbase"
        "liblog"
        "libutils"
    ];

    required = ["android.hardware.media.c2@1.1-default-seccomp_policy"];
    compile_multilib = "32";
};

in { inherit "android.hardware.media.c2@1.0-service-v4l2"; }
