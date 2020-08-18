{ hidl_interface }:
let

#  This file is autogenerated by hidl-gen -Landroidbp.

"android.hardware.drm@1.0" = hidl_interface {
    name = "android.hardware.drm@1.0";
    root = "android.hardware";
    vndk = {
        enabled = true;
    };
    srcs = [
        "types.hal"
        "ICryptoFactory.hal"
        "ICryptoPlugin.hal"
        "IDrmFactory.hal"
        "IDrmPlugin.hal"
        "IDrmPluginListener.hal"
    ];
    interfaces = [
        "android.hidl.base@1.0"
    ];
    gen_java = false;
};

in { inherit "android.hardware.drm@1.0"; }
