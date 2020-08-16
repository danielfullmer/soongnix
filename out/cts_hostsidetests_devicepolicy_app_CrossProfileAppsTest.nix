{ android_test_helper_app }:
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

CtsCrossProfileAppsTests = android_test_helper_app {
    name = "CtsCrossProfileAppsTests";
    defaults = ["cts_defaults"];
    srcs = [
        "src/com/android/cts/crossprofileappstest/CrossProfileAppsNonTargetUserTest.java"
        "src/com/android/cts/crossprofileappstest/CrossProfileAppsStartActivityTest.java"
        "src/com/android/cts/crossprofileappstest/CrossProfileAppsTargetUserTest.java"
        "src/com/android/cts/crossprofileappstest/MainActivity.java"
        "src/com/android/cts/crossprofileappstest/NonExportedActivity.java"
        "src/com/android/cts/crossprofileappstest/NonMainActivity.java"
    ];
    libs = ["junit"];
    static_libs = [
        "androidx.legacy_legacy-support-v4"
        "ctstestrunner-axt"
        "compatibility-device-util-axt"
        "androidx.test.rules"
        "truth-prebuilt"
        "ub-uiautomator"
    ];
    min_sdk_version = "21";
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts"
        "general-tests"
    ];
};

in { inherit CtsCrossProfileAppsTests; }
