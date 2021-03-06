{ android_test_helper_app }:
let

#  Copyright (C) 2015 The Android Open Source Project
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

CtsPackageInstallerApp = android_test_helper_app {
    name = "CtsPackageInstallerApp";
    defaults = ["cts_defaults"];
    srcs = [
        "src/com/android/cts/packageinstaller/BasePackageInstallTest.java"
        "src/com/android/cts/packageinstaller/ClearDeviceOwnerTest.java"
        "src/com/android/cts/packageinstaller/ManualPackageInstallTest.java"
        "src/com/android/cts/packageinstaller/SilentPackageInstallTest.java"
    ];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    static_libs = [
        "androidx.legacy_legacy-support-v4"
        "ctstestrunner-axt"
        "ub-uiautomator"
    ];
    sdk_version = "test_current";
    min_sdk_version = "21";
    #  tag this module as a cts test artifact
    test_suites = [
        "arcts"
        "cts"
        "vts"
        "general-tests"
    ];
};

in { inherit CtsPackageInstallerApp; }
