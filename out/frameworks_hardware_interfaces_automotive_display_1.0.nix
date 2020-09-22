{ hidl_interface }:
let

#  This file is autogenerated by hidl-gen -Landroidbp.

"android.frameworks.automotive.display@1.0" = hidl_interface {
    name = "android.frameworks.automotive.display@1.0";
    root = "android.frameworks";
    vndk = {
        enabled = true;
    };
    srcs = [
        "types.hal"
        "IAutomotiveDisplayProxyService.hal"
    ];
    interfaces = [
        "android.hardware.graphics.bufferqueue@2.0"
        "android.hardware.graphics.common@1.0"
        "android.hardware.graphics.common@1.1"
        "android.hardware.graphics.common@1.2"
        "android.hidl.base@1.0"
    ];
    gen_java = true;
};

in { inherit "android.frameworks.automotive.display@1.0"; }
