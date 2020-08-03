{ cc_binary }:
let

"android.hardware.media.c2@1.0-service" = cc_binary {
    name = "android.hardware.media.c2@1.0-service";
    defaults = ["hidl_defaults"];
    soc_specific = true;
    relative_install_path = "hw";
    srcs = [
        "vendor.cpp"
    ];

    init_rc = ["android.hardware.media.c2@1.0-service.rc"];

    shared_libs = [
        "android.hardware.media.c2@1.0"
        "android.hardware.media.omx@1.0"
        "libavservices_minijail_vendor"
        "libbinder"
        "libcodec2_hidl@1.0"
        "libcodec2_vndk"
        "libhidlbase"
        "libhidltransport"
        "libhwbinder"
        "liblog"
        "libstagefright_omx"
        "libstagefright_xmlparser"
        "libutils"
    ];

    arch = {
        arm = {
            required = ["codec2.vendor.base.policy"];
        };
        x86 = {
            required = ["codec2.vendor.base.policy"];
        };
    };

    compile_multilib = "32";
};

in { inherit "android.hardware.media.c2@1.0-service"; }
