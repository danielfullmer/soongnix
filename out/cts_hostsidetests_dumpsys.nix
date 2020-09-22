{ java_test_host }:
let

#  Copyright (C) 2014 The Android Open Source Project
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

CtsDumpsysHostTestCases = java_test_host {
    name = "CtsDumpsysHostTestCases";
    defaults = ["cts_defaults"];
    srcs = [
        "src/android/dumpsys/cts/BaseDumpsysTest.java"
        "src/android/dumpsys/cts/BatteryStatsDumpsysTest.java"
        "src/android/dumpsys/cts/ProcessStatsDumpsysTest.java"
        "src/android/dumpsys/cts/StoragedDumpsysTest.java"
    ];
    #  Must match the package name in CtsTestCaseList.mk
    libs = [
        "cts-tradefed"
        "tradefed"
        "truth-prebuilt"
    ];
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

in { inherit CtsDumpsysHostTestCases; }
