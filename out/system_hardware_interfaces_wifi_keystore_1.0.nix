{ hidl_interface }:
let

#  This file is autogenerated by hidl-gen -Landroidbp.

"android.system.wifi.keystore@1.0" = hidl_interface {
    name = "android.system.wifi.keystore@1.0";
    root = "android.system";
    vndk = {
        enabled = true;
    };
    srcs = [
        "IKeystore.hal"
    ];
    interfaces = [
        "android.hidl.base@1.0"
    ];
    gen_java = true;
};

in { inherit "android.system.wifi.keystore@1.0"; }
