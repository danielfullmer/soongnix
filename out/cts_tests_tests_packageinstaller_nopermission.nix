{ android_test, java_library_static }:
let

#  Copyright (C) 2018 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

CtsNoPermissionTestCasesBase = java_library_static {
    name = "CtsNoPermissionTestCasesBase";
    sdk_version = "test_current";

    srcs = ["src/android.packageinstaller.nopermission.cts/NoPermissionTests.kt"];

    static_libs = [
        "ub-uiautomator"
        "androidx.test.rules"
        "compatibility-device-util-axt"
        "androidx.legacy_legacy-support-v4"
        "platform-test-annotations"
    ];
};

CtsNoPermissionTestCases = android_test {
    name = "CtsNoPermissionTestCases";
    sdk_version = "test_current";

    static_libs = [
        "CtsNoPermissionTestCasesBase"
    ];

    test_suites = [
        "cts"
        "vts"
        "general-tests"
    ];
};

in { inherit CtsNoPermissionTestCases CtsNoPermissionTestCasesBase; }
