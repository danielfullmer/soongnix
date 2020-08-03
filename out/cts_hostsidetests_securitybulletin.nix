{ cc_defaults, java_test_host }:
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

CtsSecurityBulletinHostTestCases = java_test_host {
    name = "CtsSecurityBulletinHostTestCases";
    defaults = ["cts_defaults"];
    srcs = ["src/**/*.java"];
    java_resource_dirs = ["res"];
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts"
        "general-tests"
        "sts"
    ];
    #  Must match the package name in CtsTestCaseList.mk
    libs = [
        "cts-tradefed"
        "tradefed"
        "compatibility-host-util"
    ];
};

cts_hostsidetests_securitybulletin_defaults = cc_defaults {
    name = "cts_hostsidetests_securitybulletin_defaults";
    compile_multilib = "both";
    multilib = {
        lib32 = {
            suffix = "32";
        };
        lib64 = {
            suffix = "64";
        };
    };
    arch = {
        arm = {
            instruction_set = "arm";
        };
    };
    test_suites = [
        "cts"
        "vts"
        "sts"
    ];
};

in { inherit CtsSecurityBulletinHostTestCases cts_hostsidetests_securitybulletin_defaults; }
