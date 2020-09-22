{ java_test_host }:
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

CtsMonkeyTestCases = java_test_host {
    name = "CtsMonkeyTestCases";
    defaults = ["cts_defaults"];
    srcs = [
        "src/com/android/cts/monkey/AbstractMonkeyTest.java"
        "src/com/android/cts/monkey/CategoryTest.java"
        "src/com/android/cts/monkey/MonkeyTest.java"
        "src/com/android/cts/monkey/PackageTest.java"
        "src/com/android/cts/monkey/SeedTest.java"
        "src/com/android/cts/monkey/VerbosityTest.java"
    ];
    libs = [
        "cts-tradefed"
        "tradefed"
        "compatibility-host-util"
    ];
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

in { inherit CtsMonkeyTestCases; }
