{ android_test }:
let

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

WifiTrackerLibTests = android_test {
    name = "WifiTrackerLibTests";
    srcs = [
        "src/com/android/wifitrackerlib/NetworkDetailsTrackerTest.java"
        "src/com/android/wifitrackerlib/PasspointWifiEntryTest.java"
        "src/com/android/wifitrackerlib/SavedNetworkTrackerTest.java"
        "src/com/android/wifitrackerlib/ScanResultUpdaterTest.java"
        "src/com/android/wifitrackerlib/StandardNetworkDetailsTrackerTest.java"
        "src/com/android/wifitrackerlib/StandardWifiEntryTest.java"
        "src/com/android/wifitrackerlib/TestUtils.java"
        "src/com/android/wifitrackerlib/UtilsTest.java"
        "src/com/android/wifitrackerlib/WifiPickerTrackerTest.java"
        "src/com/android/wifitrackerlib/shadows/ShadowSystem.java"
    ];

    static_libs = [
        "androidx.test.rules"
        "frameworks-base-testutils"
        "mockito-target-minus-junit4"
        "truth-prebuilt"
        "WifiTrackerLib"
        "Robolectric_all-target"
    ];

    libs = [
        "android.test.mock"
    ];

    platform_apis = true;
};

in { inherit WifiTrackerLibTests; }
