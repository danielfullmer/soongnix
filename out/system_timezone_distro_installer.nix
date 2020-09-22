{ java_library }:
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

#  The classes needed to handle installation of time zone distros.
time_zone_distro_installer = java_library {
    name = "time_zone_distro_installer";

    srcs = ["src/main/com/android/timezone/distro/installer/TimeZoneDistroInstaller.java"];
    libs = ["time_zone_distro"];
};

#  Tests for time_zone_distro_installer code (see CtsLibcoreTestCases)
time_zone_distro_installer-tests = java_library {
    name = "time_zone_distro_installer-tests";

    srcs = ["src/test/com/android/timezone/distro/installer/TimeZoneDistroInstallerTest.java"];
    static_libs = [
        "time_zone_distro"
        "time_zone_distro_builder"
        "time_zone_distro_installer"
        "tzdata-testing"
        "junit"
    ];
};

in { inherit time_zone_distro_installer time_zone_distro_installer-tests; }
