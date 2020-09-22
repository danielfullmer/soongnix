{ cc_test }:
let

#
#  Copyright (C) 2019 The Android Open Source Project
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
#

#  SoftAP-specific tests, similar to VtsHalWifiApV1_0TargetTest.
VtsHalWifiApV1_4TargetTest = cc_test {
    name = "VtsHalWifiApV1_4TargetTest";
    defaults = ["VtsHalTargetTestDefaults"];
    srcs = [
        "wifi_ap_iface_hidl_test.cpp"
        "wifi_chip_hidl_test.cpp"
    ];
    static_libs = [
        "VtsHalWifiV1_0TargetTestUtil"
        "android.hardware.wifi@1.0"
        "android.hardware.wifi@1.1"
        "android.hardware.wifi@1.2"
        "android.hardware.wifi@1.3"
        "android.hardware.wifi@1.4"
        "libwifi-system-iface"
    ];
    test_suites = [
        "general-tests"
        "vts"
    ];
};

#  These tests are split out so that they can be conditioned on presence of the
#  "android.hardware.wifi.aware" feature.
VtsHalWifiNanV1_4TargetTest = cc_test {
    name = "VtsHalWifiNanV1_4TargetTest";
    defaults = ["VtsHalTargetTestDefaults"];
    srcs = [
        "wifi_nan_iface_hidl_test.cpp"
    ];
    static_libs = [
        "VtsHalWifiV1_0TargetTestUtil"
        "android.hardware.wifi@1.0"
        "android.hardware.wifi@1.1"
        "android.hardware.wifi@1.2"
        "android.hardware.wifi@1.3"
        "android.hardware.wifi@1.4"
        "libwifi-system-iface"
    ];
    test_suites = [
        "general-tests"
        "vts"
    ];
};

#  These tests are split out so that they can be conditioned on presence of the
#  "android.hardware.wifi.rtt" feature.
VtsHalWifiRttV1_4TargetTest = cc_test {
    name = "VtsHalWifiRttV1_4TargetTest";
    defaults = ["VtsHalTargetTestDefaults"];
    srcs = [
        "wifi_rtt_controller_hidl_test.cpp"
    ];
    static_libs = [
        "VtsHalWifiV1_0TargetTestUtil"
        "android.hardware.wifi@1.0"
        "android.hardware.wifi@1.1"
        "android.hardware.wifi@1.2"
        "android.hardware.wifi@1.3"
        "android.hardware.wifi@1.4"
        "libwifi-system-iface"
    ];
    test_suites = [
        "general-tests"
        "vts"
    ];
};

in { inherit VtsHalWifiApV1_4TargetTest VtsHalWifiNanV1_4TargetTest VtsHalWifiRttV1_4TargetTest; }
