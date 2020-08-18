{ hidl_interface }:
let

#  This file is autogenerated by hidl-gen -Landroidbp.

"android.hardware.wifi.supplicant@1.2" = hidl_interface {
    name = "android.hardware.wifi.supplicant@1.2";
    root = "android.hardware";
    vndk = {
        enabled = true;
    };
    srcs = [
        "types.hal"
        "ISupplicant.hal"
        "ISupplicantP2pIface.hal"
        "ISupplicantStaIface.hal"
        "ISupplicantStaIfaceCallback.hal"
        "ISupplicantStaNetwork.hal"
    ];
    interfaces = [
        "android.hardware.wifi.supplicant@1.0"
        "android.hardware.wifi.supplicant@1.1"
        "android.hidl.base@1.0"
    ];
    gen_java = true;
};

in { inherit "android.hardware.wifi.supplicant@1.2"; }
