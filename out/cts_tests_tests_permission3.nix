{ android_test }:
let

#
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
#

CtsPermission3TestCases = android_test {
    name = "CtsPermission3TestCases";
    sdk_version = "test_current";
    srcs = [
        "src/android/permission3/cts/BasePermissionTest.kt"
        "src/android/permission3/cts/BaseUsePermissionTest.kt"
        "src/android/permission3/cts/PermissionEscalationTest.kt"
        "src/android/permission3/cts/PermissionGroupTest.kt"
        "src/android/permission3/cts/PermissionPolicyTest25.kt"
        "src/android/permission3/cts/PermissionReviewTest.kt"
        "src/android/permission3/cts/PermissionSplitTest.kt"
        "src/android/permission3/cts/PermissionTapjackingTest.kt"
        "src/android/permission3/cts/PermissionTest22.kt"
        "src/android/permission3/cts/PermissionTest23.kt"
        "src/android/permission3/cts/PermissionTest29.kt"
        "src/android/permission3/cts/PermissionTest30.kt"
        "src/android/permission3/cts/PermissionUpgradeTest.kt"
        "src/android/permission3/cts/StartForFutureActivity.kt"
    ];
    static_libs = [
        "kotlin-stdlib"
        "androidx.test.rules"
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
    ];
    data = [
        ":CtsPermissionEscalationAppNonRuntime"
        ":CtsPermissionEscalationAppRuntime"
        ":CtsPermissionPolicyApp25"
        ":CtsUsePermissionApp22"
        ":CtsUsePermissionApp22CalendarOnly"
        ":CtsUsePermissionApp23"
        ":CtsUsePermissionApp25"
        ":CtsUsePermissionApp26"
        ":CtsUsePermissionApp28"
        ":CtsUsePermissionApp29"
        ":CtsUsePermissionAppLatest"
        ":CtsUsePermissionAppLatestWithBackground"
        ":CtsUsePermissionAppWithOverlay"
    ];
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
        "mts"
    ];
};

in { inherit CtsPermission3TestCases; }
