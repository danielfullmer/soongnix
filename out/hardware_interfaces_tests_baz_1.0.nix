{ hidl_interface }:
let

#  This file is autogenerated by hidl-gen -Landroidbp.

"android.hardware.tests.baz@1.0" = hidl_interface {
    name = "android.hardware.tests.baz@1.0";
    root = "android.hardware";
    srcs = [
        "types.hal"
        "IBase.hal"
        "IBaz.hal"
        "IBazCallback.hal"
        "IQuux.hal"
    ];
    interfaces = [
        "android.hidl.base@1.0"
    ];
    gen_java = true;
};

in { inherit "android.hardware.tests.baz@1.0"; }
