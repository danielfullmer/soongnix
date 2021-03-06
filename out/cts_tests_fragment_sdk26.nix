{ android_test }:
let

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

CtsFragmentTestCasesSdk26 = android_test {
    name = "CtsFragmentTestCasesSdk26";
    defaults = ["cts_defaults"];

    optimize = {
        enabled = false;
    };

    static_libs = ["androidx.test.rules"];

    srcs = [
        "src/android/fragment/cts/sdk26/FragmentManagerNonConfigTest.java"
        "src/android/fragment/cts/sdk26/NonConfigOnStopActivity.java"
    ];

    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts"
        "general-tests"
        "cts_instant"
    ];

    sdk_version = "26";
};

in { inherit CtsFragmentTestCasesSdk26; }
