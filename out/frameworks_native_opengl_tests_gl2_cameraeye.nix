{ android_app }:
let

GL2CameraEye = android_app {
    name = "GL2CameraEye";
    #  Only compile source java files in this apk.
    srcs = ["src/**/*.java"];
    sdk_version = "current";
};

in { inherit GL2CameraEye; }
