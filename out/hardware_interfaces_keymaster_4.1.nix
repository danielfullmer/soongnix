{ hidl_interface }:
let

#  This file is autogenerated by hidl-gen -Landroidbp.

"android.hardware.keymaster@4.1" = hidl_interface {
    name = "android.hardware.keymaster@4.1";
    root = "android.hardware";
    vndk = {
        enabled = true;
    };
    srcs = [
        "types.hal"
        "IKeymasterDevice.hal"
    ];
    interfaces = [
        "android.hardware.keymaster@3.0"
        "android.hardware.keymaster@4.0"
        "android.hidl.base@1.0"
    ];
    gen_java = false;
};

in { inherit "android.hardware.keymaster@4.1"; }