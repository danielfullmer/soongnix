{ hidl_interface }:
let

#  This file is autogenerated by hidl-gen -Landroidbp.

"android.hardware.soundtrigger@2.2" = hidl_interface {
    name = "android.hardware.soundtrigger@2.2";
    root = "android.hardware";
    vndk = {
        enabled = true;
    };
    srcs = [
        "ISoundTriggerHw.hal"
    ];
    interfaces = [
        "android.hardware.audio.common@2.0"
        "android.hardware.soundtrigger@2.0"
        "android.hardware.soundtrigger@2.1"
        "android.hidl.base@1.0"
    ];
    gen_java = false;
};

in { inherit "android.hardware.soundtrigger@2.2"; }