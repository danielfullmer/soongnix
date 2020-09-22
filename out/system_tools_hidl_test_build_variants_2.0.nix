{ hidl_interface }:
let

"hidl_test_product@2.0" = hidl_interface {
    name = "hidl_test_product@2.0";
    product_specific = true;
    root = "hidl_test_product";
    srcs = ["IFoo.hal"];
    interfaces = ["android.hidl.base@1.0"];
};

in { inherit "hidl_test_product@2.0"; }
