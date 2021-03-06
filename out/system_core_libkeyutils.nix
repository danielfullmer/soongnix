{ cc_binary, cc_library, cc_test }:
let

libkeyutils = cc_library {
    name = "libkeyutils";
    cflags = ["-Werror"];
    defaults = ["linux_bionic_supported"];
    recovery_available = true;
    export_include_dirs = ["include/"];
    local_include_dirs = ["include/"];
    srcs = ["keyutils.cpp"];
    stl = "none";
};

libkeyutils-tests = cc_test {
    name = "libkeyutils-tests";
    cflags = ["-Werror"];
    shared_libs = ["libkeyutils"];
    srcs = ["keyutils_test.cpp"];
    test_suites = ["device-tests"];
};

mini-keyctl = cc_binary {
    name = "mini-keyctl";
    srcs = [
        "mini_keyctl.cpp"
        "mini_keyctl_utils.cpp"
    ];
    shared_libs = [
        "libbase"
        "libkeyutils"
        "liblog"
    ];
    cflags = [
        "-Werror"
        "-Wall"
        "-Wextra"
        "-fexceptions"
    ];
};

in { inherit libkeyutils libkeyutils-tests mini-keyctl; }
