{ java_test_host }:
let

#  Copyright (C) 2018 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

GameQualificationPerformanceTest = java_test_host {
    name = "GameQualificationPerformanceTest";

    srcs = [
        "src/com/android/game/qualification/metric/BaseGameQualificationMetricCollector.java"
        "src/com/android/game/qualification/metric/GameQualificationFpsCollector.java"
        "src/com/android/game/qualification/metric/GameQualificationMetric.java"
        "src/com/android/game/qualification/metric/GameQualificationScheduledMetricCollector.java"
        "src/com/android/game/qualification/metric/Histogram.java"
        "src/com/android/game/qualification/metric/LoopSummary.java"
        "src/com/android/game/qualification/metric/MetricSummary.java"
        "src/com/android/game/qualification/reporter/GameQualificationResultReporter.java"
        "src/com/android/game/qualification/test/PerformanceTest.java"
        "src/com/android/game/qualification/testtype/GameQualificationHostsideController.java"
    ];
    java_resource_dirs = ["res"];

    libs = [
        "tradefed"
    ];
    static_libs = [
        "GameQualificationHelperHost"
        "truth-prebuilt-host-jar"
        "gson-prebuilt-jar"
    ];

    test_suites = [
        "general-tests"
        "vts"
    ];
};

in { inherit GameQualificationPerformanceTest; }
