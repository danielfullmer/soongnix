{ hidl_interface }:
let

#  This file is autogenerated by hidl-gen -Landroidbp.

"android.hardware.audio.common@4.0" = hidl_interface {
    name = "android.hardware.audio.common@4.0";
    root = "android.hardware";
    #  TODO(b/153609531): remove when no longer needed.
    native_bridge_supported = true;
    vndk = {
        enabled = true;
    };
    srcs = [
        "types.hal"
    ];
    gen_java = true;
    gen_java_constants = true;
};

in { inherit "android.hardware.audio.common@4.0"; }
