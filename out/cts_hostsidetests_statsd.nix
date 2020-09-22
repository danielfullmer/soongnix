{ java_test_host }:
let

#  Copyright (C) 2014 The Android Open Source Project
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

CtsStatsdHostTestCases = java_test_host {
    name = "CtsStatsdHostTestCases";

    srcs = [
        "src/android/cts/statsd/alarm/AlarmTests.java"
        "src/android/cts/statsd/alert/AnomalyDetectionTests.java"
        "src/android/cts/statsd/atom/AtomTestCase.java"
        "src/android/cts/statsd/atom/BaseTestCase.java"
        "src/android/cts/statsd/atom/BufferDebug.java"
        "src/android/cts/statsd/atom/DeviceAtomTestCase.java"
        "src/android/cts/statsd/atom/HostAtomTests.java"
        "src/android/cts/statsd/atom/ProcStateAtomTests.java"
        "src/android/cts/statsd/atom/ProcStateTestCase.java"
        "src/android/cts/statsd/atom/UidAtomTests.java"
        "src/android/cts/statsd/metadata/MetadataTestCase.java"
        "src/android/cts/statsd/metadata/MetadataTests.java"
        "src/android/cts/statsd/metric/CountMetricsTests.java"
        "src/android/cts/statsd/metric/DurationMetricsTests.java"
        "src/android/cts/statsd/metric/GaugeMetricsTests.java"
        "src/android/cts/statsd/metric/MetricActivationTests.java"
        "src/android/cts/statsd/metric/MetricsUtils.java"
        "src/android/cts/statsd/metric/ValueMetricsTests.java"
        "src/android/cts/statsd/subscriber/ShellSubscriberTest.java"
        "src/android/cts/statsd/uidmap/UidMapTests.java"
        "src/android/cts/statsd/validation/BatteryStatsValidationTests.java"
        "src/android/cts/statsd/validation/DirectoryValidationTest.java"
        "src/android/cts/statsd/validation/ProcStatsValidationTests.java"
        "src/android/cts/statsd/validation/ValidationTestUtil.java"
        "src/android/cts/statsd/validation/ValidationTests.java"
    ];

    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "general-tests"
        "mts"
        "vts10"
    ];

    libs = [
        "compatibility-host-util"
        "cts-tradefed"
        "host-libprotobuf-java-full"
        "platformprotos"
        "tradefed"
        "truth-prebuilt"
    ];
    static_libs = [
        "core_cts_test_resources"
        "perfetto_config-full"
    ];
    data = [
        "BATTERYSTATS_CONNECTIVITY_STATE_CHANGE_COUNT.pbtxt"
        "BATTERYSTATS_SERVICE_LAUNCH_COUNT.pbtxt"
        "BATTERYSTATS_SERVICE_START_COUNT.pbtxt"
        "PROCSTATSQ_PROCS_STATE_CACHED_EMPTY_DURATION.pbtxt"
        "PROCSTATSQ_PROCS_STATE_PSS_VALUE.pbtxt"
        "PROCSTATSQ_PROCS_STATE_TOP_DURATION.pbtxt"
        "PROCSTATSQ_PULL.pbtxt"
        "PROCSTATSQ_PULL_PKG_PROC.pbtxt"
        ":CtsStatsdApp"
        ":CtsStatsdEmptyApp"
        ":CtsStatsdEmptySplitApp"
    ];
};

in { inherit CtsStatsdHostTestCases; }
