{ hidl_package_root }:
let

"vendor.nxp.nxpnfc" = hidl_package_root {
    name = "vendor.nxp.nxpnfc";
};

in { inherit "vendor.nxp.nxpnfc"; }
