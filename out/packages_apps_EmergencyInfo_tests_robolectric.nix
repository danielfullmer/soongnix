{ android_robolectric_test }:
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

EmergencyInfoRoboTests = android_robolectric_test {
    name = "EmergencyInfoRoboTests";
    srcs = [
        "src/com/android/emergency/EmergencySearchIndexablesProviderTest.java"
        "src/com/android/emergency/edit/EditInfoFragmentTest.java"
        "src/com/android/emergency/preferences/ContactPreferenceTest.java"
        "src/com/android/emergency/preferences/EmergencyContactsPreferenceTest.java"
        "src/com/android/emergency/preferences/EmergencyEditTextPreferenceTest.java"
        "src/com/android/emergency/preferences/EmergencyListPreferenceTest.java"
        "src/com/android/emergency/preferences/EmergencyNamePreferenceTest.java"
        "src/com/android/emergency/util/PreferenceUtilsTest.java"
    ];
    java_resource_dirs = ["config"];
    static_libs = ["emergencyinfo-test-common"];
    instrumentation_for = "EmergencyInfo";
};

in { inherit EmergencyInfoRoboTests; }
