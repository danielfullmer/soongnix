{ java_library, java_library_host }:
let

#  Copyright (C) 2015 The Android Open Source Project
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

#  The tool used to create time zone distro.zip files.
create_time_zone_distro = java_library_host {
    name = "create_time_zone_distro";

    srcs = [
        "src/main/com/android/timezone/distro/builder/TimeZoneDistroBuilder.java"
        "src/main/com/android/timezone/distro/tools/CreateTimeZoneDistro.java"
    ];
    libs = [
        "time_zone_distro"
    ];
};

#  Code that can build a time zone distro.zip. Used in tests.
time_zone_distro_builder = java_library {
    name = "time_zone_distro_builder";
    host_supported = true;

    srcs = ["src/main/com/android/timezone/distro/builder/TimeZoneDistroBuilder.java"];
    libs = [
        "time_zone_distro"
    ];
    no_framework_libs = true;
};

in { inherit create_time_zone_distro time_zone_distro_builder; }
