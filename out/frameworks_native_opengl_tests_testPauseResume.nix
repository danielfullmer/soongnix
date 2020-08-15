{ android_app }:
let

#  OpenGL ES JNI sample
TestEGL = android_app {
    name = "TestEGL";
    srcs = [
        "src/com/android/test/TestActivity.java"
        "src/com/android/test/TestView.java"
    ];
    sdk_version = "current";
};

in { inherit TestEGL; }
