{ hidl_interface }:
let

#  This file is autogenerated by hidl-gen -Landroidbp.

"android.hardware.audio.common@5.0" = hidl_interface {
    name = "android.hardware.audio.common@5.0";
    root = "android.hardware";
    vndk = {
        enabled = true;
    };
    srcs = [
        "types.hal"
    ];
    interfaces = [
        "android.hidl.safe_union@1.0"
    ];
    gen_java = false;
    gen_java_constants = true;
};

in { inherit "android.hardware.audio.common@5.0"; }
