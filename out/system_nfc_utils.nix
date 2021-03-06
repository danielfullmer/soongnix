{ cc_defaults, cc_library_static, cc_test }:
let

nfc_utils_defaults = cc_defaults {
    name = "nfc_utils_defaults";
    include_dirs = [
        "system/nfc"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    target = {
        linux_glibc = {
            cflags = ["-D_GNU_SOURCE"];
        };
        darwin = {
            enabled = false;
        };
    };
};

libnfcutils = cc_library_static {
    name = "libnfcutils";
    defaults = ["nfc_utils_defaults"];
    export_include_dirs = ["include"];
    host_supported = true;
    srcs = [
        "config.cc"
        "ringbuffer.cc"
    ];
    shared_libs = [
        "libbase"
    ];
};

nfc_test_utils = cc_test {
    name = "nfc_test_utils";
    defaults = ["nfc_utils_defaults"];
    test_suites = ["device-tests"];
    host_supported = true;
    srcs = [
        "test/config_test.cc"
        "test/ringbuffer_test.cc"
    ];
    static_libs = [
        "libnfcutils"
        "libgmock"
    ];
    shared_libs = [
        "libbase"
    ];
};

in { inherit libnfcutils nfc_test_utils nfc_utils_defaults; }
