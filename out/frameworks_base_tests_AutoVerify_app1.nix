{ android_app }:
let

AutoVerifyTest = android_app {
    name = "AutoVerifyTest";
    srcs = ["src/com/android/test/autoverify/MainActivity.java"];
    resource_dirs = ["res"];
    platform_apis = true;
    min_sdk_version = "26";
    target_sdk_version = "26";
    optimize = {
        enabled = false;
    };
};

in { inherit AutoVerifyTest; }
