{ java_test }:
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

CtsJdwpTestCases = java_test {

    name = "CtsJdwpTestCases";

    static_libs = ["apache-harmony-jdwp-tests"];

    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];

    dex_preopt = {
        enabled = false;
    };
    optimize = {
        enabled = false;
    };
    data = [":cts-dalvik-device-test-runner"];
};

in { inherit CtsJdwpTestCases; }
