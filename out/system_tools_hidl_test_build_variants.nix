{ hidl_package_root }:
let

hidl_test_system_ext = hidl_package_root {
    name = "hidl_test_system_ext";
};

hidl_test_product = hidl_package_root {
    name = "hidl_test_product";
};

in { inherit hidl_test_product hidl_test_system_ext; }
