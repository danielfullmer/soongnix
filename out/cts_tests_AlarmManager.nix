{ android_test }:
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

CtsAlarmManagerTestCases = android_test {
    name = "CtsAlarmManagerTestCases";
    defaults = ["cts_defaults"];
    static_libs = [
        "ub-uiautomator"
        "androidx.test.rules"
        "compatibility-device-util-axt"
    ];
    srcs = [
        "src/android/alarmmanager/cts/AppStandbyTests.java"
        "src/android/alarmmanager/cts/BackgroundRestrictedAlarmsTest.java"
        "src/android/alarmmanager/cts/InstantAppsTests.java"
        "src/android/alarmmanager/cts/TimeChangeTests.java"
        "src/android/alarmmanager/cts/UidCapTests.java"
        "app/src/android/alarmmanager/alarmtestapp/cts/TestAlarmReceiver.java"
        "app/src/android/alarmmanager/alarmtestapp/cts/TestAlarmScheduler.java"
    ];
    test_suites = [
        "cts"
        "vts"
        "general-tests"
    ];
    platform_apis = true;
};

in { inherit CtsAlarmManagerTestCases; }
