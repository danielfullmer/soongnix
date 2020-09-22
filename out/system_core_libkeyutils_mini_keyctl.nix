{ cc_binary, cc_library_static }:
let

libmini_keyctl_static = cc_library_static {
    name = "libmini_keyctl_static";
    srcs = [
        "mini_keyctl_utils.cpp"
    ];
    shared_libs = [
        "libbase"
        "libkeyutils"
    ];
    cflags = [
        "-Werror"
        "-Wall"
        "-Wextra"
    ];
    export_include_dirs = ["."];
};

mini-keyctl = cc_binary {
    name = "mini-keyctl";
    srcs = [
        "mini_keyctl.cpp"
    ];
    static_libs = [
        "libmini_keyctl_static"
    ];
    shared_libs = [
        "libbase"
        "libkeyutils"
    ];
    cflags = [
        "-Werror"
        "-Wall"
        "-Wextra"
    ];
};

in { inherit libmini_keyctl_static mini-keyctl; }
