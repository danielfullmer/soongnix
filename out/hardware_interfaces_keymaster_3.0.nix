{ hidl_interface }:
let

#  This file is autogenerated by hidl-gen -Landroidbp.

"android.hardware.keymaster@3.0" = hidl_interface {
    name = "android.hardware.keymaster@3.0";
    root = "android.hardware";
    vndk = {
        enabled = true;
    };
    srcs = [
        "types.hal"
        "IKeymasterDevice.hal"
    ];
    interfaces = [
        "android.hidl.base@1.0"
    ];
    gen_java = false;
};

in { inherit "android.hardware.keymaster@3.0"; }