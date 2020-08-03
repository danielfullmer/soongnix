{ hidl_package_root }:
let

"hidl.tests" = hidl_package_root {
    name = "hidl.tests";
};

in { inherit "hidl.tests"; }
