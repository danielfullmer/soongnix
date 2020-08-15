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

GameQualificationPerformanceTestTest = java_test_host {
    name = "GameQualificationPerformanceTestTest";
    srcs = [
        "com/android/game/qualification/metric/BaseGameQualificationMetricCollectorTest.java"
        "com/android/game/qualification/metric/GameQualificationFpsCollectorTest.java"
        "com/android/game/qualification/metric/GameQualificationScheduledMetricCollectorTest.java"
        "com/android/game/qualification/metric/HistogramTest.java"
        "com/android/game/qualification/metric/LoopSummaryTest.java"
        "com/android/game/qualification/metric/MetricSummaryTest.java"
        "com/android/game/qualification/test/PerformanceTestTest.java"
    ];
    libs = [
        "GameQualificationPerformanceTest"
        "GameQualificationHelperHost"
        "junit-host"
        "tradefed"
    ];
    test_suites = ["general-tests"];
    installable = false;
};

in { inherit GameQualificationPerformanceTestTest; }
