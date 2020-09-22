{ cc_binary, cc_library_shared, cc_library_static, cc_test, cc_test_host }:
let

#
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

"android.hardware.bluetooth@1.0-impl" = cc_library_shared {
    name = "android.hardware.bluetooth@1.0-impl";
    defaults = ["hidl_defaults"];
    vendor = true;
    relative_install_path = "hw";
    srcs = [
        "bluetooth_hci.cc"
        "bluetooth_address.cc"
        "vendor_interface.cc"
    ];
    shared_libs = [
        "android.hardware.bluetooth@1.0"
        "libbase"
        "libcutils"
        "libhardware"
        "libhidlbase"
        "liblog"
        "libutils"
    ];
    static_libs = [
        "android.hardware.bluetooth-async"
        "android.hardware.bluetooth-hci"
    ];
};

"android.hardware.bluetooth-async" = cc_library_static {
    name = "android.hardware.bluetooth-async";
    vendor = true;
    defaults = ["hidl_defaults"];
    srcs = [
        "async_fd_watcher.cc"
    ];
    export_include_dirs = ["."];
    shared_libs = [
        "liblog"
    ];
};

"android.hardware.bluetooth-hci" = cc_library_static {
    name = "android.hardware.bluetooth-hci";
    vendor = true;
    defaults = ["hidl_defaults"];
    srcs = [
        "hci_packetizer.cc"
        "hci_protocol.cc"
        "h4_protocol.cc"
        "mct_protocol.cc"
    ];
    export_include_dirs = ["."];
    shared_libs = [
        "libbase"
        "libhidlbase"
        "liblog"
        "libutils"
    ];
};

bluetooth-vendor-interface-unit-tests = cc_test {
    name = "bluetooth-vendor-interface-unit-tests";
    vendor = true;
    defaults = ["hidl_defaults"];
    srcs = [
        "test/async_fd_watcher_unittest.cc"
        "test/h4_protocol_unittest.cc"
        "test/mct_protocol_unittest.cc"
    ];
    local_include_dirs = [
        "test"
    ];
    shared_libs = [
        "libbase"
        "libhidlbase"
        "liblog"
        "libutils"
    ];
    static_libs = [
        "android.hardware.bluetooth-async"
        "android.hardware.bluetooth-hci"
        "libgmock"
    ];
    test_suites = ["general-tests"];
};

bluetooth-address-unit-tests = cc_test_host {
    name = "bluetooth-address-unit-tests";
    defaults = ["hidl_defaults"];
    srcs = [
        "bluetooth_address.cc"
        "test/bluetooth_address_test.cc"
        "test/properties.cc"
    ];
    local_include_dirs = [
        "test"
    ];
    shared_libs = [
        "libbase"
        "liblog"
    ];
};

"android.hardware.bluetooth@1.0-service" = cc_binary {
    name = "android.hardware.bluetooth@1.0-service";
    defaults = ["hidl_defaults"];
    relative_install_path = "hw";
    vendor = true;
    init_rc = ["android.hardware.bluetooth@1.0-service.rc"];
    srcs = ["service.cpp"];

    shared_libs = [
        "liblog"
        "libcutils"
        "libdl"
        "libbase"
        "libutils"
        "libhardware"
        "libhidlbase"
        "android.hardware.bluetooth@1.0"
    ];
};

in { inherit "android.hardware.bluetooth-async" "android.hardware.bluetooth-hci" "android.hardware.bluetooth@1.0-impl" "android.hardware.bluetooth@1.0-service" bluetooth-address-unit-tests bluetooth-vendor-interface-unit-tests; }
