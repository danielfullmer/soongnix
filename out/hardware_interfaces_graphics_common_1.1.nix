{ hidl_interface }:
let

#  This file is autogenerated by hidl-gen -Landroidbp.

"android.hardware.graphics.common@1.1" = hidl_interface {
    name = "android.hardware.graphics.common@1.1";
    root = "android.hardware";
    vndk = {
        enabled = true;
        support_system_process = true;
    };
    srcs = [
        "types.hal"
    ];
    interfaces = [
        "android.hardware.graphics.common@1.0"
    ];
    gen_java = true;
    gen_java_constants = true;
};

in { inherit "android.hardware.graphics.common@1.1"; }
