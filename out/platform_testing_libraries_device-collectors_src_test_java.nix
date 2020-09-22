{ android_test }:
let

#
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
#

#  Android Unit Test target
CollectorDeviceLibTest = android_test {
    name = "CollectorDeviceLibTest";
    defaults = ["tradefed_errorprone_defaults"];

    srcs = [
        "android/device/collectors/BaseCollectionListenerTest.java"
        "android/device/collectors/BaseMetricListenerInstrumentedTest.java"
        "android/device/collectors/BatteryStatsListenerTest.java"
        "android/device/collectors/BinderListenerTest.java"
        "android/device/collectors/DumpsysMeminfoListenerTest.java"
        "android/device/collectors/IncidentReportListenerTest.java"
        "android/device/collectors/JankListenerTest.java"
        "android/device/collectors/LogcatOnFailureCollectorTest.java"
        "android/device/collectors/PerfettoListenerTest.java"
        "android/device/collectors/ProcLoadListenerTest.java"
        "android/device/collectors/ProcessShowmapListenerTest.java"
        "android/device/collectors/ScheduledRunCollectionListenerTest.java"
        "android/device/collectors/ScheduledRunMetricListenerTest.java"
        "android/device/collectors/ScreenRecordCollectorTest.java"
        "android/device/collectors/ScreenshotOnFailureCollectorTest.java"
        "android/device/collectors/SfStatsListenerTest.java"
        "android/device/collectors/ShowmapSnapshotListenerTest.java"
        "android/device/collectors/StubScheduledRunMetricListener.java"
        "android/device/collectors/StubTestMetricListener.java"
        "android/device/collectors/TotalPssMetricListenerTest.java"
        "android/device/loggers/test/StubInstrumentationAnnotatedTest.java"
        "android/device/preparers/GarbageCollectionPreparerTest.java"
        "android/device/tests/TestEvents.java"
    ];
    static_libs = [
        "androidx.test.runner"
        "collector-device-lib"
        "junit"
        "mockito-target-minus-junit4"
        "perfetto-helper"
        "ub-uiautomator"
    ];

    sdk_version = "current";

    test_suites = ["general-tests"];
};

in { inherit CollectorDeviceLibTest; }
