{ android_app }:
let

# ########################################################################
#  OpenGL ES 2.0 Java sample
# ########################################################################
GL2Java = android_app {
    name = "GL2Java";
    srcs = [
        "src/com/android/gl2java/GL2JavaActivity.java"
        "src/com/android/gl2java/GL2JavaView.java"
    ];
    sdk_version = "current";
};

in { inherit GL2Java; }
