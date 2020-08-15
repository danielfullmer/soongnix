{ android_app }:
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
#
#

StatsdLoadtest = android_app {
    name = "StatsdLoadtest";
    platform_apis = true;

    srcs = [
        "src/com/android/statsd/loadtest/BatteryDataRecorder.java"
        "src/com/android/statsd/loadtest/BatteryStatsParser.java"
        "src/com/android/statsd/loadtest/ConfigFactory.java"
        "src/com/android/statsd/loadtest/DisplayProtoUtils.java"
        "src/com/android/statsd/loadtest/LoadtestActivity.java"
        "src/com/android/statsd/loadtest/MemInfoParser.java"
        "src/com/android/statsd/loadtest/MemoryDataRecorder.java"
        "src/com/android/statsd/loadtest/NumericalWatcher.java"
        "src/com/android/statsd/loadtest/PerfData.java"
        "src/com/android/statsd/loadtest/PerfDataRecorder.java"
        "src/com/android/statsd/loadtest/PerfParser.java"
        "src/com/android/statsd/loadtest/SequencePusher.java"
        "src/com/android/statsd/loadtest/StatsdStatsRecorder.java"
        "src/com/android/statsd/loadtest/ValidationRecorder.java"
    ];

    resource_dirs = ["res"];
    static_libs = [
        "platformprotoslite"
        "statsdprotolite"
    ];

    certificate = "platform";
    privileged = true;
    dex_preopt = {
        enabled = false;
    };
    optimize = {
        enabled = false;
    };
};

in { inherit StatsdLoadtest; }
