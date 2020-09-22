{ hidl_interface }:
let

#  This file is autogenerated by hidl-gen -Landroidbp.

"android.hardware.wifi@1.4" = hidl_interface {
    name = "android.hardware.wifi@1.4";
    root = "android.hardware";
    vndk = {
        enabled = true;
    };
    srcs = [
        "types.hal"
        "IWifi.hal"
        "IWifiApIface.hal"
        "IWifiChip.hal"
        "IWifiChipEventCallback.hal"
        "IWifiNanIface.hal"
        "IWifiRttController.hal"
        "IWifiRttControllerEventCallback.hal"
    ];
    interfaces = [
        "android.hardware.wifi@1.0"
        "android.hardware.wifi@1.1"
        "android.hardware.wifi@1.2"
        "android.hardware.wifi@1.3"
        "android.hidl.base@1.0"
    ];
    gen_java = true;
};

in { inherit "android.hardware.wifi@1.4"; }