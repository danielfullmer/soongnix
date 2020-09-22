{ android_test }:
let

#  Copyright (C) 2020 The Android Open Source Project
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

CtsGwpAsanTestCases = android_test {
    name = "CtsGwpAsanTestCases";
    defaults = ["cts_defaults"];
    compile_multilib = "both";
    #  When built, explicitly put it in the data partition.
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    static_libs = [
        "ctstestrunner-axt"
        "androidx.test.rules"
        "androidx.test.core"
        "androidx.test.ext.junit"
    ];
    srcs = [
        "src/android/gwpasan/GwpAsanDefaultActivity.java"
        "src/android/gwpasan/GwpAsanDefaultService.java"
        "src/android/gwpasan/GwpAsanDisabledActivity.java"
        "src/android/gwpasan/GwpAsanDisabledService.java"
        "src/android/gwpasan/GwpAsanEnabledActivity.java"
        "src/android/gwpasan/GwpAsanEnabledService.java"
        "src/android/gwpasan/GwpAsanTestActivity.java"
        "src/android/gwpasan/Utils.java"
        "src/android/gwpasan/cts/GwpAsanActivityTest.java"
        "src/android/gwpasan/cts/GwpAsanServiceTest.java"
    ];
    sdk_version = "current";
    use_embedded_native_libs = false;
};

in { inherit CtsGwpAsanTestCases; }
