{ hidl_interface }:
let

#  This file is autogenerated by hidl-gen -Landroidbp.

"android.hardware.wifi.offload@1.0" = hidl_interface {
    name = "android.hardware.wifi.offload@1.0";
    root = "android.hardware";
    vndk = {
        enabled = true;
    };
    srcs = [
        "types.hal"
        "IOffload.hal"
        "IOffloadCallback.hal"
    ];
    interfaces = [
        "android.hidl.base@1.0"
    ];
    gen_java = false;
};

in { inherit "android.hardware.wifi.offload@1.0"; }