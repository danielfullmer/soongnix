{ global_compat_config, java_test_host }:
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

CtsAppCompatHostTestCases = java_test_host {
    name = "CtsAppCompatHostTestCases";
    defaults = ["cts_defaults"];
    srcs = [
        "src/com/android/cts/appcompat/CompatChangesSystemApiTest.java"
        "src/com/android/cts/appcompat/CompatChangesValidConfigTest.java"
    ];
    libs = [
        "cts-tradefed"
        "tradefed"
        "guava"
    ];
    static_libs = ["CompatChangeGatingTestBase"];
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    java_resources = [":cts-global-compat-config"];
};

cts-global-compat-config = global_compat_config {
    name = "cts-global-compat-config";
    filename = "cts_all_compat_config.xml";
};

in { inherit CtsAppCompatHostTestCases cts-global-compat-config; }
