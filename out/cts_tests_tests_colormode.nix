{ android_test }:
let

#  Copyright (C) 2011 The Android Open Source Project
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

CtsColorModeTestCases = android_test {
    name = "CtsColorModeTestCases";
    defaults = ["cts_defaults"];
    dex_preopt = {
        enabled = false;
    };
    optimize = {
        enabled = false;
    };
    static_libs = ["ctstestrunner-axt"];
    srcs = [
        "src/android/colormode/AttributeWideColorModeActivity.java"
        "src/android/colormode/DefaultColorModeActivity.java"
        "src/android/colormode/WideColorModeActivity.java"
        "src/android/colormode/cts/AttributeWideColorModeTest.java"
        "src/android/colormode/cts/DefaultColorModeTest.java"
        "src/android/colormode/cts/WideColorModeTest.java"
    ];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    sdk_version = "current";
};

in { inherit CtsColorModeTestCases; }
