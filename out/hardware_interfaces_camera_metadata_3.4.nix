{ hidl_interface }:
let

#  This file is autogenerated by hidl-gen -Landroidbp.

"android.hardware.camera.metadata@3.4" = hidl_interface {
    name = "android.hardware.camera.metadata@3.4";
    root = "android.hardware";
    vndk = {
        enabled = true;
    };
    srcs = [
        "types.hal"
    ];
    interfaces = [
        "android.hardware.camera.metadata@3.2"
        "android.hardware.camera.metadata@3.3"
    ];
    gen_java = true;
};

in { inherit "android.hardware.camera.metadata@3.4"; }
