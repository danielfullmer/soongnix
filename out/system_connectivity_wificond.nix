{ cc_binary, cc_defaults, cc_library_static, cc_test }:
let

#  Copyright (C) 2016 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

wificond_defaults = cc_defaults {
    name = "wificond_defaults";

    cppflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
    ];
    #include_dirs = ["system/connectivity"];
};

#
#  wificond daemon.
#
wificond = cc_binary {
    name = "wificond";
    defaults = ["wificond_defaults"];
    init_rc = ["wificond.rc"];
    srcs = ["main.cpp"];

    shared_libs = [
        "android.hardware.wifi.offload@1.0"
        "libbinder"
        "libbase"
        "libcutils"
        "libhidlbase"
        "libhidltransport"
        "libminijail"
        "libutils"
        "libwifi-system-iface"
    ];
    static_libs = ["libwificond"];
};

#
#  wificond static library
#
libwificond = cc_library_static {
    name = "libwificond";
    defaults = ["wificond_defaults"];
    srcs = [
        "ap_interface_binder.cpp"
        "ap_interface_impl.cpp"
        "client_interface_binder.cpp"
        "client_interface_impl.cpp"
        "logging_utils.cpp"
        "scanning/channel_settings.cpp"
        "scanning/hidden_network.cpp"
        "scanning/offload_scan_callback_interface_impl.cpp"
        "scanning/pno_network.cpp"
        "scanning/pno_settings.cpp"
        "scanning/radio_chain_info.cpp"
        "scanning/scan_result.cpp"
        "scanning/offload/scan_stats.cpp"
        "scanning/single_scan_settings.cpp"
        "scanning/scan_utils.cpp"
        "scanning/scanner_impl.cpp"
        "scanning/offload/offload_scan_manager.cpp"
        "scanning/offload/offload_callback.cpp"
        "scanning/offload/offload_service_utils.cpp"
        "scanning/offload/offload_scan_utils.cpp"
        "server.cpp"
    ];

    shared_libs = [
        "android.hardware.wifi.offload@1.0"
        "libbase"
        "libutils"
        "libhidlbase"
        "libhidltransport"
        "libwifi-system-iface"
    ];
    whole_static_libs = [
        "libwificond_ipc"
        "libwificond_nl"
        "libwificond_event_loop"
    ];
};

#
#  wificond netlink library
#
libwificond_nl = cc_library_static {
    name = "libwificond_nl";
    defaults = ["wificond_defaults"];
    srcs = [
        "net/mlme_event.cpp"
        "net/netlink_manager.cpp"
        "net/netlink_utils.cpp"
        "net/nl80211_attribute.cpp"
        "net/nl80211_packet.cpp"
    ];
    shared_libs = ["libbase"];

};

#
#  wificond event loop library
#
libwificond_event_loop = cc_library_static {
    name = "libwificond_event_loop";
    defaults = ["wificond_defaults"];
    srcs = ["looper_backed_event_loop.cpp"];
    whole_static_libs = [
        "liblog"
        "libbase"
        "libutils"
    ];

};

#
#  wificond IPC interface library
#
libwificond_ipc = cc_library_static {
    name = "libwificond_ipc";
    defaults = ["wificond_defaults"];
    aidl = {
        local_include_dirs = ["aidl"];
        export_aidl_headers = true;
    };
    srcs = [
        "ipc_constants.cpp"
        "aidl/android/net/wifi/IApInterface.aidl"
        "aidl/android/net/wifi/IApInterfaceEventCallback.aidl"
        "aidl/android/net/wifi/IClientInterface.aidl"
        "aidl/android/net/wifi/IInterfaceEventCallback.aidl"
        "aidl/android/net/wifi/IPnoScanEvent.aidl"
        "aidl/android/net/wifi/IScanEvent.aidl"
        "aidl/android/net/wifi/ISendMgmtFrameEvent.aidl"
        "aidl/android/net/wifi/IWificond.aidl"
        "aidl/android/net/wifi/IWifiScannerImpl.aidl"
        "scanning/channel_settings.cpp"
        "scanning/hidden_network.cpp"
        "scanning/pno_network.cpp"
        "scanning/pno_settings.cpp"
        "scanning/radio_chain_info.cpp"
        "scanning/scan_result.cpp"
        "scanning/single_scan_settings.cpp"
    ];
    shared_libs = ["libbinder"];
};

#
#  test util library
#
libwificond_test_utils = cc_library_static {
    name = "libwificond_test_utils";
    defaults = ["wificond_defaults"];
    srcs = [
        "tests/integration/binder_dispatcher.cpp"
        "tests/integration/process_utils.cpp"
        "tests/shell_utils.cpp"
    ];
    shared_libs = ["libbase"];

    whole_static_libs = [
        "libwificond_ipc"
        "libwificond_event_loop"
    ];
};

#
#  wificond unit tests.
#
wificond_unit_test = cc_test {
    name = "wificond_unit_test";
    defaults = ["wificond_defaults"];
    test_suites = ["device-tests"];
    srcs = [
        "tests/ap_interface_impl_unittest.cpp"
        "tests/client_interface_impl_unittest.cpp"
        "tests/looper_backed_event_loop_unittest.cpp"
        "tests/main.cpp"
        "tests/mock_client_interface_impl.cpp"
        "tests/mock_netlink_manager.cpp"
        "tests/mock_netlink_utils.cpp"
        "tests/mock_offload.cpp"
        "tests/mock_offload_callback_handlers.cpp"
        "tests/mock_offload_scan_callback_interface.cpp"
        "tests/mock_offload_scan_callback_interface_impl.cpp"
        "tests/mock_offload_scan_manager.cpp"
        "tests/mock_offload_service_utils.cpp"
        "tests/mock_scan_utils.cpp"
        "tests/netlink_manager_unittest.cpp"
        "tests/netlink_utils_unittest.cpp"
        "tests/nl80211_attribute_unittest.cpp"
        "tests/nl80211_packet_unittest.cpp"
        "tests/offload_callback_test.cpp"
        "tests/offload_hal_test_constants.cpp"
        "tests/offload_scan_manager_test.cpp"
        "tests/offload_scan_utils_test.cpp"
        "tests/offload_test_utils.cpp"
        "tests/scanner_unittest.cpp"
        "tests/scan_result_unittest.cpp"
        "tests/scan_settings_unittest.cpp"
        "tests/scan_stats_unittest.cpp"
        "tests/scan_utils_unittest.cpp"
        "tests/server_unittest.cpp"
    ];

    static_libs = [
        "libgmock"
        "libgtest"
        "libwifi-system-iface-test"
        "libwificond"
        "libwificond_nl"
    ];
    shared_libs = [
        "android.hardware.wifi.offload@1.0"
        "libbase"
        "libbinder"
        "libcutils"
        "libhidltransport"
        "libhidlbase"
        "liblog"
        "libutils"
        "libwifi-system-iface"
    ];
};

#
#  wificond device integration tests.
#
wificond_integration_test = cc_test {
    name = "wificond_integration_test";
    defaults = ["wificond_defaults"];
    srcs = [
        "tests/integration/ap_interface_test.cpp"
        "tests/integration/client_interface_test.cpp"
        "tests/integration/life_cycle_test.cpp"
        "tests/integration/scanner_test.cpp"
        "tests/main.cpp"
        "tests/shell_unittest.cpp"
    ];
    shared_libs = [
        "libbase"
        "libbinder"
        "libcutils"
        "libutils"
        "libwifi-system-iface"
    ];
    static_libs = [
        "libgmock"
        "libwificond_ipc"
        "libwificond_test_utils"
    ];
};

in { inherit libwificond libwificond_event_loop libwificond_ipc libwificond_nl libwificond_test_utils wificond wificond_defaults wificond_integration_test wificond_unit_test; }
