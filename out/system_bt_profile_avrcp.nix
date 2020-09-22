{ cc_fuzz, cc_library_static, cc_test }:
let

avrcp-target-service = cc_library_static {
    name = "avrcp-target-service";
    defaults = [
        "fluoride_defaults"
        "clang_file_coverage"
    ];
    host_supported = true;
    include_dirs = [
        "system/bt"
        "system/bt/btcore/include"
        "system/bt/internal_include"
        "system/bt/stack/include"
    ];
    export_include_dirs = ["./"];
    srcs = [
        "connection_handler.cc"
        "device.cc"
    ];
    static_libs = [
        "lib-bt-packets"
        "libbluetooth-types"
        "libosi"
    ];
    shared_libs = [
        "libchrome"
    ];
};

net_test_avrcp = cc_test {
    name = "net_test_avrcp";
    test_suites = ["general-tests"];
    defaults = [
        "fluoride_defaults"
        "clang_coverage_bin"
    ];
    host_supported = true;
    include_dirs = [
        "system/bt"
        "system/bt/btcore/include"
        "system/bt/internal_include"
        "system/bt/stack/include"
    ];
    srcs = [
        "tests/avrcp_connection_handler_test.cc"
        "tests/avrcp_device_test.cc"
    ];
    static_libs = [
        "libgmock"
        "lib-bt-packets"
        "libosi"
        "liblog"
        "libcutils"
        "libbtdevice"
        "avrcp-target-service"
    ];
    shared_libs = [
        "libchrome"
    ];
    sanitize = {
        cfi = false;
    };

    cflags = ["-DBUILDCFG"];
};

avrcp_device_fuzz = cc_fuzz {
    name = "avrcp_device_fuzz";
    host_supported = true;
    defaults = [
        "fluoride_defaults_fuzzable"
    ];
    srcs = [
        "tests/avrcp_device_fuzz/avrcp_device_fuzz.cc"
    ];
    include_dirs = [
        "system/bt"
        "system/bt/packet/tests"
        "system/bt/btcore/include"
        "system/bt/internal_include"
        "system/bt/stack/include"
    ];
    static_libs = [
        "avrcp-target-service"
        "lib-bt-packets"
        "libbase"
        "libchrome"
        "libcutils"
        "libevent"
        "liblog"
        "libstatslog"
    ];
    header_libs = ["libbluetooth_headers"];
    corpus = [
        "tests/avrcp_device_fuzz/corpus/*"
    ];
};

in { inherit avrcp-target-service avrcp_device_fuzz net_test_avrcp; }
