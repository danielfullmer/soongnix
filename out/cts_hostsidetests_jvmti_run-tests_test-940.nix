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

CtsJvmtiRunTest940HostTestCases = java_test_host {
    name = "CtsJvmtiRunTest940HostTestCases";
    static_libs = ["CtsJvmtiHostTestBase"];
    jarjar_rules = "jarjar-rules.txt";
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    data = [":CtsJvmtiRunTest940DeviceApp"];
};

in { inherit CtsJvmtiRunTest940HostTestCases; }
