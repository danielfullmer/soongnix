{ hidl_interface }:
let

#  This file is autogenerated by hidl-gen -Landroidbp.

"android.hardware.dumpstate@1.1" = hidl_interface {
    name = "android.hardware.dumpstate@1.1";
    root = "android.hardware";
    vndk = {
        enabled = true;
    };
    srcs = [
        "types.hal"
        "IDumpstateDevice.hal"
    ];
    interfaces = [
        "android.hardware.dumpstate@1.0"
        "android.hidl.base@1.0"
    ];
    gen_java = true;
};

in { inherit "android.hardware.dumpstate@1.1"; }