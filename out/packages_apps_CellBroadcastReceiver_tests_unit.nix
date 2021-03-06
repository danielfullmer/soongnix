{ android_test }:
let

#  Copyright 2016, The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

CellBroadcastReceiverUnitTests = android_test {
    name = "CellBroadcastReceiverUnitTests";
    certificate = "platform";
    libs = [
        "android.test.runner"
        "telephony-common"
        "android.test.base"
    ];
    static_libs = [
        "androidx.test.rules"
        "androidx.test.espresso.core"
        "mockito-target-minus-junit4"
        "truth-prebuilt"
        "ub-uiautomator"
    ];
    #  Include all test java files.
    srcs = [
        "src/com/android/cellbroadcastreceiver/CellBroadcastActivityTestCase.java"
        "src/com/android/cellbroadcastreceiver/CellBroadcastAlertDialogTest.java"
        "src/com/android/cellbroadcastreceiver/CellBroadcastAlertServiceTest.java"
        "src/com/android/cellbroadcastreceiver/CellBroadcastBootupConfigTest.java"
        "src/com/android/cellbroadcastreceiver/CellBroadcastChannelManagerTest.java"
        "src/com/android/cellbroadcastreceiver/CellBroadcastConfigServiceTest.java"
        "src/com/android/cellbroadcastreceiver/CellBroadcastServiceTestCase.java"
        "src/com/android/cellbroadcastreceiver/CellBroadcastSettingsTest.java"
        "src/com/android/cellbroadcastreceiver/CellBroadcastTest.java"
        "src/com/android/cellbroadcastreceiver/MockedServiceManager.java"
    ];
    platform_apis = true;
    instrumentation_for = "CellBroadcastReceiver";
    test_suites = ["device-tests"];
};

in { inherit CellBroadcastReceiverUnitTests; }
