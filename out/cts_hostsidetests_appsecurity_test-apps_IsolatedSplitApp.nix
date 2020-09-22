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

CtsIsolatedSplitApp = android_test_helper_app {
    name = "CtsIsolatedSplitApp";
    defaults = ["cts_support_defaults"];
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    sdk_version = "current";
    #  Feature splits are dependent on this base, so it must be exported.
    export_package_resources = true;
    #  Make sure our test locale polish is not stripped.
    aapt_include_all_resources = true;
    static_libs = [
        "ctstestrunner-axt"
        "androidx.test.rules"
    ];
    srcs = [
        "src/com/android/cts/isolatedsplitapp/BaseActivity.java"
        "src/com/android/cts/isolatedsplitapp/BaseReceiver.java"
        "src/com/android/cts/isolatedsplitapp/SplitAppTest.java"
    ];
    #  Generate a locale split.
    package_splits = ["pl"];
};

in { inherit CtsIsolatedSplitApp; }