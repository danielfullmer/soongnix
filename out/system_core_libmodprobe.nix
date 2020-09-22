{ cc_library_static, cc_test }:
let

libmodprobe = cc_library_static {
    name = "libmodprobe";
    cflags = [
        "-Werror"
    ];
    vendor_available = true;
    recovery_available = true;
    srcs = [
        "libmodprobe.cpp"
        "libmodprobe_ext.cpp"
    ];
    shared_libs = [
        "libbase"
    ];
    export_include_dirs = ["include/"];
};

libmodprobe_tests = cc_test {
    name = "libmodprobe_tests";
    cflags = ["-Werror"];
    shared_libs = [
        "libbase"
    ];
    local_include_dirs = ["include/"];
    srcs = [
        "libmodprobe_test.cpp"
        "libmodprobe.cpp"
        "libmodprobe_ext_test.cpp"
    ];
    test_suites = ["device-tests"];
};

in { inherit libmodprobe libmodprobe_tests; }
