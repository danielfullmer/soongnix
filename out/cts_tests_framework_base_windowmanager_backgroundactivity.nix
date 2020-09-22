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

CtsActivityManagerBackgroundActivityTestCases = android_test {
    name = "CtsActivityManagerBackgroundActivityTestCases";
    defaults = ["cts_defaults"];

    #  TODO(b/129909356): Consolidate this to CtsWindowManagerDeviceTestCases.apk

    srcs = ["src/android/server/wm/BackgroundActivityLaunchTest.java"];

    sdk_version = "test_current";

    static_libs = [
        "androidx.test.rules"
        "cts-wm-util"
        "cts-wm-app-base"
        "cts-core-test-runner-axt"
        "cts-background-activity-common"
    ];

    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

in { inherit CtsActivityManagerBackgroundActivityTestCases; }
