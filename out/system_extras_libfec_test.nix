{ cc_defaults, cc_test_host }:
let

fec_test_defaults = cc_defaults {
    name = "fec_test_defaults";

    sanitize = {
        misc_undefined = ["integer"];
    };
    cflags = [
        "-Wall"
        "-Werror"
        "-D_GNU_SOURCE"
    ];
    target = {
        darwin = {
            enabled = false;
        };
    };
};

fec_test_read = cc_test_host {
    name = "fec_test_read";
    defaults = ["fec_test_defaults"];
    gtest = false;
    srcs = ["test_read.cpp"];
    static_libs = [
        "libfec"
        "libfec_rs"
        "libavb"
        "libcrypto_utils"
        "libcrypto"
        "libext4_utils"
        "libsquashfs_utils"
        "libbase"
    ];
};

fec_test_rs = cc_test_host {
    name = "fec_test_rs";
    defaults = ["fec_test_defaults"];
    gtest = false;
    srcs = ["test_rs.c"];
    static_libs = ["libfec_rs"];
};

fec_unittest = cc_test_host {
    name = "fec_unittest";
    defaults = ["fec_test_defaults"];
    srcs = ["fec_unittest.cpp"];

    gtest = true;
    required = [
        "avbtool"
        "fec"
    ];
    static_libs = [
        "libverity_tree"
        "libfec"
        "libfec_rs"
        "libavb"
        "libcrypto_utils"
        "libext4_utils"
        "libsquashfs_utils"
        "libgtest_prod"
        "libcrypto"
        "libcutils"
        "liblog"
        "libbase"
    ];
};

in { inherit fec_test_defaults fec_test_read fec_test_rs fec_unittest; }
