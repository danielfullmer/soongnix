{ cc_defaults, cc_library, cc_library_shared, cc_library_static, cc_test }:
let

#  Build the ETC1 library
libETC1 = cc_library {
    name = "libETC1";
    srcs = ["ETC1/etc1.cpp"];
    host_supported = true;
    cflags = [
        "-Wall"
        "-Werror"
    ];

    target = {
        android = {
            static = {
                enabled = false;
            };
        };
        host = {
            shared = {
                enabled = false;
            };
        };
        windows = {
            enabled = true;
        };
    };
};

#  The headers modules are in frameworks/native/opengl/Android.bp.

gl_libs_defaults = cc_defaults {
    name = "gl_libs_defaults";
    cflags = [
        "-DGL_GLEXT_PROTOTYPES"
        "-DEGL_EGLEXT_PROTOTYPES"
        "-fvisibility=hidden"
        "-Wall"
        "-Werror"
        "-Wno-unused-variable"
    ];
    shared_libs = [
        #  ***** DO NOT ADD NEW DEPENDENCIES HERE *****
        #  In particular, DO NOT add libutils or anything "above" libcutils
        "libcutils"
        "liblog"
        "libdl"
    ];
    static_libs = [
        "libarect"
    ];
    header_libs = [
        "gl_headers"
        "libsystem_headers"
        "libhardware_headers"
        "libnativebase_headers"
    ];
    export_header_lib_headers = ["gl_headers"];

    #  we need to access the private Bionic header <bionic_tls.h>
    include_dirs = ["bionic/libc/private"];
};

# ##############################################################################
#  Build META EGL library
#
egl_libs_defaults = cc_defaults {
    name = "egl_libs_defaults";
    defaults = ["gl_libs_defaults"];
    cflags = [
        "-DLOG_TAG=\"libEGL\""
        "-Wall"
        "-Werror"
        "-Wno-error=deprecated-register"
        "-Wno-error=unknown-attributes"
        "-Wno-unused-variable"
    ];
    shared_libs = [
        #  ***** DO NOT ADD NEW DEPENDENCIES HERE *****
        #  In particular, DO NOT add libutils nor anything "above" libui
        "libgraphicsenv"
        "libnativewindow"
        "libbacktrace"
    ];
    target = {
        vendor = {
            exclude_shared_libs = ["libgraphicsenv"];
        };
    };
};

libEGL_getProcAddress = cc_library_static {
    name = "libEGL_getProcAddress";
    defaults = ["egl_libs_defaults"];
    srcs = ["EGL/getProcAddress.cpp"];
    arch = {
        arm = {
            instruction_set = "arm";
        };
    };
};

libEGL_blobCache = cc_library_static {
    name = "libEGL_blobCache";
    defaults = ["egl_libs_defaults"];
    srcs = [
        "EGL/BlobCache.cpp"
        "EGL/FileBlobCache.cpp"
    ];
    export_include_dirs = ["EGL"];
};

libEGL = cc_library_shared {
    name = "libEGL";
    defaults = ["egl_libs_defaults"];
    srcs = [
        "EGL/egl_tls.cpp"
        "EGL/egl_cache.cpp"
        "EGL/egl_display.cpp"
        "EGL/egl_object.cpp"
        "EGL/egl_layers.cpp"
        "EGL/egl.cpp"
        "EGL/eglApi.cpp"
        "EGL/egl_platform_entries.cpp"
        "EGL/Loader.cpp"
        "EGL/egl_angle_platform.cpp"
    ];
    shared_libs = [
        "libvndksupport"
        "android.hardware.configstore@1.0"
        "android.hardware.configstore-utils"
        "libbase"
        "libhidlbase"
        "libhidltransport"
        "libnativebridge_lazy"
        "libnativeloader_lazy"
        "libutils"
    ];
    static_libs = [
        "libEGL_getProcAddress"
        "libEGL_blobCache"
    ];
    ldflags = ["-Wl,--exclude-libs=ALL"];
    export_include_dirs = ["EGL/include"];
};

libEGL_test = cc_test {
    name = "libEGL_test";
    defaults = ["egl_libs_defaults"];
    srcs = [
        "EGL/BlobCache.cpp"
        "EGL/BlobCache_test.cpp"
    ];
};

gles_libs_defaults = cc_defaults {
    name = "gles_libs_defaults";
    defaults = ["gl_libs_defaults"];
    arch = {
        arm = {
            instruction_set = "arm";

            #  TODO: This is to work around b/20093774. Remove after root cause is fixed
            ldflags = ["-Wl,--hash-style,both"];
        };
    };
    shared_libs = ["libEGL"];
};

# ##############################################################################
#  Build the wrapper OpenGL ES 1.x library
#
libGLESv1_CM = cc_library_shared {
    name = "libGLESv1_CM";
    defaults = ["gles_libs_defaults"];
    srcs = ["GLES_CM/gl.cpp"];
    cflags = ["-DLOG_TAG=\"libGLESv1\""];
    version_script = "libGLESv1_CM.map.txt";
};

# ##############################################################################
#  Build the wrapper OpenGL ES 2.x library
#
libGLESv2 = cc_library_shared {
    name = "libGLESv2";
    defaults = ["gles_libs_defaults"];
    srcs = ["GLES2/gl2.cpp"];
    cflags = ["-DLOG_TAG=\"libGLESv2\""];

    #  Bug: http://b/133874658  Disable native_coverage as we investigate a
    #  crash in surfaceflinger on coverage-enabled cuttlefish builds.
    native_coverage = false;
};

# ##############################################################################
#  Build the wrapper OpenGL ES 3.x library (this is just different name for v2)
#
libGLESv3 = cc_library_shared {
    name = "libGLESv3";
    defaults = ["gles_libs_defaults"];
    srcs = ["GLES2/gl2.cpp"];
    cflags = ["-DLOG_TAG=\"libGLESv3\""];
};

in { inherit egl_libs_defaults gl_libs_defaults gles_libs_defaults libEGL libEGL_blobCache libEGL_getProcAddress libEGL_test libETC1 libGLESv1_CM libGLESv2 libGLESv3; }
