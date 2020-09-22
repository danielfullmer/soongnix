{ android_test_helper_app }:
let

#
#  Copyright (C) 2016 The Android Open Source Project
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

CtsEphemeralTestsEphemeralApp1 = android_test_helper_app {
    name = "CtsEphemeralTestsEphemeralApp1";
    defaults = ["cts_support_defaults"];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    static_libs = [
        "cts-aia-util"
        "androidx.test.rules"
        "ctsdeviceutillegacy-axt"
        "ctstestrunner-axt"
        "testng"
    ];
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    srcs = [
        "src/com/android/cts/ephemeralapp1/ClientTest.java"
        "src/com/android/cts/ephemeralapp1/EphemeralActivity.java"
        "src/com/android/cts/ephemeralapp1/EphemeralActivity2.java"
        "src/com/android/cts/ephemeralapp1/EphemeralActivity3.java"
        "src/com/android/cts/ephemeralapp1/EphemeralProvider.java"
        "src/com/android/cts/ephemeralapp1/EphemeralResult.java"
        "src/com/android/cts/ephemeralapp1/EphemeralService.java"
        "src/com/android/cts/ephemeralapp1/SearchSuggestionProvider.java"
        "src/com/android/cts/ephemeralapp1/SomeService.java"
        "src/com/android/cts/ephemeralapp1/StartForResultActivity.java"
        "src/com/android/cts/ephemeralapp1/WebViewTest.java"
        "src/com/android/cts/ephemeralapp1/WebViewTestActivity.java"
    ];
    resource_dirs = ["res"];
    platform_apis = true;
    optimize = {
        enabled = false;
    };
    dex_preopt = {
        enabled = false;
    };
    min_sdk_version = "25";
};

in { inherit CtsEphemeralTestsEphemeralApp1; }
