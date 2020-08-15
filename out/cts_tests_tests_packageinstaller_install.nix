{ android_test }:
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

CtsPackageInstallTestCases = android_test {
    name = "CtsPackageInstallTestCases";
    sdk_version = "test_current";

    srcs = [
        "src/android/packageinstaller/install/cts/ExternalSourcesInstantAppsTest.kt"
        "src/android/packageinstaller/install/cts/ExternalSourcesTest.kt"
        "src/android/packageinstaller/install/cts/InstallConfirmDialogStarter.kt"
        "src/android/packageinstaller/install/cts/IntentTest.kt"
        "src/android/packageinstaller/install/cts/PackageInstallerTestBase.kt"
        "src/android/packageinstaller/install/cts/SessionTest.kt"
        "src/android/packageinstaller/install/cts/SessionTestInstant.kt"
    ];

    static_libs = [
        "ub-uiautomator"
        "androidx.test.rules"
        "compatibility-device-util-axt"
        "androidx.legacy_legacy-support-v4"
        "platform-test-annotations"
    ];

    test_suites = [
        "cts"
        "vts"
        "general-tests"
    ];
};

in { inherit CtsPackageInstallTestCases; }
