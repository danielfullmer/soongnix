{ android_app }:
let

# ########################################################################
#  OpenGL ES 2.0 Java sample
# ########################################################################
GL2Java = android_app {
    name = "GL2Java";
    srcs = ["**/*.java"];
    sdk_version = "current";
};

in { inherit GL2Java; }
