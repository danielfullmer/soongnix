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

CtsSimRestrictedApisTestCases = android_test {
    name = "CtsSimRestrictedApisTestCases";
    defaults = ["cts_defaults"];
    libs = [
        "telephony-common"
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    static_libs = [
        "ctstestrunner-axt"
        "compatibility-device-util-axt"
        "truth-prebuilt"
    ];
    srcs = ["src/android/telephony4/cts/SimRestrictedApisTest.java"];
    platform_apis = true;
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    certificate = ":android_telephony_cts_testkey";
};

in { inherit CtsSimRestrictedApisTestCases; }