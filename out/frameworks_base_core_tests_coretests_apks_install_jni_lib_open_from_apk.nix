{ android_test_helper_app }:
let

FrameworksCoreTests_install_jni_lib_open_from_apk = android_test_helper_app {
    name = "FrameworksCoreTests_install_jni_lib_open_from_apk";
    defaults = ["FrameworksCoreTests_apks_defaults"];

    srcs = [
        "src/com/android/frameworks/coretests/JNITests.java"
        "src/com/android/frameworks/coretests/OpenFromApkActivity.java"
    ];
};

in { inherit FrameworksCoreTests_install_jni_lib_open_from_apk; }
