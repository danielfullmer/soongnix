{ android_test }:
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

FrameworksMockingServicesTests = android_test {
    name = "FrameworksMockingServicesTests";

    srcs = [
        "src/com/android/server/AlarmManagerServiceTest.java"
        "src/com/android/server/AppStateTrackerTest.java"
        "src/com/android/server/DeviceIdleControllerTest.java"
        "src/com/android/server/RescuePartyTest.java"
        "src/com/android/server/am/ApplicationExitInfoTest.java"
        "src/com/android/server/am/CachedAppOptimizerTest.java"
        "src/com/android/server/am/MockingOomAdjusterTests.java"
        "src/com/android/server/am/PendingIntentControllerTest.java"
        "src/com/android/server/am/PersistentConnectionTest.java"
        "src/com/android/server/am/SettingsToPropertiesMapperTest.java"
        "src/com/android/server/appop/AppOpsServiceTest.java"
        "src/com/android/server/appop/AppOpsUpgradeTest.java"
        "src/com/android/server/blob/BlobStoreConfigTest.java"
        "src/com/android/server/blob/BlobStoreManagerServiceTest.java"
        "src/com/android/server/deviceidle/BluetoothConstraintTest.java"
        "src/com/android/server/display/LocalDisplayAdapterTest.java"
        "src/com/android/server/display/color/DisplayTransformManagerTest.java"
        "src/com/android/server/display/color/DisplayWhiteBalanceTintControllerTest.java"
        "src/com/android/server/job/JobSchedulerServiceTest.java"
        "src/com/android/server/job/controllers/ConnectivityControllerTest.java"
        "src/com/android/server/job/controllers/JobStatusTest.java"
        "src/com/android/server/job/controllers/QuotaControllerTest.java"
        "src/com/android/server/job/controllers/StateControllerTest.java"
        "src/com/android/server/job/controllers/TimeControllerTest.java"
        "src/com/android/server/location/AppForegroundHelperTest.java"
        "src/com/android/server/location/AppOpsHelperTest.java"
        "src/com/android/server/location/LocationFudgerTest.java"
        "src/com/android/server/location/LocationUtils.java"
        "src/com/android/server/location/UserInfoHelperTest.java"
        "src/com/android/server/power/batterysaver/BatterySaverStateMachineTest.java"
        "src/com/android/server/testables/MultipleStaticMocksTest.java"
        "src/com/android/server/testables/StaticMockFixture.java"
        "src/com/android/server/testables/StaticMockFixtureRule.java"
        "src/com/android/server/testables/StaticMockFixtureRuleTest.java"
        "src/com/android/server/testables/TestableDeviceConfig.java"
        "src/com/android/server/testables/TestableDeviceConfigAndOtherStaticMocksTest.java"
        "src/com/android/server/testables/TestableDeviceConfigTest.java"
        "src/com/android/server/utils/quota/CountQuotaTrackerTest.java"
        "src/com/android/server/wallpaper/WallpaperManagerServiceTests.java"
    ];

    static_libs = [
        "services.core"
        "services.net"
        "service-jobscheduler"
        "service-permission.impl"
        "service-blobstore"
        "androidx.test.runner"
        "androidx.test.ext.truth"
        "mockito-target-extended-minus-junit4"
        "platform-test-annotations"
        "truth-prebuilt"
        "testables"
    ];

    libs = [
        "android.test.mock"
        "android.test.base"
        "android.test.runner"
    ];

    jni_libs = [
        "libdexmakerjvmtiagent"
        "libpsi"
        "libstaticjvmtiagent"
    ];

    certificate = "platform";
    platform_apis = true;
    test_suites = ["device-tests"];

    optimize = {
        enabled = false;
    };
};

in { inherit FrameworksMockingServicesTests; }
