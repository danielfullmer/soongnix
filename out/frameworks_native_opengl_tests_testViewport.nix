{ android_app }:
let

# ########################################################################
#  OpenGL ES JNI sample
#  This makefile builds both an activity and a shared library.
# ########################################################################
TestViewport = android_app {
    name = "TestViewport";
    srcs = [
        "src/com/android/test/TestActivity.java"
        "src/com/android/test/TestView.java"
    ];
    sdk_version = "8";
};

in { inherit TestViewport; }
