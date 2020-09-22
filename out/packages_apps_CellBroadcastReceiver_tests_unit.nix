{ android_test, filegroup, java_defaults }:
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

CellBroadcastTestCommon = java_defaults {
    name = "CellBroadcastTestCommon";
    libs = [
        "android.test.runner"
        "telephony-common"
        "android.test.base"
        "android.test.mock"
    ];
    static_libs = [
        "androidx.test.rules"
        "androidx.test.espresso.core"
        "mockito-target-minus-junit4"
        "truth-prebuilt"
        "ub-uiautomator"
    ];
    #  Include all test java files.
    srcs = [":cellbroadcastreceiver-shared-srcs-test"];
    platform_apis = true;
};

#  in order to have our tests run on OEM devices, the test apk here includes
#  module code within it and filters out tests which require UI.
#  For the full test apk which does not run on OEM devices, see CellBroadcastReceiverUnitTests
CellBroadcastReceiverOemUnitTests = android_test {
    name = "CellBroadcastReceiverOemUnitTests";
    defaults = ["CellBroadcastTestCommon"];
    srcs = [":cellbroadcastreceiver-sources"];
    test_suites = [
        "device-tests"
        "mts"
    ];
    manifest = "AndroidManifest_OemTesting.xml";
    test_config = "AndroidTest_Oem.xml";
    resource_dirs = [
        "main-res"
    ];
    aaptflags = [
        "--custom-package com.android.cellbroadcastreceiver"
    ];
    static_libs = [
        "androidx.legacy_legacy-support-v4"
        "androidx.legacy_legacy-support-v13"
        "androidx.recyclerview_recyclerview"
        "androidx.preference_preference"
        "androidx.appcompat_appcompat"
        "androidx.legacy_legacy-preference-v14"
    ];
};

#  used to run mts coverage test
CellBroadcastReceiverUnitTests = android_test {
    name = "CellBroadcastReceiverUnitTests";
    certificate = "networkstack";
    defaults = ["CellBroadcastTestCommon"];
    instrumentation_for = "CellBroadcastApp";
    test_suites = [
        "device-tests"
        "mts"
    ];
    manifest = "AndroidManifest.xml";
    test_config = "AndroidTest.xml";
};

CellBroadcastReceiverPlatformUnitTests = android_test {
    name = "CellBroadcastReceiverPlatformUnitTests";
    certificate = "platform";
    defaults = ["CellBroadcastTestCommon"];
    instrumentation_for = "CellBroadcastAppPlatform";
    test_suites = ["device-tests"];
};

#  used to share src with unit test app
cellbroadcastreceiver-shared-srcs-test = filegroup {
    name = "cellbroadcastreceiver-shared-srcs-test";
    srcs = [
        "src/com/android/cellbroadcastreceiver/unit/CellBroadcastActivityTestCase.java"
        "src/com/android/cellbroadcastreceiver/unit/CellBroadcastAlertAudioTest.java"
        "src/com/android/cellbroadcastreceiver/unit/CellBroadcastAlertDialogTest.java"
        "src/com/android/cellbroadcastreceiver/unit/CellBroadcastAlertReminderTest.java"
        "src/com/android/cellbroadcastreceiver/unit/CellBroadcastAlertServiceTest.java"
        "src/com/android/cellbroadcastreceiver/unit/CellBroadcastBootupConfigTest.java"
        "src/com/android/cellbroadcastreceiver/unit/CellBroadcastChannelManagerTest.java"
        "src/com/android/cellbroadcastreceiver/unit/CellBroadcastConfigServiceTest.java"
        "src/com/android/cellbroadcastreceiver/unit/CellBroadcastContentProviderTest.java"
        "src/com/android/cellbroadcastreceiver/unit/CellBroadcastContentProviderTestable.java"
        "src/com/android/cellbroadcastreceiver/unit/CellBroadcastDatabaseHelperTest.java"
        "src/com/android/cellbroadcastreceiver/unit/CellBroadcastListActivityTest.java"
        "src/com/android/cellbroadcastreceiver/unit/CellBroadcastReceiverTest.java"
        "src/com/android/cellbroadcastreceiver/unit/CellBroadcastResourcesTest.java"
        "src/com/android/cellbroadcastreceiver/unit/CellBroadcastSearchIndexableProviderTest.java"
        "src/com/android/cellbroadcastreceiver/unit/CellBroadcastServiceTestCase.java"
        "src/com/android/cellbroadcastreceiver/unit/CellBroadcastSettingsTest.java"
        "src/com/android/cellbroadcastreceiver/unit/CellBroadcastTest.java"
        "src/com/android/cellbroadcastreceiver/unit/InstrumentationTest.java"
        "src/com/android/cellbroadcastreceiver/unit/MockedServiceManager.java"
    ];
};

in { inherit CellBroadcastReceiverOemUnitTests CellBroadcastReceiverPlatformUnitTests CellBroadcastReceiverUnitTests CellBroadcastTestCommon cellbroadcastreceiver-shared-srcs-test; }
