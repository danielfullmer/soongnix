{ android_app }:
let

SecureElement = android_app {
    name = "SecureElement";
    srcs = ["src/**/*.java"];
    platform_apis = true;
    certificate = "platform";
    static_libs = [
        "android.hardware.secure_element-V1.0-java"
        "android.hardware.secure_element-V1.1-java"
    ];
    optimize = {
        enabled = false;
    };
};

in { inherit SecureElement; }
