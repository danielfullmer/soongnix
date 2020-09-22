{ cc_test_host }:
let

fuzzy_fastboot = cc_test_host {
    name = "fuzzy_fastboot";
    compile_multilib = "first";

    srcs = [
        "main.cpp"
        "extensions.cpp"
        "transport_sniffer.cpp"
        "fixtures.cpp"
        "test_utils.cpp"
    ];

    static_libs = [
        "libfastboot2"
        "libziparchive"
        "libsparse"
        "libutils"
        "liblog"
        "libz"
        "libdiagnose_usb"
        "libbase"
        "libcutils"
        "libgtest"
        "libgtest_main"
        "libbase"
        "libadb_host"
        "libtinyxml2"
        "libsparse"
        "liblp"
        "libcrypto"
        "libext4_utils"
    ];

    stl = "libc++_static";

    #  Static libs (libfastboot2) shared library dependencies are not transitively included
    #  This is needed to avoid link time errors when building for mac
    target = {
        darwin = {
            host_ldlibs = [
                "-framework CoreFoundation"
                "-framework IOKit"
            ];
        };
    };

    #  Disable auto-generation of test config as this binary itself is not a test in the test suites,
    #  rather it is used by other tests.
    auto_gen_config = false;
    test_suites = [
        "general-tests"
        "vts"
    ];
};

in { inherit fuzzy_fastboot; }
