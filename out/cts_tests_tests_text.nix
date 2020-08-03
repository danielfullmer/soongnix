{ android_test }:
let

#  Copyright (C) 2008 The Android Open Source Project
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

CtsTextTestCases = android_test {
    name = "CtsTextTestCases";
    defaults = ["cts_defaults"];
    sdk_version = "test_current";

    srcs = [
        "src/**/*.java"
        "src/**/*.kt"
    ];

    static_libs = [
        "compatibility-device-util-axt"
        "ctsdeviceutillegacy-axt"
        "ctstestrunner-axt"
        "mockito-target-minus-junit4"
        "androidx.test.rules"
        "ub-uiautomator"
    ];

    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];

    test_suites = [
        "cts"
        "vts"
        "general-tests"
        "cts_instant"
        "mts"
    ];
};

in { inherit CtsTextTestCases; }
