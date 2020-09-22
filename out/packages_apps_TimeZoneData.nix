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

#  A static library containing all the source needed by a Time Zone Data app.
time_zone_distro_provider = java_library {
    name = "time_zone_distro_provider";

    srcs = ["src/main/com/android/timezone/data/TimeZoneRulesDataProvider.java"];
    optimize = {
        proguard_flags_files = ["proguard.cfg"];
    };
    static_libs = [
        "time_zone_distro_unbundled"
        "androidx.annotation_annotation"
    ];
    sdk_version = "system_current";
};

in { inherit time_zone_distro_provider; }
