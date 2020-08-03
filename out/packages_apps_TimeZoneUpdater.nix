{ android_app, java_library }:
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

#  A static library containing all the source needed by the TimeZoneUpdater
time_zone_updater = java_library {
    name = "time_zone_updater";
    srcs = [
        "src/main/**/*.java"
        "src/main/**/*.logtags" #  Also include generated EventLogTags from the .logtags file.
    ];
    static_libs = ["time_zone_distro"];
};

TimeZoneUpdater = android_app {
    name = "TimeZoneUpdater";
    optimize = {
        enabled = false;
    };
    static_libs = ["time_zone_updater"];
    platform_apis = true;
    certificate = "platform";
    privileged = true;
    required = ["com.android.timezone.updater.xml"];
};

in { inherit TimeZoneUpdater time_zone_updater; }
