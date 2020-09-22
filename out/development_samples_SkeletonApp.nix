{ android_app }:
let

SkeletonApp = android_app {
    name = "SkeletonApp";
    #  Only compile source java files in this apk.
    srcs = ["src/com/example/android/skeletonapp/SkeletonActivity.java"];
    sdk_version = "current";
    dex_preopt = {
        enabled = false;
    };
};

in { inherit SkeletonApp; }
