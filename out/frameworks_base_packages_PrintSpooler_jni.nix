{ cc_library_shared }:
let

libprintspooler_jni = cc_library_shared {
    name = "libprintspooler_jni";

    srcs = ["com_android_printspooler_util_BitmapSerializeUtils.cpp"];

    shared_libs = [
        "libnativehelper"
        "libjnigraphics"
        "liblog"
    ];

    cflags = [
        "-Wall"
        "-Werror"
        "-Wunused"
        "-Wunreachable-code"
    ];
};

in { inherit libprintspooler_jni; }
