{ java_binary_host, java_library }:
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
create_time_zone_distro = java_binary_host {
    name = "create_time_zone_distro";
    main_class = "com.android.timezone.distro.tools.CreateTimeZoneDistro";
    srcs = [
        "src/main/com/android/timezone/distro/builder/TimeZoneDistroBuilder.java"
        "src/main/com/android/timezone/distro/tools/CreateTimeZoneDistro.java"
    ];
    static_libs = [
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
    sdk_version = "core_platform";
};

in { inherit create_time_zone_distro time_zone_distro_builder; }
