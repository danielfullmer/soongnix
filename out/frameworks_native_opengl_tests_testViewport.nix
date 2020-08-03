{ android_app }:
let

# ########################################################################
#  OpenGL ES JNI sample
#  This makefile builds both an activity and a shared library.
# ########################################################################
TestViewport = android_app {
    name = "TestViewport";
    srcs = ["**/*.java"];
    sdk_version = "8";
};

in { inherit TestViewport; }
