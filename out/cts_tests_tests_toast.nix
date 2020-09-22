{ android_test, filegroup }:
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

CtsToastTestCases = android_test {
    name = "CtsToastTestCases";
    defaults = ["cts_defaults"];
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    static_libs = [
        "androidx.test.rules"
        "ctstestrunner-axt"
    ];
    srcs = [
        "src/android/widget/toast/cts/BaseToastTest.java"
        "src/android/widget/toast/cts/LegacyToastTest.java"
    ];
    sdk_version = "current";
    min_sdk_version = "25";
};

CtsToastBaseToastTest = filegroup {
    name = "CtsToastBaseToastTest";
    srcs = ["src/android/widget/toast/cts/BaseToastTest.java"];
};

in { inherit CtsToastBaseToastTest CtsToastTestCases; }
