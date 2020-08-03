{ cc_library_static, cc_test }:
let

lib-bt-packets = cc_library_static {
    name = "lib-bt-packets";
    defaults = ["libchrome_support_defaults"];
    host_supported = true;
    export_include_dirs = [
        "./include"
        "./"
    ];
    whole_static_libs = [
        "lib-bt-packets-base"
        "lib-bt-packets-avrcp"
    ];
};

net_test_btpackets = cc_test {
    name = "net_test_btpackets";
    defaults = ["fluoride_defaults"];
    test_suites = ["device-tests"];
    host_supported = true;
    local_include_dirs = ["tests"];
    include_dirs = [
        "system/bt/"
        "system/bt/include"
    ];
    srcs = [
        "tests/avrcp/avrcp_browse_packet_test.cc"
        "tests/avrcp/avrcp_packet_test.cc"
        "tests/avrcp/avrcp_reject_packet_test.cc"
        "tests/avrcp/change_path_packet_test.cc"
        "tests/avrcp/general_reject_packet_test.cc"
        "tests/avrcp/get_capabilities_packet_test.cc"
        "tests/avrcp/get_element_attributes_packet_test.cc"
        "tests/avrcp/get_folder_items_packet_test.cc"
        "tests/avrcp/get_item_attributes_packet_test.cc"
        "tests/avrcp/get_play_status_packet_test.cc"
        "tests/avrcp/get_total_number_of_items_packet_test.cc"
        "tests/avrcp/pass_through_packet_test.cc"
        "tests/avrcp/play_item_packet_test.cc"
        "tests/avrcp/register_notification_packet_test.cc"
        "tests/avrcp/set_absolute_volume_packet_test.cc"
        "tests/avrcp/set_addressed_player_packet_test.cc"
        "tests/avrcp/set_browsed_player_packet_test.cc"
        "tests/avrcp/vendor_packet_test.cc"
        "tests/base/iterator_test.cc"
        "tests/base/packet_builder_test.cc"
        "tests/base/packet_test.cc"
    ];
    static_libs = [
        "libgmock"
        "lib-bt-packets"
    ];
    cflags = [
        "-DBUILDCFG"
    ];
};

in { inherit lib-bt-packets net_test_btpackets; }
