{ android_test }:
let

#  Copyright (C) 2018 The Android Open Source Project
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

CtsPackageInstallerTapjackingTestCases = android_test {
    name = "CtsPackageInstallerTapjackingTestCases";
    defaults = ["cts_defaults"];
    static_libs = [
        "ub-uiautomator"
        "androidx.test.rules"
        "compatibility-device-util-axt"
        "platform-test-annotations"
    ];
    resource_dirs = ["res"];
    srcs = [
        "src/android/packageinstaller/tapjacking/cts/OverlayingActivity.java"
        "src/android/packageinstaller/tapjacking/cts/TapjackingTest.java"
    ];
    sdk_version = "test_current";
    #  Tag this module as test artifact for cts
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

in { inherit CtsPackageInstallerTapjackingTestCases; }
