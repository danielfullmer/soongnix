{ hidl_package_root, soong_namespace }:
let

_missingName = soong_namespace {
};

"hardware.google" = hidl_package_root {
    name = "hardware.google";
};

in { inherit "hardware.google" _missingName; }
