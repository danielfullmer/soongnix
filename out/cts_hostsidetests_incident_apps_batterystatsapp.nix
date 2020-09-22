{ android_test_helper_app }:
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

CtsBatteryStatsApp = android_test_helper_app {
    name = "CtsBatteryStatsApp";
    defaults = ["cts_defaults"];
    srcs = [
        "src/com/android/server/cts/device/batterystats/BatteryStatsAlarmTest.java"
        "src/com/android/server/cts/device/batterystats/BatteryStatsAuthenticator.java"
        "src/com/android/server/cts/device/batterystats/BatteryStatsBackgroundService.java"
        "src/com/android/server/cts/device/batterystats/BatteryStatsBgVsFgActions.java"
        "src/com/android/server/cts/device/batterystats/BatteryStatsDeviceTestBase.java"
        "src/com/android/server/cts/device/batterystats/BatteryStatsForegroundActivity.java"
        "src/com/android/server/cts/device/batterystats/BatteryStatsJobDurationTests.java"
        "src/com/android/server/cts/device/batterystats/BatteryStatsProcessStateTests.java"
        "src/com/android/server/cts/device/batterystats/BatteryStatsProvider.java"
        "src/com/android/server/cts/device/batterystats/BatteryStatsSyncAdapter.java"
        "src/com/android/server/cts/device/batterystats/BatteryStatsSyncService.java"
        "src/com/android/server/cts/device/batterystats/BatteryStatsSyncTest.java"
        "src/com/android/server/cts/device/batterystats/BatteryStatsWakeLockTests.java"
        "src/com/android/server/cts/device/batterystats/SimpleActivity.java"
        "src/com/android/server/cts/device/batterystats/SimpleForegroundService.java"
        "src/com/android/server/cts/device/batterystats/SimpleJobService.java"
    ];
    libs = [
        "android.test.runner.stubs"
        "junit"
        "org.apache.http.legacy"
    ];
    static_libs = [
        "ctstestrunner-axt"
        "compatibility-device-util-axt"
        "androidx.legacy_legacy-support-v4"
    ];
    sdk_version = "test_current";
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

in { inherit CtsBatteryStatsApp; }
