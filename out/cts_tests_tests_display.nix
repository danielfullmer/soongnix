{ android_test }:
let

#  Copyright (C) 2012 The Android Open Source Project
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

CtsDisplayTestCases = android_test {
    name = "CtsDisplayTestCases";
    defaults = ["cts_defaults"];
    dex_preopt = {
        enabled = false;
    };
    optimize = {
        enabled = false;
    };
    srcs = [
        "src/android/display/cts/BrightnessTest.java"
        "src/android/display/cts/DisplayTest.java"
        "src/android/display/cts/DisplayTestActivity.java"
        "src/android/display/cts/ScreenOnActivity.java"
        "src/android/display/cts/VirtualDisplayTest.java"
    ];
    static_libs = ["androidx.test.rules"];
    libs = ["android.test.base.stubs"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    sdk_version = "test_current";
};

in { inherit CtsDisplayTestCases; }
