{ cc_library_static, cc_test_host, genrule }:
let

#  simulation library for testing virtual devices
#  ========================================================
libbt-rootcanal = cc_library_static {
    name = "libbt-rootcanal";
    defaults = ["gd_defaults"];
    header_libs = ["jni_headers"];
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
        "model/devices/scripted_beacon.cc"
        "model/devices/sniffer.cc"
        "model/setup/async_manager.cc"
        "model/setup/device_boutique.cc"
        "model/setup/phy_layer_factory.cc"
        "model/setup/test_channel_transport.cc"
        "model/setup/test_command_handler.cc"
        "model/setup/test_model.cc"
        ":BluetoothPacketSources"
        ":BluetoothHciClassSources"
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
    generated_headers = [
        "RootCanalGeneratedPackets_h"
        "BluetoothGeneratedPackets_h"
    ];
    include_dirs = [
        "system/bt"
        "system/bt/gd"
    ];
    shared_libs = [
        "libbase"
        "libchrome"
        "liblog"
    ];
    static_libs = [
        "libbt-rootcanal-types"
        "libscriptedbeaconpayload-protos-lite"
    ];
};

libscriptedbeaconpayload-protos-lite = cc_library_static {
    name = "libscriptedbeaconpayload-protos-lite";
    host_supported = true;
    proprietary = true;
    proto = {
        export_proto_headers = true;
        type = "lite";
    };
    srcs = ["model/devices/scripted_beacon_ble_payload.proto"];
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
        "system/bt/gd"
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
        "system/bt/gd"
    ];
    generated_headers = [
        "RootCanalGeneratedPackets_h"
        "BluetoothGeneratedPackets_h"
    ];
    shared_libs = [
        "liblog"
    ];
    static_libs = [
        "libbt-rootcanal-types"
        "libprotobuf-cpp-lite"
        "libscriptedbeaconpayload-protos-lite"
        "libbt-rootcanal"
    ];
};

RootCanalGeneratedPackets_h = genrule {
    name = "RootCanalGeneratedPackets_h";
    tools = [
        "bluetooth_packetgen"
    ];
    cmd = "$(location bluetooth_packetgen) --root_namespace=model --include=system/bt/vendor_libs/test_vendor_lib --out=$(genDir) $(in)";
    srcs = [
        "packets/link_layer_packets.pdl"
    ];
    out = [
        "packets/link_layer_packets.h"
    ];
};

in { inherit RootCanalGeneratedPackets_h libbt-rootcanal libscriptedbeaconpayload-protos-lite root-canal test-vendor_test_host; }
