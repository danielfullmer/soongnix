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

CtsUiRenderingTestCases = android_test {
    name = "CtsUiRenderingTestCases";
    sdk_version = "test_current";

    srcs = [
        "src/**/*.java"
        "src/**/*.kt"
    ];

    static_libs = [
        "compatibility-device-util-axt"
        "ctsdeviceutillegacy-axt"
        "mockito-target-minus-junit4"
        "androidx.test.rules"
        "kotlin-test"
    ];

    libs = ["android.test.runner.stubs"];

    test_suites = [
        "cts"
        "vts"
        "general-tests"
    ];
};

in { inherit CtsUiRenderingTestCases; }
