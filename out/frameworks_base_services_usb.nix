{ java_library_static }:
let

"services.usb" = java_library_static {
    name = "services.usb";
    srcs = ["java/**/*.java"];

    libs = [
        "services.core"
        "android.hidl.manager-V1.0-java"
    ];

    static_libs = [
        "android.hardware.usb-V1.0-java"
        "android.hardware.usb-V1.1-java"
        "android.hardware.usb-V1.2-java"
        "android.hardware.usb.gadget-V1.0-java"
    ];
};

in { inherit "services.usb"; }
