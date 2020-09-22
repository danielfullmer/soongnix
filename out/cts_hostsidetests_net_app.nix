{ android_test_helper_app }:
let

#
#  Copyright (C) 2014 The Android Open Source Project
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

CtsHostsideNetworkTestsApp = android_test_helper_app {
    name = "CtsHostsideNetworkTestsApp";
    defaults = ["cts_support_defaults"];
    # sdk_version: "current",
    platform_apis = true;
    static_libs = [
        "androidx.test.rules"
        "androidx.test.ext.junit"
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
        "ub-uiautomator"
        "CtsHostsideNetworkTestsAidl"
    ];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    srcs = [
        "src/com/android/cts/net/hostside/AbstractAppIdleTestCase.java"
        "src/com/android/cts/net/hostside/AbstractBatterySaverModeTestCase.java"
        "src/com/android/cts/net/hostside/AbstractDozeModeTestCase.java"
        "src/com/android/cts/net/hostside/AbstractRestrictBackgroundNetworkTestCase.java"
        "src/com/android/cts/net/hostside/AppIdleMeteredTest.java"
        "src/com/android/cts/net/hostside/AppIdleNonMeteredTest.java"
        "src/com/android/cts/net/hostside/BatterySaverModeMeteredTest.java"
        "src/com/android/cts/net/hostside/BatterySaverModeNonMeteredTest.java"
        "src/com/android/cts/net/hostside/DataSaverModeTest.java"
        "src/com/android/cts/net/hostside/DozeModeMeteredTest.java"
        "src/com/android/cts/net/hostside/DozeModeNonMeteredTest.java"
        "src/com/android/cts/net/hostside/DumpOnFailureRule.java"
        "src/com/android/cts/net/hostside/MeterednessConfigurationRule.java"
        "src/com/android/cts/net/hostside/MixedModesTest.java"
        "src/com/android/cts/net/hostside/MyActivity.java"
        "src/com/android/cts/net/hostside/MyNotificationListenerService.java"
        "src/com/android/cts/net/hostside/MyServiceClient.java"
        "src/com/android/cts/net/hostside/MyVpnService.java"
        "src/com/android/cts/net/hostside/NetworkCallbackTest.java"
        "src/com/android/cts/net/hostside/NetworkPolicyTestRunner.java"
        "src/com/android/cts/net/hostside/NetworkPolicyTestUtils.java"
        "src/com/android/cts/net/hostside/PacketReflector.java"
        "src/com/android/cts/net/hostside/Property.java"
        "src/com/android/cts/net/hostside/RemoteSocketFactoryClient.java"
        "src/com/android/cts/net/hostside/RequiredProperties.java"
        "src/com/android/cts/net/hostside/RequiredPropertiesRule.java"
        "src/com/android/cts/net/hostside/VpnTest.java"
    ];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

in { inherit CtsHostsideNetworkTestsApp; }