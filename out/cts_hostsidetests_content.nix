{ java_test_host }:
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

CtsSyncContentHostTestCases = java_test_host {
    name = "CtsSyncContentHostTestCases";
    defaults = ["cts_defaults"];
    srcs = [
        "src/android/content/cts/BaseContextCrossProfileTest.java"
        "src/android/content/cts/ContextCrossProfileHostTest.java"
        "src/android/content/cts/InvalidSyncAuthoritiesHostTest.java"
        ":CtsHostsideTestsAppSecurityUtil"
    ];
    libs = [
        "cts-tradefed"
        "tradefed"
        "compatibility-host-util"
        "device-policy-log-verifier-util"
    ];
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

in { inherit CtsSyncContentHostTestCases; }