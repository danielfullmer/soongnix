{ cc_library_shared }:
let

libhidcommand_jni = cc_library_shared {
    name = "libhidcommand_jni";

    srcs = ["com_android_commands_hid_Device.cpp"];

    shared_libs = [
        "libandroid"
        "libbase"
        "liblog"
        "libnativehelper"
    ];

    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
};

in { inherit libhidcommand_jni; }
