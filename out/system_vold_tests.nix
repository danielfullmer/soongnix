{ cc_test }:
let

vold_tests = cc_test {
    name = "vold_tests";
    defaults = [
        "vold_default_flags"
        "vold_default_libs"
    ];

    srcs = [
        "Utils_test.cpp"
        "VoldNativeServiceValidation_test.cpp"
        "cryptfs_test.cpp"
    ];
    static_libs = ["libvold"];
    shared_libs = ["libbinder"];
};

in { inherit vold_tests; }
