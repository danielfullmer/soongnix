{ filegroup, java_library_static }:
let

#  Copyright (C) 2018 The Android Open Source Project
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

"services.startop.iorap-javasources" = filegroup {
    name = "services.startop.iorap-javasources";
    srcs = [
        "src/com/google/android/startop/iorap/ActivityHintEvent.java"
        "src/com/google/android/startop/iorap/ActivityInfo.java"
        "src/com/google/android/startop/iorap/AppIntentEvent.java"
        "src/com/google/android/startop/iorap/AppLaunchEvent.java"
        "src/com/google/android/startop/iorap/CheckHelpers.java"
        "src/com/google/android/startop/iorap/DexOptEvent.java"
        "src/com/google/android/startop/iorap/EventSequenceValidator.java"
        "src/com/google/android/startop/iorap/IorapForwardingService.java"
        "src/com/google/android/startop/iorap/JobScheduledEvent.java"
        "src/com/google/android/startop/iorap/PackageEvent.java"
        "src/com/google/android/startop/iorap/RequestId.java"
        "src/com/google/android/startop/iorap/SystemServiceEvent.java"
        "src/com/google/android/startop/iorap/SystemServiceUserEvent.java"
        "src/com/google/android/startop/iorap/TaskResult.java"
    ];
    path = "src";
    visibility = ["//visibility:private"];
};

"services.startop.iorap-sources" = filegroup {
    name = "services.startop.iorap-sources";
    srcs = [
        ":services.startop.iorap-javasources"
        ":iorap-aidl"
    ];
    visibility = ["//frameworks/base/services:__subpackages__"];
};

"services.startop.iorap" = java_library_static {
    name = "services.startop.iorap";
    srcs = [":services.startop.iorap-sources"];
    libs = ["services.core"];
};

in { inherit "services.startop.iorap" "services.startop.iorap-javasources" "services.startop.iorap-sources"; }
