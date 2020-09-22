{ cc_test }:
let

#
#  Copyright (C) 2018 The Android Open Source Project
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

VtsHalWifiV1_2TargetTest = cc_test {
    name = "VtsHalWifiV1_2TargetTest";
    defaults = ["VtsHalTargetTestDefaults"];
    srcs = [
        "wifi_chip_hidl_test.cpp"
        "wifi_sta_iface_hidl_test.cpp"
    ];
    static_libs = [
        "VtsHalWifiV1_0TargetTestUtil"
        "android.hardware.wifi@1.0"
        "android.hardware.wifi@1.1"
        "android.hardware.wifi@1.2"
        "android.hardware.wifi@1.3"
        "libwifi-system-iface"
    ];
    disable_framework = true;
    test_suites = [
        "general-tests"
        "vts"
    ];
};

VtsHalWifiNanV1_2TargetTest = cc_test {
    name = "VtsHalWifiNanV1_2TargetTest";
    defaults = ["VtsHalTargetTestDefaults"];
    srcs = [
        "wifi_nan_iface_hidl_test.cpp"
    ];
    static_libs = [
        "VtsHalWifiV1_0TargetTestUtil"
        "android.hardware.wifi@1.0"
        "android.hardware.wifi@1.1"
        "android.hardware.wifi@1.2"
        "libwifi-system-iface"
    ];
    test_suites = [
        "general-tests"
        "vts"
    ];
};

in { inherit VtsHalWifiNanV1_2TargetTest VtsHalWifiV1_2TargetTest; }
