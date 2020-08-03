{ cc_library_static, cc_test }:
let

#  libbtcore static library for target and host
#  ========================================================
libbtcore = cc_library_static {
    name = "libbtcore";
    defaults = ["fluoride_defaults"];
    local_include_dirs = ["include"];
    include_dirs = ["system/bt"];
    srcs = [
        "src/device_class.cc"
        "src/hal_util.cc"
        "src/module.cc"
        "src/osi_module.cc"
        "src/property.cc"
    ];
    shared_libs = [
        "liblog"
    ];
    header_libs = ["libbluetooth_headers"];
    host_supported = true;
    target = {
        linux_glibc = {
            cflags = ["-D_GNU_SOURCE"];
        };
    };
};

#  Note: It's good to get the tests compiled both for the host and the target so
#  we get to test with both Bionic libc and glibc
#  libbtcore unit tests for target and host
#  ========================================================
net_test_btcore = cc_test {
    name = "net_test_btcore";
    test_suites = ["device-tests"];
    defaults = ["fluoride_defaults"];
    local_include_dirs = ["include"];
    include_dirs = ["system/bt"];
    srcs = [
        "test/device_class_test.cc"
        "test/property_test.cc"
    ];
    shared_libs = [
        "liblog"
    ];
    static_libs = [
        "libbtcore"
        "libosi-AllocationTestHarness"
        "libosi"
    ];
    host_supported = true;
};

in { inherit libbtcore net_test_btcore; }
