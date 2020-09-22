{ android_app }:
let

MissileLauncher = android_app {
    name = "MissileLauncher";
    srcs = ["src/com/android/missilelauncher/MissileLauncherActivity.java"];
    sdk_version = "current";
};

in { inherit MissileLauncher; }
