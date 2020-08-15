{ android_test }:
let

#  Copyright (C) 2019 The Android Open Source Project
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

CtsViewTestCasesSdk28 = android_test {
    name = "CtsViewTestCasesSdk28";
    defaults = ["cts_defaults"];

    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts"
        "general-tests"
        "cts_instant"
    ];

    compile_multilib = "both";

    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];

    static_libs = [
        "androidx.test.rules"
        "ctstestrunner-axt"
        "platform-test-annotations"
    ];

    srcs = [
        "src/android/view/cts/sdk28/ViewGroupTest.java"
    ];

    sdk_version = "28";

};

in { inherit CtsViewTestCasesSdk28; }
