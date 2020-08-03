{ cc_library_static, cc_test }:
let

sdp_service = cc_library_static {
    name = "sdp_service";
    defaults = [
        "fluoride_defaults"
        "clang_file_coverage"
    ];
    host_supported = true;
    include_dirs = [
        "system/bt/"
    ];
    srcs = [
        "common/data_element_reader.cc"
    ];
    static_libs = [
        "lib-bt-packets"
        "libbluetooth-types"
    ];
};

bluetooth_test_sdp = cc_test {
    name = "bluetooth_test_sdp";
    test_suites = ["general-tests"];
    defaults = [
        "fluoride_defaults"
        "clang_coverage_bin"
    ];
    host_supported = true;
    include_dirs = [
        "system/bt/"
    ];
    srcs = [
        "common/test/data_element_reader_test.cc"
    ];
    static_libs = [
        "libgmock"
        "sdp_service"
        "lib-bt-packets"
        "libbluetooth-types"
    ];
};

in { inherit bluetooth_test_sdp sdp_service; }
