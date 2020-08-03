{ cc_defaults, cc_library_shared, cc_library_static }:
let

#
#  Build the software OpenGL ES library
#

libGLES_android_defaults = cc_defaults {
    name = "libGLES_android_defaults";

    cflags = [
        "-DLOG_TAG=\"libagl\""
        "-DGL_GLEXT_PROTOTYPES"
        "-DEGL_EGLEXT_PROTOTYPES"
        "-fvisibility=hidden"
        "-Wall"
        "-Werror"
    ];

    shared_libs = [
        "libcutils"
        "libhardware"
        "libutils"
        "liblog"
        "libpixelflinger"
        "libETC1"
        "libui"
        "libnativewindow"
    ];

    #  we need to access the private Bionic header <bionic_tls.h>
    include_dirs = ["bionic/libc/private"];

    arch = {
        arm = {
            cflags = ["-fstrict-aliasing"];
        };

        mips = {
            cflags = [
                "-fstrict-aliasing"
                #  The graphics code can generate division by zero
                "-mno-check-zero-division"
            ];
        };
    };
};

libGLES_android = cc_library_shared {
    name = "libGLES_android";
    defaults = ["libGLES_android_defaults"];

    whole_static_libs = ["libGLES_android_arm"];

    srcs = [
        "egl.cpp"
        "state.cpp"
        "texture.cpp"
        "Tokenizer.cpp"
        "TokenManager.cpp"
        "TextureObjectManager.cpp"
        "BufferObjectManager.cpp"
    ];

    arch = {
        arm = {
            srcs = [
                "fixed_asm.S"
                "iterators.S"
            ];
        };

        mips = {
            rev6 = {
                srcs = ["arch-mips/fixed_asm.S"];
            };
        };
    };

    relative_install_path = "egl";
};

libGLES_android_arm = cc_library_static {
    name = "libGLES_android_arm";
    defaults = ["libGLES_android_defaults"];

    srcs = [
        "array.cpp"
        "fp.cpp"
        "light.cpp"
        "matrix.cpp"
        "mipmap.cpp"
        "primitives.cpp"
        "vertex.cpp"
    ];

    arch = {
        arm = {
            instruction_set = "arm";
        };
    };
};

in { inherit libGLES_android libGLES_android_arm libGLES_android_defaults; }
