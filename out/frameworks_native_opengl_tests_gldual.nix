{ android_app, cc_library_shared }:
let

# ########################################################################
#  OpenGL ES JNI sample
#  This makefile builds both an activity and a shared library.
# ########################################################################
#  Build activity

GLDual = android_app {
    name = "GLDual";
    srcs = [
        "src/com/android/gldual/GLDualActivity.java"
        "src/com/android/gldual/GLDualGL2View.java"
        "src/com/android/gldual/GLDualLib.java"
        "src/com/android/gldual/TriangleRenderer.java"
    ];
    sdk_version = "current";
    jni_libs = ["libgldualjni"];
};

# ########################################################################
#  Build JNI Shared Library
# ########################################################################
libgldualjni = cc_library_shared {
    name = "libgldualjni";
    cflags = [
        "-Werror"
        "-Wno-error=unused-parameter"
    ];
    srcs = ["jni/gl_code.cpp"];
    shared_libs = [
        "liblog"
        "libEGL"
        "libGLESv2"
    ];
    sdk_version = "current";
};

in { inherit GLDual libgldualjni; }
