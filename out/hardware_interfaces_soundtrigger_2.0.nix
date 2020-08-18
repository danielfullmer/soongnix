{ hidl_interface }:
let

#  This file is autogenerated by hidl-gen -Landroidbp.

"android.hardware.soundtrigger@2.0" = hidl_interface {
    name = "android.hardware.soundtrigger@2.0";
    root = "android.hardware";
    vndk = {
        enabled = true;
    };
    srcs = [
        "types.hal"
        "ISoundTriggerHw.hal"
        "ISoundTriggerHwCallback.hal"
    ];
    interfaces = [
        "android.hardware.audio.common@2.0"
        "android.hidl.base@1.0"
    ];
    gen_java = false;
};

in { inherit "android.hardware.soundtrigger@2.0"; }
