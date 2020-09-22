{ cc_binary, cc_defaults, cc_library_static, cc_test, filegroup }:
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
    include_dirs = ["system/connectivity"];
};

#
#  wificond daemon.
#
wificond = cc_binary {
    name = "wificond";
    defaults = ["wificond_defaults"];
    init_rc = ["wificond.rc"];
    srcs = [
        "main.cpp"
        "wifi_keystore_hal_connector.cpp"
    ];
    include_dirs = ["system/security/keystore/include"];

    shared_libs = [
        "libbinder"
        "libbase"
        "libcrypto"
        "libcutils"
        "libhidlbase"
        "libkeystore_aidl"
        "libkeystore_binder"
        "libkeystore_parcelables"
        "libminijail"
        "libssl"
        "libutils"
        "libwifi-system-iface"
        "android.system.wifi.keystore@1.0"
    ];
    static_libs = [
        "libwificond" #  Wificond daemon
        "libwifikeystorehal" #  Wifi Keystore HAL service
    ];
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
        "device_wiphy_capabilities.cpp"
        "logging_utils.cpp"
        "client/native_wifi_client.cpp"
        "scanning/channel_settings.cpp"
        "scanning/hidden_network.cpp"
        "scanning/pno_network.cpp"
        "scanning/pno_settings.cpp"
        "scanning/radio_chain_info.cpp"
        "scanning/scan_result.cpp"
        "scanning/single_scan_settings.cpp"
        "scanning/scan_utils.cpp"
        "scanning/scanner_impl.cpp"
        "server.cpp"
    ];

    shared_libs = [
        "libbase"
        "libutils"
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
        ":libwificond_ipc_aidl"
        "client/native_wifi_client.cpp"
        "device_wiphy_capabilities.cpp"
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

libwificond_ipc_aidl = filegroup {
    name = "libwificond_ipc_aidl";
    srcs = [
        "aidl/android/net/wifi/nl80211/IApInterface.aidl"
        "aidl/android/net/wifi/nl80211/IApInterfaceEventCallback.aidl"
        "aidl/android/net/wifi/nl80211/IClientInterface.aidl"
        "aidl/android/net/wifi/nl80211/IInterfaceEventCallback.aidl"
        "aidl/android/net/wifi/nl80211/IPnoScanEvent.aidl"
        "aidl/android/net/wifi/nl80211/IScanEvent.aidl"
        "aidl/android/net/wifi/nl80211/ISendMgmtFrameEvent.aidl"
        "aidl/android/net/wifi/nl80211/IWificond.aidl"
        "aidl/android/net/wifi/nl80211/IWifiScannerImpl.aidl"
    ];
    path = "aidl";
};

#
#  test util library
#
libwificond_test_utils = cc_library_static {
    name = "libwificond_test_utils";
    defaults = ["wificond_defaults"];
    srcs = [
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
        "tests/mock_scan_utils.cpp"
        "tests/native_wifi_client_unittest.cpp"
        "tests/netlink_manager_unittest.cpp"
        "tests/netlink_utils_unittest.cpp"
        "tests/nl80211_attribute_unittest.cpp"
        "tests/nl80211_packet_unittest.cpp"
        "tests/scanner_unittest.cpp"
        "tests/scan_result_unittest.cpp"
        "tests/scan_settings_unittest.cpp"
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
        "libbase"
        "libbinder"
        "libcutils"
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

in { inherit libwificond libwificond_event_loop libwificond_ipc libwificond_ipc_aidl libwificond_nl libwificond_test_utils wificond wificond_defaults wificond_integration_test wificond_unit_test; }
