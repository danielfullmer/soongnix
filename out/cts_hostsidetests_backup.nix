{ java_test_host }:
let

#  Copyright (C) 2017 The Android Open Source Project
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

CtsBackupHostTestCases = java_test_host {
    name = "CtsBackupHostTestCases";
    srcs = [
        "src/android/cts/backup/AllowBackupHostSideTest.java"
        "src/android/cts/backup/AutoRestoreHostSideTest.java"
        "src/android/cts/backup/BackupPreparer.java"
        "src/android/cts/backup/BackupTransportHostSideTest.java"
        "src/android/cts/backup/BackupWakelockHostSideTest.java"
        "src/android/cts/backup/BaseBackupHostSideTest.java"
        "src/android/cts/backup/BaseMultiUserBackupHostSideTest.java"
        "src/android/cts/backup/FullBackupOnlyHostSideTest.java"
        "src/android/cts/backup/FullbackupRulesHostSideTest.java"
        "src/android/cts/backup/KeyValueBackupRestoreHostSideTest.java"
        "src/android/cts/backup/MultiUserBackupStateTest.java"
        "src/android/cts/backup/OtherSoundsSettingsHostSideTest.java"
        "src/android/cts/backup/ParallelUserBackupRestoreHostSideTest.java"
        "src/android/cts/backup/PreservedSettingsRestoreHostSideTest.java"
        "src/android/cts/backup/ProfileFullBackupRestoreHostSideTest.java"
        "src/android/cts/backup/ProfileKeyValueBackupRestoreHostSideTest.java"
        "src/android/cts/backup/ProfileScheduledJobHostSideTest.java"
        "src/android/cts/backup/ProfileSerialNumberHostSideTest.java"
        "src/android/cts/backup/RestoreAnyVersionHostSideTest.java"
        "src/android/cts/backup/RestoreSessionHostSideTest.java"
        "src/android/cts/backup/SuccessNotificationHostSideTest.java"
        "src/android/cts/backup/SyncAdapterSettingsHostSideTest.java"
    ];
    #  tag this module as a cts test artifact
    test_suites = [
        "arcts"
        "cts"
        "vts10"
        "general-tests"
    ];
    libs = [
        "cts-tradefed"
        "tradefed"
        "compatibility-host-util"
        "truth-prebuilt"
    ];
};

in { inherit CtsBackupHostTestCases; }
