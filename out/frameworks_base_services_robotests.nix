{ android_app, android_robolectric_test, filegroup }:
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

# ##################################################################
#  FrameworksServicesLib app just for Robolectric test target      #
# ##################################################################

FrameworksServicesLib = android_app {
    name = "FrameworksServicesLib";
    platform_apis = true;

    privileged = true;

    static_libs = [
        "services.core"
        "services.net"
    ];

    libs = ["android.net.ipsec.ike.stubs.system"];
};

# ##################################################################
#  FrameworksServicesLib Robolectric test target.                  #
# ##################################################################
FrameworksServicesRoboTests = android_robolectric_test {
    name = "FrameworksServicesRoboTests";

    srcs = [
        "src/com/android/server/location/LocationRequestStatisticsTest.java"
        "src/com/android/server/location/gnss/GnssAntennaInfoProviderTest.java"
        "src/com/android/server/location/gnss/GnssBatchingProviderTest.java"
        "src/com/android/server/location/gnss/GnssGeofenceProviderTest.java"
        "src/com/android/server/location/gnss/GnssMeasurementsProviderTest.java"
        "src/com/android/server/location/gnss/GnssNavigationMessageProviderTest.java"
        "src/com/android/server/location/gnss/GnssPositionModeTest.java"
        "src/com/android/server/location/gnss/GnssSatelliteBlacklistHelperTest.java"
        "src/com/android/server/location/gnss/NtpTimeHelperTest.java"
        "src/com/android/server/pm/CrossProfileAppsServiceImplRoboTest.java"
        "src/com/android/server/testing/shadows/FrameworkShadowLooper.java"
        "src/com/android/server/testing/shadows/ShadowAppBackupUtils.java"
        "src/com/android/server/testing/shadows/ShadowApplicationPackageManager.java"
        "src/com/android/server/testing/shadows/ShadowBackupDataInput.java"
        "src/com/android/server/testing/shadows/ShadowBackupDataOutput.java"
        "src/com/android/server/testing/shadows/ShadowBinder.java"
        "src/com/android/server/testing/shadows/ShadowCloseGuard.java"
        "src/com/android/server/testing/shadows/ShadowEnvironment.java"
        "src/com/android/server/testing/shadows/ShadowEventLog.java"
        "src/com/android/server/testing/shadows/ShadowFullBackup.java"
        "src/com/android/server/testing/shadows/ShadowKeyValueBackupJob.java"
        "src/com/android/server/testing/shadows/ShadowKeyValueBackupTask.java"
        "src/com/android/server/testing/shadows/ShadowPerformUnifiedRestoreTask.java"
        "src/com/android/server/testing/shadows/ShadowSlog.java"
        "src/com/android/server/testing/shadows/ShadowSystemServiceRegistry.java"
        "src/com/android/server/testing/shadows/ShadowUserManager.java"
    ];

    java_resource_dirs = ["config"];

    #  Include the testing libraries
    libs = [
        "platform-test-annotations"
        "testng"
    ];
    static_libs = [
        "androidx.test.ext.truth"
    ];

    instrumentation_for = "FrameworksServicesLib";
};

FrameworksServicesRoboShadows = filegroup {
    name = "FrameworksServicesRoboShadows";
    srcs = [
        "src/com/android/server/testing/shadows/FrameworkShadowLooper.java"
        "src/com/android/server/testing/shadows/ShadowAppBackupUtils.java"
        "src/com/android/server/testing/shadows/ShadowApplicationPackageManager.java"
        "src/com/android/server/testing/shadows/ShadowBackupDataInput.java"
        "src/com/android/server/testing/shadows/ShadowBackupDataOutput.java"
        "src/com/android/server/testing/shadows/ShadowBinder.java"
        "src/com/android/server/testing/shadows/ShadowCloseGuard.java"
        "src/com/android/server/testing/shadows/ShadowEnvironment.java"
        "src/com/android/server/testing/shadows/ShadowEventLog.java"
        "src/com/android/server/testing/shadows/ShadowFullBackup.java"
        "src/com/android/server/testing/shadows/ShadowKeyValueBackupJob.java"
        "src/com/android/server/testing/shadows/ShadowKeyValueBackupTask.java"
        "src/com/android/server/testing/shadows/ShadowPerformUnifiedRestoreTask.java"
        "src/com/android/server/testing/shadows/ShadowSlog.java"
        "src/com/android/server/testing/shadows/ShadowSystemServiceRegistry.java"
        "src/com/android/server/testing/shadows/ShadowUserManager.java"
    ];
};

in { inherit FrameworksServicesLib FrameworksServicesRoboShadows FrameworksServicesRoboTests; }
