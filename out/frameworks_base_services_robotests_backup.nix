{ android_app, android_robolectric_test }:
let

#  Copyright (C) 2018 The Android Open Source Project
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

# ##################################################################
#  BackupFrameworksServicesLib app just for Robolectric test target      #
# ##################################################################
BackupFrameworksServicesLib = android_app {
    name = "BackupFrameworksServicesLib";
    platform_apis = true;

    privileged = true;

    static_libs = [
        "bmgr"
        "bu"
        "services.backup"
        "services.core"
        "services.net"
    ];

    libs = ["android.net.ipsec.ike.stubs.system"];
};

# ##################################################################
#  BackupFrameworksServicesLib Robolectric test target.                  #
# ##################################################################
BackupFrameworksServicesRoboTests = android_robolectric_test {
    name = "BackupFrameworksServicesRoboTests";
    srcs = [
        "src/android/app/backup/BackupUtilsTest.java"
        "src/android/app/backup/ForwardingBackupAgent.java"
        "src/com/android/commands/bmgr/BmgrTest.java"
        "src/com/android/commands/bu/AdbBackupTest.java"
        "src/com/android/server/backup/BackupAgentTimeoutParametersTest.java"
        "src/com/android/server/backup/BackupManagerConstantsTest.java"
        "src/com/android/server/backup/BackupManagerServiceRoboTest.java"
        "src/com/android/server/backup/FullBackupJobTest.java"
        "src/com/android/server/backup/JobIdManagerTest.java"
        "src/com/android/server/backup/KeyValueBackupJobTest.java"
        "src/com/android/server/backup/TransportManagerTest.java"
        "src/com/android/server/backup/UserBackupManagerServiceTest.java"
        "src/com/android/server/backup/fullbackup/AppMetadataBackupWriterTest.java"
        "src/com/android/server/backup/internal/PerformInitializeTaskTest.java"
        "src/com/android/server/backup/internal/SetupObserverTest.java"
        "src/com/android/server/backup/keyvalue/AgentExceptionTest.java"
        "src/com/android/server/backup/keyvalue/BackupExceptionTest.java"
        "src/com/android/server/backup/keyvalue/KeyValueBackupReporterTest.java"
        "src/com/android/server/backup/keyvalue/KeyValueBackupTaskTest.java"
        "src/com/android/server/backup/keyvalue/TaskExceptionTest.java"
        "src/com/android/server/backup/remote/FutureBackupCallbackTest.java"
        "src/com/android/server/backup/remote/RemoteCallTest.java"
        "src/com/android/server/backup/remote/RemoteResultTest.java"
        "src/com/android/server/backup/remote/ServiceBackupCallbackTest.java"
        "src/com/android/server/backup/restore/ActiveRestoreSessionTest.java"
        "src/com/android/server/backup/testing/BackupManagerServiceTestUtils.java"
        "src/com/android/server/backup/testing/PackageData.java"
        "src/com/android/server/backup/testing/TestUtils.java"
        "src/com/android/server/backup/testing/TransportData.java"
        "src/com/android/server/backup/testing/TransportTestUtils.java"
        "src/com/android/server/backup/testing/Utils.java"
        "src/com/android/server/backup/transport/TransportClientManagerTest.java"
        "src/com/android/server/backup/transport/TransportClientTest.java"
        "src/com/android/server/backup/transport/TransportStatsTest.java"
        ":FrameworksServicesRoboShadows"
    ];

    java_resource_dirs = ["config"];

    #  Include the testing libraries
    libs = [
        "mockito-robolectric-prebuilt"
        "platform-test-annotations"
        "testng"
        "truth-prebuilt"
    ];

    instrumentation_for = "BackupFrameworksServicesLib";

};

in { inherit BackupFrameworksServicesLib BackupFrameworksServicesRoboTests; }
