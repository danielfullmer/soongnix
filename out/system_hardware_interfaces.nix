{ hidl_package_root }:
let

"android.system" = hidl_package_root {
    name = "android.system";
};

in { inherit "android.system"; }
