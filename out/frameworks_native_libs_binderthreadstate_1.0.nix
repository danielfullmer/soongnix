{ hidl_interface }:
let

#  This file is autogenerated by hidl-gen -Landroidbp.

"binderthreadstateutilstest@1.0" = hidl_interface {
    name = "binderthreadstateutilstest@1.0";
    root = "binderthreadstateutilstest";
    system_ext_specific = true;
    srcs = [
        "IHidlStuff.hal"
    ];
    interfaces = [
        "android.hidl.base@1.0"
    ];
    gen_java = true;
};

in { inherit "binderthreadstateutilstest@1.0"; }