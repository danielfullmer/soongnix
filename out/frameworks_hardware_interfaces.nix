{ hidl_package_root }:
let

"android.frameworks" = hidl_package_root {
    name = "android.frameworks";
};

in { inherit "android.frameworks"; }
