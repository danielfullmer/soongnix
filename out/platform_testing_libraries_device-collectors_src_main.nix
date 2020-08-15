{ java_library }:
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

collector-device-lib = java_library {
    name = "collector-device-lib";
    defaults = ["tradefed_errorprone_defaults"];

    srcs = [
        "java/android/device/collectors/BaseCollectionListener.java"
        "java/android/device/collectors/BaseMetricListener.java"
        "java/android/device/collectors/BatteryStatsListener.java"
        "java/android/device/collectors/DataRecord.java"
        "java/android/device/collectors/DumpsysMeminfoListener.java"
        "java/android/device/collectors/FreeMemListener.java"
        "java/android/device/collectors/IncidentReportListener.java"
        "java/android/device/collectors/JankListener.java"
        "java/android/device/collectors/LogcatOnFailureCollector.java"
        "java/android/device/collectors/PerfettoListener.java"
        "java/android/device/collectors/ProcLoadListener.java"
        "java/android/device/collectors/ProcessShowmapListener.java"
        "java/android/device/collectors/RssSnapshotListener.java"
        "java/android/device/collectors/ScheduledRunCollectionListener.java"
        "java/android/device/collectors/ScheduledRunMetricListener.java"
        "java/android/device/collectors/ScreenRecordCollector.java"
        "java/android/device/collectors/ScreenshotOnFailureCollector.java"
        "java/android/device/collectors/SfStatsListener.java"
        "java/android/device/collectors/TotalPssMetricListener.java"
        "java/android/device/collectors/annotations/MetricOption.java"
        "java/android/device/collectors/annotations/OptionClass.java"
        "java/android/device/collectors/util/SendToInstrumentation.java"
        "java/android/device/loggers/LogFileLogger.java"
        "java/android/device/loggers/TestCaseLogger.java"
        "java/android/device/loggers/TestLogData.java"
        "java/android/device/preparers/GarbageCollectionPreparer.java"
    ];

    static_libs = [
        "androidx.test.runner"
        "jank-helper"
        "junit"
        "memory-helper"
        "perfetto-helper"
        "ub-uiautomator"
        "system-metric-helper"
    ];

    sdk_version = "current";
};

in { inherit collector-device-lib; }
