{ hidl_interface }:
let

#  This file is autogenerated by hidl-gen -Landroidbp.

"android.hidl.token@1.0" = hidl_interface {
    name = "android.hidl.token@1.0";
    root = "android.hidl";
    vndk = {
        enabled = true;
    };
    srcs = [
        "ITokenManager.hal"
    ];
    interfaces = [
        "android.hidl.base@1.0"
    ];
    gen_java = true;
};

in { inherit "android.hidl.token@1.0"; }
