{ cc_test }:
let

EGL_test = cc_test {

    name = "EGL_test";

    srcs = [
        "egl_cache_test.cpp"
        "EGL_test.cpp"
    ];

    cflags = [
        "-Wall"
        "-Werror"
    ];

    shared_libs = [
        "android.hardware.configstore@1.0"
        "android.hardware.configstore-utils"
        "libEGL"
        "libbase"
        "libcutils"
        "libbinder"
        "libgui"
        "libhidlbase"
        "liblog"
        "libutils"
        "libnativewindow"
        "libSurfaceFlingerProp"
    ];

    include_dirs = [
        "frameworks/native/opengl/libs"
        "frameworks/native/opengl/libs/EGL"
    ];

    header_libs = [
        "bionic_libc_platform_headers"
        "libsurfaceflinger_headers"
    ];
};

in { inherit EGL_test; }
