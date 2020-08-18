{ hidl_interface }:
let

#  This file is autogenerated by hidl-gen -Landroidbp.

"android.hardware.graphics.composer@2.1" = hidl_interface {
    name = "android.hardware.graphics.composer@2.1";
    root = "android.hardware";
    vndk = {
        enabled = true;
    };
    srcs = [
        "types.hal"
        "IComposer.hal"
        "IComposerCallback.hal"
        "IComposerClient.hal"
    ];
    interfaces = [
        "android.hardware.graphics.common@1.0"
        "android.hidl.base@1.0"
    ];
    gen_java = false;
};

in { inherit "android.hardware.graphics.composer@2.1"; }