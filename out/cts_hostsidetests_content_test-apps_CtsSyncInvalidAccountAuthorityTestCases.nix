{ android_test_helper_app }:
let

#
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
#

CtsSyncInvalidAccountAuthorityTestCases = android_test_helper_app {
    name = "CtsSyncInvalidAccountAuthorityTestCases";
    defaults = ["cts_support_defaults"];
    static_libs = [
        "android-support-annotations"
        "androidx.test.rules"
        "ctstestrunner-axt"
    ];
    srcs = [
        "src/android/content/sync/cts/InvalidSyncAuthoritiesDeviceTest.java"
        "src/android/content/sync/cts/StubAuthenticator.java"
        "src/android/content/sync/cts/StubProvider.java"
    ];
    sdk_version = "current";
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    optimize = {
        enabled = false;
    };
    dex_preopt = {
        enabled = false;
    };
};

in { inherit CtsSyncInvalidAccountAuthorityTestCases; }
