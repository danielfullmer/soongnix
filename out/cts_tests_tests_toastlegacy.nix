{ android_test }:
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

CtsToastLegacyTestCases = android_test {
    name = "CtsToastLegacyTestCases";
    defaults = ["cts_defaults"];
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    static_libs = [
        "ctstestrunner-axt"
        "androidx.test.rules"
    ];
    srcs = [
        "src/android/widget/toast/cts/legacy/ToastActivity.java"
        "src/android/widget/toast/cts/legacy/ToastTest.java"
        ":CtsToastBaseToastTest"
    ];
    sdk_version = "current";
    min_sdk_version = "25";
};

in { inherit CtsToastLegacyTestCases; }