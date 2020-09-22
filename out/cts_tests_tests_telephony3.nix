{ android_test }:
let

#  Copyright (C) 2018 The Android Open Source Project
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

CtsTelephony3TestCases = android_test {
    name = "CtsTelephony3TestCases";
    defaults = ["cts_defaults"];
    static_libs = ["ctstestrunner-axt"];
    srcs = ["src/android/telephony3/cts/TelephonyManagerTest.java"];
    #  The SDK version is set to 28 to test device identifier access for apps with
    #  the READ_PHONE_STATE permission targeting pre-Q.
    sdk_version = "28";
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    libs = ["android.test.runner.stubs"] ++ ["android.test.base.stubs"];
};

in { inherit CtsTelephony3TestCases; }
