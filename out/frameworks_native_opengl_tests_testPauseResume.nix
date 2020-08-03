{ android_app }:
let

#  OpenGL ES JNI sample
TestEGL = android_app {
    name = "TestEGL";
    srcs = ["**/*.java"];
    sdk_version = "current";
};

in { inherit TestEGL; }
