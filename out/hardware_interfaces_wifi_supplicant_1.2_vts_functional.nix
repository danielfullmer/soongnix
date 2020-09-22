{ cc_library_static, cc_test }:
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

VtsHalWifiSupplicantV1_2TargetTestUtil = cc_library_static {
    name = "VtsHalWifiSupplicantV1_2TargetTestUtil";
    defaults = ["VtsHalTargetTestDefaults"];
    srcs = ["supplicant_hidl_test_utils_1_2.cpp"];
    export_include_dirs = [
        "."
    ];
    static_libs = [
        "VtsHalWifiV1_0TargetTestUtil"
        "VtsHalWifiSupplicantV1_0TargetTestUtil"
        "VtsHalWifiSupplicantV1_1TargetTestUtil"
        "android.hardware.wifi.supplicant@1.0"
        "android.hardware.wifi.supplicant@1.1"
        "android.hardware.wifi.supplicant@1.2"
        "android.hardware.wifi@1.0"
        "libgmock"
        "libwifi-system"
        "libwifi-system-iface"
    ];
};

VtsHalWifiSupplicantV1_2TargetTest = cc_test {
    name = "VtsHalWifiSupplicantV1_2TargetTest";
    defaults = ["VtsHalTargetTestDefaults"];
    srcs = [
        "supplicant_sta_iface_hidl_test.cpp"
        "supplicant_sta_network_hidl_test.cpp"
    ];
    static_libs = [
        "VtsHalWifiV1_0TargetTestUtil"
        "VtsHalWifiSupplicantV1_0TargetTestUtil"
        "VtsHalWifiSupplicantV1_1TargetTestUtil"
        "VtsHalWifiSupplicantV1_2TargetTestUtil"
        "android.hardware.wifi.supplicant@1.0"
        "android.hardware.wifi.supplicant@1.1"
        "android.hardware.wifi.supplicant@1.2"
        "android.hardware.wifi.supplicant@1.3"
        "android.hardware.wifi@1.0"
        "android.hardware.wifi@1.1"
        "libgmock"
        "libwifi-system"
        "libwifi-system-iface"
    ];
    test_suites = [
        "general-tests"
        "vts"
    ];
};

VtsHalWifiSupplicantP2pV1_2TargetTest = cc_test {
    name = "VtsHalWifiSupplicantP2pV1_2TargetTest";
    defaults = ["VtsHalTargetTestDefaults"];
    srcs = [
        "supplicant_p2p_iface_hidl_test.cpp"
    ];
    static_libs = [
        "VtsHalWifiV1_0TargetTestUtil"
        "VtsHalWifiSupplicantV1_0TargetTestUtil"
        "VtsHalWifiSupplicantV1_1TargetTestUtil"
        "VtsHalWifiSupplicantV1_2TargetTestUtil"
        "android.hardware.wifi.supplicant@1.0"
        "android.hardware.wifi.supplicant@1.1"
        "android.hardware.wifi.supplicant@1.2"
        "android.hardware.wifi@1.0"
        "android.hardware.wifi@1.1"
        "libgmock"
        "libwifi-system"
        "libwifi-system-iface"
    ];
    test_suites = [
        "general-tests"
        "vts"
    ];
};

in { inherit VtsHalWifiSupplicantP2pV1_2TargetTest VtsHalWifiSupplicantV1_2TargetTest VtsHalWifiSupplicantV1_2TargetTestUtil; }
