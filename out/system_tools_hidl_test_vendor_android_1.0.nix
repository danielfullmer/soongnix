{ hidl_interface }:
let

#  This file is autogenerated by hidl-gen -Landroidbp.

"hidl.tests.vendor.android@1.0" = hidl_interface {
    name = "hidl.tests.vendor.android@1.0";
    owner = "some-owner-name";
    root = "hidl.tests";
    system_ext_specific = true;
    srcs = [
        "IVendor.hal"
    ];
    interfaces = [
        "android.hidl.base@1.0"
    ];
    gen_java = true;
};

in { inherit "hidl.tests.vendor.android@1.0"; }