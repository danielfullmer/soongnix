{ android_test }:
let

#  Copyright (C) 2017 The Android Open Source Project
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

EmergencyInfoUnitTests = android_test {
    name = "EmergencyInfoUnitTests";
    libs = ["android.test.runner"];
    static_libs = [
        "androidx.test.rules"
        "emergencyinfo-test-common"
        "androidx.test.espresso.core"
        "truth-prebuilt"
        "ub-uiautomator"
    ];
    srcs = [
        "src/com/android/emergency/edit/EditInfoActivityTest.java"
        "src/com/android/emergency/edit/EditMedicalInfoActivityTest.java"
        "src/com/android/emergency/preferences/EmergencyContactsPreferenceTest.java"
        "src/com/android/emergency/preferences/EmergencyListPreferenceTest.java"
        "src/com/android/emergency/view/ViewInfoActivityTest.java"
    ];
    platform_apis = true;
    test_suites = ["device-tests"];
    certificate = "platform";
    instrumentation_for = "EmergencyInfo";
};

in { inherit EmergencyInfoUnitTests; }
