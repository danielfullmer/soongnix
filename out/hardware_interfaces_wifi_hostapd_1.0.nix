{ hidl_interface }:
let

#  This file is autogenerated by hidl-gen -Landroidbp.

"android.hardware.wifi.hostapd@1.0" = hidl_interface {
    name = "android.hardware.wifi.hostapd@1.0";
    root = "android.hardware";
    vndk = {
        enabled = true;
    };
    srcs = [
        "types.hal"
        "IHostapd.hal"
    ];
    interfaces = [
        "android.hardware.wifi.supplicant@1.0"
        "android.hidl.base@1.0"
    ];
    gen_java = true;
};

in { inherit "android.hardware.wifi.hostapd@1.0"; }
