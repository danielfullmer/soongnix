{ filegroup, java_library }:
let

#  Copyright (C) 2020 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

service-statsd-sources = filegroup {
    name = "service-statsd-sources";
    srcs = [
        "java/com/android/server/stats/StatsCompanion.java"
        "java/com/android/server/stats/StatsCompanionService.java"
        "java/com/android/server/stats/StatsManagerService.java"
    ];
};

service-statsd = java_library {
    name = "service-statsd";
    srcs = [":service-statsd-sources"];
    sdk_version = "system_server_current";
    libs = [
        "framework-annotations-lib"
        "framework-statsd"
    ];
    plugins = ["java_api_finder"];
    apex_available = [
        "com.android.os.statsd"
        "test_com.android.os.statsd"
    ];
};

in { inherit service-statsd service-statsd-sources; }
