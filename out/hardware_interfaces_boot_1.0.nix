{ hidl_interface }:
let

#  This file is autogenerated by hidl-gen -Landroidbp.

"android.hardware.boot@1.0" = hidl_interface {
    name = "android.hardware.boot@1.0";
    root = "android.hardware";
    vndk = {
        enabled = true;
    };
    srcs = [
        "types.hal"
        "IBootControl.hal"
    ];
    interfaces = [
        "android.hidl.base@1.0"
    ];
    gen_java = true;
};

in { inherit "android.hardware.boot@1.0"; }
