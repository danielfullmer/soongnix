{ hidl_interface }:
let

#  This file is autogenerated by hidl-gen -Landroidbp.

"android.hardware.media.c2@1.1" = hidl_interface {
    name = "android.hardware.media.c2@1.1";
    root = "android.hardware";
    vndk = {
        enabled = true;
    };
    srcs = [
        "IComponent.hal"
        "IComponentStore.hal"
    ];
    interfaces = [
        "android.hardware.graphics.bufferqueue@1.0"
        "android.hardware.graphics.bufferqueue@2.0"
        "android.hardware.graphics.common@1.0"
        "android.hardware.graphics.common@1.1"
        "android.hardware.graphics.common@1.2"
        "android.hardware.media.bufferpool@2.0"
        "android.hardware.media.c2@1.0"
        "android.hardware.media.omx@1.0"
        "android.hardware.media@1.0"
        "android.hidl.base@1.0"
        "android.hidl.safe_union@1.0"
    ];
    gen_java = false;
};

in { inherit "android.hardware.media.c2@1.1"; }
