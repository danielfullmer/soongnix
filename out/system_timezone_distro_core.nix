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

#  Library of classes for handling time zone distros. Used on-device for
#  handling distros and within CTS tests.
#
#  This is distinct from time_zone_distro_unbundled. It should be used
#  for platform code as it avoids circular dependencies when stubs targets
#  need to build framework (as appears to be the case in aosp/master).
#  Also used from host-side tests and tools.
time_zone_distro = java_library {
    name = "time_zone_distro";
    host_supported = true;

    srcs = [
        "src/main/com/android/timezone/distro/DistroException.java"
        "src/main/com/android/timezone/distro/DistroVersion.java"
        "src/main/com/android/timezone/distro/FileUtils.java"
        "src/main/com/android/timezone/distro/StagedDistroOperation.java"
        "src/main/com/android/timezone/distro/TimeZoneDistro.java"
    ];
    target = {
        host = {
            static_libs = ["timezone-host"];
        };
    };
};

#  Library of classes for handling time zone distros. Used in unbundled
#  cases. Same as above, except dependent on system_current stubs.
time_zone_distro_unbundled = java_library {
    name = "time_zone_distro_unbundled";

    srcs = [
        "src/main/com/android/timezone/distro/DistroException.java"
        "src/main/com/android/timezone/distro/DistroVersion.java"
        "src/main/com/android/timezone/distro/FileUtils.java"
        "src/main/com/android/timezone/distro/StagedDistroOperation.java"
        "src/main/com/android/timezone/distro/TimeZoneDistro.java"
    ];
    sdk_version = "system_current";
};

#  Tests for time_zone_distro code.
time_zone_distro-tests = java_library {
    name = "time_zone_distro-tests";

    srcs = [
        "src/test/com/android/timezone/distro/DistroVersionTest.java"
        "src/test/com/android/timezone/distro/FileUtilsTest.java"
        "src/test/com/android/timezone/distro/TimeZoneDistroTest.java"
    ];
    static_libs = [
        "time_zone_distro"
        "core-tests-support"
        "junit"
    ];
};

in { inherit time_zone_distro time_zone_distro-tests time_zone_distro_unbundled; }
