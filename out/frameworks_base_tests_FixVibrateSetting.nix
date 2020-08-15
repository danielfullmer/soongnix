{ android_app }:
let

FixVibrateSetting = android_app {
    name = "FixVibrateSetting";
    srcs = ["src/com/android/fixvibratesetting/FixVibrateSetting.java"];
    sdk_version = "current";
    certificate = "platform";
};

in { inherit FixVibrateSetting; }
