{ cc_library_static, cc_test_host }:
let

#  packet library for libbt-rootcanal
#  ========================================================
libbt-rootcanal-packets = cc_library_static {
    name = "libbt-rootcanal-packets";
    defaults = [
        "libchrome_support_defaults"
        "clang_file_coverage"
    ];
    host_supported = true;
    proprietary = true;
    srcs = [
        "iterator.cc"
        "counted_builder.cc"
        "packet_view.cc"
        "raw_builder.cc"
        "view.cc"
        "hci/acl_packet_builder.cc"
        "hci/acl_packet_view.cc"
        "hci/command_packet_builder.cc"
        "hci/command_packet_view.cc"
        "hci/event_packet_builder.cc"
        "hci/event_payload_builder.cc"
        "hci/hci_packet_builder.cc"
        "hci/le_meta_event_builder.cc"
        "hci/sco_packet_builder.cc"
        "hci/sco_packet_view.cc"
        "link_layer/link_layer_packet_builder.cc"
        "link_layer/link_layer_packet_view.cc"
    ];
    cflags = [
        "-fvisibility=hidden"
    ];
    local_include_dirs = [
        "."
    ];
    export_include_dirs = ["."];
    include_dirs = [
        "system/bt/vendor_libs/test_vendor_lib/include"
        "system/bt/vendor_libs/test_vendor_lib/"
        "system/bt/"
    ];
    shared_libs = [
        "libbase"
        "liblog"
    ];
};

#  Unit tests for the host
#  ========================================================
rootcanal-packets_test_host = cc_test_host {
    name = "rootcanal-packets_test_host";
    defaults = [
        "libchrome_support_defaults"
        "clang_file_coverage"
        "clang_coverage_bin"
    ];
    srcs = [
        "test/link_layer_packet_builder_test.cc"
        "test/packet_builder_test.cc"
        "test/packet_view_test.cc"
        "hci/test/acl_builder_test.cc"
        "hci/test/event_builder_test.cc"
    ];
    header_libs = [
        "libbluetooth_headers"
    ];
    local_include_dirs = [
        "."
    ];
    include_dirs = [
        "system/bt"
        "system/bt/hci/include"
        "system/bt/vendor_libs/test_vendor_lib"
        "system/bt/vendor_libs/test_vendor_lib/include"
    ];
    shared_libs = [
        "liblog"
    ];
    static_libs = [
        "libbt-rootcanal-types"
        "libbt-rootcanal-packets"
    ];
};

in { inherit libbt-rootcanal-packets rootcanal-packets_test_host; }
