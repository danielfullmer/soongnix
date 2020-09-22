{ cc_test }:
let

#  Build the unit tests for installd
installd_utils_test = cc_test {
    name = "installd_utils_test";
    test_suites = ["device-tests"];
    clang = true;
    srcs = ["installd_utils_test.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = [
        "libbase"
        "libutils"
        "libcutils"
    ];
    static_libs = [
        "libdiskusage"
        "libinstalld"
        "liblog"
    ];
    test_config = "installd_utils_test.xml";
};

installd_cache_test = cc_test {
    name = "installd_cache_test";
    test_suites = ["device-tests"];
    clang = true;
    srcs = ["installd_cache_test.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = [
        "libbase"
        "libbinder"
        "libcrypto"
        "libcutils"
        "libprocessgroup"
        "libselinux"
        "libutils"
        "server_configurable_flags"
    ];
    static_libs = [
        "libdiskusage"
        "libinstalld"
        "liblog"
        "liblogwrap"
    ];
    test_config = "installd_cache_test.xml";
};

installd_service_test = cc_test {
    name = "installd_service_test";
    test_suites = ["device-tests"];
    clang = true;
    srcs = ["installd_service_test.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = [
        "libbase"
        "libbinder"
        "libcrypto"
        "libcutils"
        "libprocessgroup"
        "libselinux"
        "libutils"
        "server_configurable_flags"
    ];
    static_libs = [
        "libdiskusage"
        "libinstalld"
        "liblog"
        "liblogwrap"
    ];
    test_config = "installd_service_test.xml";
};

installd_dexopt_test = cc_test {
    name = "installd_dexopt_test";
    test_suites = ["device-tests"];
    clang = true;
    srcs = ["installd_dexopt_test.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = [
        "libbase"
        "libbinder"
        "libcrypto"
        "libcutils"
        "libprocessgroup"
        "libselinux"
        "libutils"
        "server_configurable_flags"
    ];
    static_libs = [
        "libdiskusage"
        "libinstalld"
        "liblog"
        "liblogwrap"
        "libziparchive"
        "libz"
    ];
    test_config = "installd_dexopt_test.xml";
};

installd_otapreopt_test = cc_test {
    name = "installd_otapreopt_test";
    test_suites = ["device-tests"];
    clang = true;
    srcs = ["installd_otapreopt_test.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = [
        "libbase"
        "libcutils"
        "libutils"
        "server_configurable_flags"
    ];
    static_libs = [
        "liblog"
        "libotapreoptparameters"
    ];
};

in { inherit installd_cache_test installd_dexopt_test installd_otapreopt_test installd_service_test installd_utils_test; }
