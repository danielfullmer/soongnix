{ java_library_static }:
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

common-platform-scenarios = java_library_static {
    name = "common-platform-scenarios";
    min_sdk_version = "24";
    srcs = [
        "src/android/platform/test/scenario/annotation/AppSetup.java"
        "src/android/platform/test/scenario/annotation/Scenario.java"
        "src/android/platform/test/scenario/businesscard/DismissDialogs.java"
        "src/android/platform/test/scenario/businesscard/OpenApp.java"
        "src/android/platform/test/scenario/generic/OpenApp.java"
        "src/android/platform/test/scenario/performancelaunch/DismissDialogs.java"
        "src/android/platform/test/scenario/performancelaunch/OpenApp.java"
        "src/android/platform/test/scenario/sleep/Idle.java"
        "src/android/platform/test/scenario/system/ScreenOff.java"
        "src/android/platform/test/scenario/system/ScreenOn.java"
    ];
    libs = [
        "androidx.test.runner"
        "app-helpers-handheld-interfaces"
        "handheld-app-helpers"
        "platform-test-options"
        "platform-test-rules"
        "ub-uiautomator"
    ];
};

in { inherit common-platform-scenarios; }
