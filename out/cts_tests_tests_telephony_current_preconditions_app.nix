{ android_test_helper_app }:
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

CtsTelephonyPreparerApp = android_test_helper_app {
    name = "CtsTelephonyPreparerApp";
    defaults = ["cts_defaults"];
    srcs = ["src/android/telephony/cts/preconditions/app/TelephonyPreparerAppTest.java"];
    static_libs = [
        "androidx.test.rules"
        "ctstestrunner-axt"
        "compatibility-device-util-axt"
        "compatibility-device-preconditions"
    ];
    libs = ["android.test.base.stubs"];
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "mts"
        "general-tests"
    ];
    sdk_version = "test_current";
};

in { inherit CtsTelephonyPreparerApp; }