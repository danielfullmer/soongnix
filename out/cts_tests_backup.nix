{ android_test }:
let

#  Copyright (C) 2019 The Android Open Source Project
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

CtsBackupTestCases = android_test {
    name = "CtsBackupTestCases";
    defaults = ["cts_defaults"];
    compile_multilib = "both";
    libs = [
        "android.test.runner.stubs"
        "org.apache.http.legacy"
        "android.test.base.stubs"
    ];
    static_libs = [
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
        "ctstestserver"
        "mockito-target-minus-junit4"
        "permission-test-util-lib"
        "testng"
    ];
    host_required = ["CtsBackupHostTestCases"];
    srcs = [
        "src/android/backup/cts/AgentBindingTest.java"
        "src/android/backup/cts/BaseBackupCtsTest.java"
        "src/android/backup/cts/FullBackupLifecycleTest.java"
        "src/android/backup/cts/FullBackupQuotaTest.java"
        "src/android/backup/cts/KeyValueLifecycleTest.java"
        "src/android/backup/cts/KeyValueQuotaTest.java"
        "src/android/backup/cts/PermissionTest.java"
    ];
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    sdk_version = "test_current";
};

in { inherit CtsBackupTestCases; }
