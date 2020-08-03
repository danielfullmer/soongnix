{ cc_library_static, cc_test_host }:
let

#  simulation library for testing virtual devices
#  ========================================================
libbt-rootcanal = cc_library_static {
    name = "libbt-rootcanal";
    defaults = ["libchrome_support_defaults"];
    host_supported = true;
    proprietary = true;
    srcs = [
        "model/controller/acl_connection.cc"
        "model/controller/acl_connection_handler.cc"
        "model/controller/dual_mode_controller.cc"
        "model/controller/link_layer_controller.cc"
        "model/controller/security_manager.cc"
        "model/devices/beacon.cc"
        "model/devices/beacon_swarm.cc"
        "model/devices/broken_adv.cc"
        "model/devices/car_kit.cc"
        "model/devices/classic.cc"
        "model/devices/device.cc"
        "model/devices/device_properties.cc"
        "model/devices/h4_packetizer.cc"
        "model/devices/h4_protocol.cc"
        "model/devices/hci_packetizer.cc"
        "model/devices/hci_protocol.cc"
        "model/devices/hci_socket_device.cc"
        "model/devices/keyboard.cc"
        "model/devices/link_layer_socket_device.cc"
        "model/devices/loopback.cc"
        "model/devices/polled_socket.cc"
        "model/devices/remote_loopback_device.cc"
        "model/devices/sniffer.cc"
        "model/setup/async_manager.cc"
        "model/setup/device_boutique.cc"
        "model/setup/phy_layer_factory.cc"
        "model/setup/test_channel_transport.cc"
        "model/setup/test_command_handler.cc"
        "model/setup/test_model.cc"
    ];
    cflags = [
        "-fvisibility=hidden"
        "-DHAS_NO_BDROID_BUILDCFG"
    ];
    local_include_dirs = [
        "include"
    ];
    export_include_dirs = [
        "include"
        "."
    ];
    header_libs = [
        "libbluetooth_headers"
    ];
    include_dirs = [
        "system/bt"
        "system/bt/utils/include"
        "system/bt/hci/include"
        "system/bt/internal_include"
        "system/bt/stack/include"
    ];
    shared_libs = [
        "libbase"
        "liblog"
    ];
    whole_static_libs = [
        "libbt-rootcanal-packets"
    ];
    static_libs = [
        "libbt-rootcanal-types"
    ];
};

#  test-vendor unit tests for host
#  ========================================================
test-vendor_test_host = cc_test_host {
    name = "test-vendor_test_host";
    defaults = [
        "libchrome_support_defaults"
        "clang_file_coverage"
        "clang_coverage_bin"
    ];
    srcs = [
        "test/async_manager_unittest.cc"
        "test/security_manager_unittest.cc"
    ];
    header_libs = [
        "libbluetooth_headers"
    ];
    local_include_dirs = [
        "include"
    ];
    include_dirs = [
        "system/bt"
        "system/bt/utils/include"
        "system/bt/hci/include"
        "system/bt/stack/include"
    ];
    shared_libs = [
        "liblog"
    ];
    static_libs = [
        "libbt-rootcanal-types"
        "libbt-rootcanal"
    ];
    cflags = [
        "-fvisibility=hidden"
        "-DLOG_NDEBUG=1"
    ];
};

#  Linux RootCanal Executable
#  ========================================================
root-canal = cc_test_host {
    name = "root-canal";
    defaults = [
        "libchrome_support_defaults"
    ];
    srcs = [
        "desktop/root_canal_main.cc"
        "desktop/test_environment.cc"
    ];
    header_libs = [
        "libbluetooth_headers"
    ];
    local_include_dirs = [
        "include"
    ];
    include_dirs = [
        "system/bt"
        "system/bt/utils/include"
        "system/bt/hci/include"
        "system/bt/stack/include"
    ];
    shared_libs = [
        "liblog"
    ];
    static_libs = [
        "libbt-rootcanal-types"
        "libbt-rootcanal"
    ];
};

in { inherit libbt-rootcanal root-canal test-vendor_test_host; }
