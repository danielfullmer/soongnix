{ cc_library_shared }:
let

libjni_terminal = cc_library_shared {
    name = "libjni_terminal";

    srcs = [
        "jni_init.cpp"
        "com_android_terminal_Terminal.cpp"
    ];

    shared_libs = [
        "libandroidfw"
        "libandroid_runtime"
        "liblog"
        "libnativehelper"
        "libutils"
    ];

    static_libs = ["libvterm"];

    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
    ];
};

in { inherit libjni_terminal; }
