{ hidl_interface }:
let

#  This file is autogenerated by hidl-gen -Landroidbp.

"android.hardware.configstore@1.1" = hidl_interface {
    name = "android.hardware.configstore@1.1";
    root = "android.hardware";
    vndk = {
        enabled = true;
    };
    srcs = [
        "types.hal"
        "ISurfaceFlingerConfigs.hal"
    ];
    interfaces = [
        "android.hardware.configstore@1.0"
        "android.hidl.base@1.0"
    ];
    gen_java = true;
};

in { inherit "android.hardware.configstore@1.1"; }
