{ android_test }:
let

#  Copyright (C) 2020 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

MtsTimeZoneDataTestCases = android_test {
    name = "MtsTimeZoneDataTestCases";

    defaults = ["cts_defaults"];
    static_libs = [
        "ctstestrunner-axt"
        "junit"
    ];
    srcs = [
        "src/java/android/tzdata/mts/TimeZoneRulesTest.java"
        "src/java/android/tzdata/mts/TimeZoneVersionTest.java"
    ];

    sdk_version = "current";
    libs = ["android.test.base.stubs"];

    #  Tag this module as an mts test artifact
    test_suites = [
        "general-tests"
        "mts"
    ];
    min_sdk_version = "29";
};

in { inherit MtsTimeZoneDataTestCases; }