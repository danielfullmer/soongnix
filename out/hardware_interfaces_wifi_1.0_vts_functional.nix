{ cc_library_static, cc_test }:
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
#

VtsHalWifiV1_0TargetTestUtil = cc_library_static {
    name = "VtsHalWifiV1_0TargetTestUtil";
    defaults = ["VtsHalTargetTestDefaults"];
    srcs = [
        "wifi_hidl_call_util_selftest.cpp"
        "wifi_hidl_test.cpp"
        "wifi_hidl_test_utils.cpp"
    ];
    export_include_dirs = [
        "."
    ];
    shared_libs = [
        "libnativehelper"
    ];
    static_libs = ["android.hardware.wifi@1.0"];
};

VtsHalWifiV1_0TargetTest = cc_test {
    name = "VtsHalWifiV1_0TargetTest";
    defaults = ["VtsHalTargetTestDefaults"];
    srcs = [
        "VtsHalWifiV1_0TargetTest.cpp"
        "wifi_ap_iface_hidl_test.cpp"
        "wifi_chip_hidl_test.cpp"
        "wifi_p2p_iface_hidl_test.cpp"
        "wifi_rtt_controller_hidl_test.cpp"
        "wifi_sta_iface_hidl_test.cpp"
    ];
    static_libs = [
        "VtsHalWifiV1_0TargetTestUtil"
        "android.hardware.wifi@1.0"
        "android.hardware.wifi@1.1"
        "android.hardware.wifi@1.2"
        "android.hardware.wifi@1.3"
    ];
    test_suites = ["general-tests"];
};

VtsHalWifiNanV1_0TargetTest = cc_test {
    name = "VtsHalWifiNanV1_0TargetTest";
    defaults = ["VtsHalTargetTestDefaults"];
    srcs = [
        "VtsHalWifiV1_0TargetTest.cpp"
        "wifi_nan_iface_hidl_test.cpp"
    ];
    static_libs = [
        "VtsHalWifiV1_0TargetTestUtil"
        "android.hardware.wifi@1.0"
    ];
    test_suites = ["general-tests"];
};

in { inherit VtsHalWifiNanV1_0TargetTest VtsHalWifiV1_0TargetTest VtsHalWifiV1_0TargetTestUtil; }
