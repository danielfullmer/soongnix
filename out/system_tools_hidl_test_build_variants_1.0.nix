{ hidl_interface }:
let

"hidl_test_system_ext@1.0" = hidl_interface {
    name = "hidl_test_system_ext@1.0";
    root = "hidl_test_system_ext";
    system_ext_specific = true;
    srcs = ["IFoo.hal"];
    interfaces = ["android.hidl.base@1.0"];
};

in { inherit "hidl_test_system_ext@1.0"; }
