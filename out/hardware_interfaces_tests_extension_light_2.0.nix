{ hidl_interface }:
let

#  This file is autogenerated by hidl-gen -Landroidbp.

"android.hardware.tests.extension.light@2.0" = hidl_interface {
    name = "android.hardware.tests.extension.light@2.0";
    root = "android.hardware";
    srcs = [
        "types.hal"
        "ILight.hal"
    ];
    interfaces = [
        "android.hardware.light@2.0"
        "android.hidl.base@1.0"
    ];
    gen_java = true;
};

in { inherit "android.hardware.tests.extension.light@2.0"; }
