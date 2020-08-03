{ cc_library_static }:
let

lib-bt-packets-avrcp = cc_library_static {
    name = "lib-bt-packets-avrcp";
    defaults = ["libchrome_support_defaults"];
    header_libs = ["avrcp_headers"];
    export_header_lib_headers = ["avrcp_headers"];
    export_include_dirs = ["."];
    host_supported = true;
    include_dirs = [
        "system/bt/"
        "system/bt/include"
    ];
    srcs = [
        "avrcp_browse_packet.cc"
        "avrcp_packet.cc"
        "avrcp_reject_packet.cc"
        "capabilities_packet.cc"
        "change_path.cc"
        "general_reject_packet.cc"
        "get_element_attributes_packet.cc"
        "get_folder_items.cc"
        "get_item_attributes.cc"
        "get_play_status_packet.cc"
        "get_total_number_of_items.cc"
        "pass_through_packet.cc"
        "play_item.cc"
        "register_notification_packet.cc"
        "set_absolute_volume.cc"
        "set_addressed_player.cc"
        "set_browsed_player.cc"
        "vendor_packet.cc"
    ];
    static_libs = [
        "lib-bt-packets-base"
    ];
};

in { inherit lib-bt-packets-avrcp; }
