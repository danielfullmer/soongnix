{ cc_test }:
let

#  Build the unit tests.
ResourceManagerService_test = cc_test {
    name = "ResourceManagerService_test";
    srcs = ["ResourceManagerService_test.cpp"];
    test_suites = ["device-tests"];
    shared_libs = [
        "libbinder"
        "liblog"
        "libmedia"
        "libresourcemanagerservice"
        "libutils"
    ];
    include_dirs = [
        "frameworks/av/include"
        "frameworks/av/services/mediaresourcemanager"
    ];
    cflags = [
        "-Werror"
        "-Wall"
    ];
    compile_multilib = "32";
};

ServiceLog_test = cc_test {
    name = "ServiceLog_test";
    srcs = ["ServiceLog_test.cpp"];
    test_suites = ["device-tests"];
    shared_libs = [
        "liblog"
        "libmedia"
        "libresourcemanagerservice"
        "libutils"
    ];
    include_dirs = [
        "frameworks/av/include"
        "frameworks/av/services/mediaresourcemanager"
    ];
    cflags = [
        "-Werror"
        "-Wall"
    ];
    compile_multilib = "32";
};

in { inherit ResourceManagerService_test ServiceLog_test; }
