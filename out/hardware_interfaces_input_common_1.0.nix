{ hidl_interface }:
let

#  This file is autogenerated by hidl-gen -Landroidbp.

"android.hardware.input.common@1.0" = hidl_interface {
    name = "android.hardware.input.common@1.0";
    root = "android.hardware";
    vndk = {
        enabled = true;
    };
    srcs = [
        "types.hal"
    ];
    gen_java = true;
};

in { inherit "android.hardware.input.common@1.0"; }
