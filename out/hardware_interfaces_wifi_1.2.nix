{ hidl_interface }:
let

#  This file is autogenerated by hidl-gen -Landroidbp.

"android.hardware.wifi@1.2" = hidl_interface {
    name = "android.hardware.wifi@1.2";
    root = "android.hardware";
    vndk = {
        enabled = true;
    };
    srcs = [
        "types.hal"
        "IWifi.hal"
        "IWifiChip.hal"
        "IWifiChipEventCallback.hal"
        "IWifiNanIface.hal"
        "IWifiNanIfaceEventCallback.hal"
        "IWifiStaIface.hal"
    ];
    interfaces = [
        "android.hardware.wifi@1.0"
        "android.hardware.wifi@1.1"
        "android.hidl.base@1.0"
    ];
    gen_java = true;
};

in { inherit "android.hardware.wifi@1.2"; }