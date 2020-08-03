{ cc_test }:
let

vold_tests = cc_test {
    name = "vold_tests";
    defaults = [
        "vold_default_flags"
        "vold_default_libs"
    ];

    srcs = [
        "CryptfsScryptHidlizationEquivalence_test.cpp"
        "Utils_test.cpp"
        "cryptfs_test.cpp"
    ];
    static_libs = ["libvold"];
};

in { inherit vold_tests; }
