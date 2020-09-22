{ hidl_interface }:
let

#  This file is autogenerated by hidl-gen -Landroidbp.

"android.hardware.audio@6.0" = hidl_interface {
    name = "android.hardware.audio@6.0";
    root = "android.hardware";
    vndk = {
        enabled = true;
    };
    srcs = [
        "types.hal"
        "IDevice.hal"
        "IDevicesFactory.hal"
        "IPrimaryDevice.hal"
        "IStream.hal"
        "IStreamIn.hal"
        "IStreamOut.hal"
        "IStreamOutCallback.hal"
        "IStreamOutEventCallback.hal"
    ];
    interfaces = [
        "android.hardware.audio.common@6.0"
        "android.hardware.audio.effect@6.0"
        "android.hidl.base@1.0"
        "android.hidl.safe_union@1.0"
    ];
    gen_java = false;
    gen_java_constants = true;
};

in { inherit "android.hardware.audio@6.0"; }
