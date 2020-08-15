{ android_app, cc_library_shared }:
let

# ########################################################################
#  OpenGL ES JNI sample
#  This makefile builds both an activity and a shared library.
# ########################################################################

GL2JNI = android_app {
    name = "GL2JNI";
    srcs = [
        "src/com/android/gl2jni/GL2JNIActivity.java"
        "src/com/android/gl2jni/GL2JNILib.java"
        "src/com/android/gl2jni/GL2JNIView.java"
    ];
    sdk_version = "current";
    jni_libs = ["libgl2jni"];
};

#  Build JNI Shared Library
libgl2jni = cc_library_shared {
    name = "libgl2jni";
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

in { inherit GL2JNI libgl2jni; }
