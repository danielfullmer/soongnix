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
    srcs = [
        "src/android/security/cts/AdbUtils.java"
        "src/android/security/cts/HostsideMainlineModuleDetector.java"
        "src/android/security/cts/HostsideOomCatcher.java"
        "src/android/security/cts/LaunchSomeWhere.java"
        "src/android/security/cts/Poc16_02.java"
        "src/android/security/cts/Poc16_04.java"
        "src/android/security/cts/Poc16_05.java"
        "src/android/security/cts/Poc16_06.java"
        "src/android/security/cts/Poc16_07.java"
        "src/android/security/cts/Poc16_09.java"
        "src/android/security/cts/Poc16_10.java"
        "src/android/security/cts/Poc16_11.java"
        "src/android/security/cts/Poc16_12.java"
        "src/android/security/cts/Poc17_01.java"
        "src/android/security/cts/Poc17_02.java"
        "src/android/security/cts/Poc17_03.java"
        "src/android/security/cts/Poc17_04.java"
        "src/android/security/cts/Poc17_05.java"
        "src/android/security/cts/Poc17_06.java"
        "src/android/security/cts/Poc17_07.java"
        "src/android/security/cts/Poc17_09.java"
        "src/android/security/cts/Poc17_11.java"
        "src/android/security/cts/Poc17_12.java"
        "src/android/security/cts/Poc18_02.java"
        "src/android/security/cts/Poc18_03.java"
        "src/android/security/cts/Poc18_04.java"
        "src/android/security/cts/Poc18_05.java"
        "src/android/security/cts/Poc18_06.java"
        "src/android/security/cts/Poc18_07.java"
        "src/android/security/cts/Poc18_10.java"
        "src/android/security/cts/Poc18_11.java"
        "src/android/security/cts/Poc19_03.java"
        "src/android/security/cts/Poc19_05.java"
        "src/android/security/cts/Poc19_06.java"
        "src/android/security/cts/Poc19_08.java"
        "src/android/security/cts/Poc19_11.java"
        "src/android/security/cts/RegexUtils.java"
        "src/android/security/cts/SecurityTestCase.java"
        "src/android/security/cts/TestMedia.java"
    ];
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
