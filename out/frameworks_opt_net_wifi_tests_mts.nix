{ android_test }:
let

#  Copyright (C) 2020 The Android Open Source Project
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

#  Wifi MTS-only tests i.e. not part of CTS or GTS
#  Used to test functionality that is only guaranteed to be implemented in the Wifi Mainline module,
#  but is not required if the Wifi Mainline module is not present on the device.
MtsWifiTestCases = android_test {
    name = "MtsWifiTestCases";
    defaults = ["cts_defaults"];

    libs = [
        "org.apache.http.legacy"
        "android.test.base.stubs"
    ];

    srcs = [
        "src/android/net/wifi/mts/StreamReader.java"
        "src/android/net/wifi/mts/WifiDumpsysMetricsTest.java"
        "src/android/net/wifi/mts/WifiFeature.java"
    ];

    static_libs = [
        #  for ShellIdentityUtils, builds against test_current
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
        "ctstestserver"
        "junit"
        "junit-params"
        "truth-prebuilt"
        #  for Wifi protos, builds against system_current
        "wifi-nano-protos"
        #  for AndroidJUnit4
        "androidx.test.ext.junit"
        "androidx.test.runner"
    ];

    #  need access to system_current and test_current, so needs to be platform_apis: true
    platform_apis = true;

    test_suites = ["mts"];
    test_config = "AndroidTest.xml";
};

in { inherit MtsWifiTestCases; }
