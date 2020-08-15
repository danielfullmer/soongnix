{ android_app, cc_library_shared }:
let

# ########################################################################
#  OpenGL ES Perf App
#  This makefile builds both an activity and a shared library.
# ########################################################################
GLPerf = android_app {
    name = "GLPerf";
    srcs = [
        "src/com/android/glperf/GLPerfActivity.java"
        "src/com/android/glperf/GLPerfLib.java"
        "src/com/android/glperf/GLPerfView.java"
    ];
    jni_libs = ["libglperf"];
    #  Run on Eclair
    sdk_version = "7";
};

#  Build JNI Shared Library
libglperf = cc_library_shared {
    name = "libglperf";
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

in { inherit GLPerf libglperf; }
