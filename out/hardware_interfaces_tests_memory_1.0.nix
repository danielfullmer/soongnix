{ hidl_interface }:
let

#  This file is autogenerated by hidl-gen -Landroidbp.

"android.hardware.tests.memory@1.0" = hidl_interface {
    name = "android.hardware.tests.memory@1.0";
    root = "android.hardware";
    srcs = [
        "IMemoryTest.hal"
    ];
    interfaces = [
        "android.hidl.base@1.0"
        "android.hidl.memory.block@1.0"
        "android.hidl.memory.token@1.0"
    ];
    gen_java = true;
};

in { inherit "android.hardware.tests.memory@1.0"; }
