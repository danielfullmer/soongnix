{ hidl_interface }:
let

#  This file is autogenerated by hidl-gen -Landroidbp.

"android.hardware.power.stats@1.0" = hidl_interface {
    name = "android.hardware.power.stats@1.0";
    root = "android.hardware";
    vndk = {
        enabled = true;
    };
    srcs = [
        "types.hal"
        "IPowerStats.hal"
    ];
    interfaces = [
        "android.hidl.base@1.0"
    ];
    gen_java = false;
};

in { inherit "android.hardware.power.stats@1.0"; }
