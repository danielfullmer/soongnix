{ hidl_interface }:
let

#  This file is autogenerated by hidl-gen -Landroidbp.

"android.hardware.tests.safeunion@1.0" = hidl_interface {
    name = "android.hardware.tests.safeunion@1.0";
    root = "android.hardware";
    srcs = [
        "IOtherInterface.hal"
        "ISafeUnion.hal"
    ];
    interfaces = [
        "android.hidl.base@1.0"
        "android.hidl.safe_union@1.0"
    ];
    gen_java = true;
};

in { inherit "android.hardware.tests.safeunion@1.0"; }
