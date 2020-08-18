{ hidl_interface }:
let

#  This file is autogenerated by hidl-gen -Landroidbp.

"android.hardware.health@2.0" = hidl_interface {
    name = "android.hardware.health@2.0";
    root = "android.hardware";
    vndk = {
        enabled = true;
    };
    srcs = [
        "types.hal"
        "IHealth.hal"
        "IHealthInfoCallback.hal"
    ];
    interfaces = [
        "android.hardware.health@1.0"
        "android.hidl.base@1.0"
    ];
    gen_java = true;
};

in { inherit "android.hardware.health@2.0"; }
