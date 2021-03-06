{ android_app, cc_library_shared }:
let

# ########################################################################
#  OpenGL ES JNI sample
#  This makefile builds both an activity and a shared library.
# ########################################################################
#  Build activity

GLJNI = android_app {
    name = "GLJNI";
    srcs = [
        "src/com/android/gljni/GLJNIActivity.java"
        "src/com/android/gljni/GLJNILib.java"
        "src/com/android/gljni/GLJNIView.java"
    ];
    sdk_version = "current";
    jni_libs = ["libgljni"];
};

#  Build JNI Shared Library

libgljni = cc_library_shared {
    name = "libgljni";
    cflags = [
        "-Werror"
        "-Wno-error=unused-parameter"
    ];
    srcs = ["jni/gl_code.cpp"];
    shared_libs = [
        "liblog"
        "libEGL"
        "libGLESv1_CM"
    ];
    sdk_version = "current";
    arch = {
        arm = {
            instruction_set = "arm";
        };
    };
};

in { inherit GLJNI libgljni; }
