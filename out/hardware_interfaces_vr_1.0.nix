{ hidl_interface }:
let

#  This file is autogenerated by hidl-gen -Landroidbp.

"android.hardware.vr@1.0" = hidl_interface {
    name = "android.hardware.vr@1.0";
    root = "android.hardware";
    vndk = {
        enabled = true;
    };
    srcs = [
        "IVr.hal"
    ];
    interfaces = [
        "android.hidl.base@1.0"
    ];
    gen_java = true;
};

in { inherit "android.hardware.vr@1.0"; }