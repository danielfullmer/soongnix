{ android_test_helper_app, java_test_host }:
let

#  Copyright (C) 2020 The Android Open Source Project
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

StagedInstallInternalTestApp = android_test_helper_app {
    name = "StagedInstallInternalTestApp";
    manifest = "app/AndroidManifest.xml";
    srcs = ["app/src/com/android/tests/stagedinstallinternal/StagedInstallInternalTest.java"];
    static_libs = [
        "androidx.test.rules"
        "cts-install-lib"
    ];
    test_suites = ["general-tests"];
};

StagedInstallInternalTest = java_test_host {
    name = "StagedInstallInternalTest";
    srcs = ["src/com/android/tests/stagedinstallinternal/host/StagedInstallInternalTest.java"];
    libs = ["tradefed"];
    static_libs = [
        "testng"
        "compatibility-tradefed"
    ];
    test_suites = ["general-tests"];
    test_config = "StagedInstallInternalTest.xml";
};

in { inherit StagedInstallInternalTest StagedInstallInternalTestApp; }
