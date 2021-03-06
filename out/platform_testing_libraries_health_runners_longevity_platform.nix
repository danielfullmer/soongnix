{ filegroup, java_library_static }:
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

#  Filegroup for the profile proto definition that enables referencing it elsewhere.
profile-proto-def = filegroup {
    name = "profile-proto-def";
    srcs = ["src/android/platform/test/longevity/profile.proto"];
};

longevity-device-lib = java_library_static {
    name = "longevity-device-lib";
    srcs = [
        "src/android/platform/test/longevity/LongevityClassRunner.java"
        "src/android/platform/test/longevity/LongevitySuite.java"
        "src/android/platform/test/longevity/Profile.java"
        "src/android/platform/test/longevity/ProfileSuite.java"
        "src/android/platform/test/longevity/ScenarioRunner.java"
        "src/android/platform/test/longevity/ScheduledScenarioRunner.java"
        "src/android/platform/test/longevity/listener/BatteryTerminator.java"
        "src/android/platform/test/longevity/listener/ErrorTerminator.java"
        "src/android/platform/test/longevity/listener/TimeoutTerminator.java"
        "src/android/platform/test/longevity/profile.proto"
    ];
    proto = {
        type = "lite";
        include_dirs = ["external/protobuf/src"];
    };
    static_libs = [
        "longevity-base-lib"
    ];
    libs = [
        "androidx.test.runner"
        "common-platform-scenarios"
        "guava"
        "platform-test-composers"
    ];
    min_sdk_version = "26";
};

in { inherit longevity-device-lib profile-proto-def; }
