{ cc_library, cc_test }:
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

in { inherit libkeyutils libkeyutils-tests; }
