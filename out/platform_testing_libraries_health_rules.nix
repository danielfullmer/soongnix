{ java_library }:
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

platform-test-rules = java_library {
    name = "platform-test-rules";
    sdk_version = "test_current";
    static_libs = [
        "androidx.test.runner"
        "app-helpers-handheld-interfaces"
        "guava"
        "memory-helper"
        "ub-uiautomator"
    ];
    srcs = [
        "src/android/platform/test/rule/CompilationFilterRule.java"
        "src/android/platform/test/rule/DropCachesRule.java"
        "src/android/platform/test/rule/GarbageCollectRule.java"
        "src/android/platform/test/rule/KillAppsRule.java"
        "src/android/platform/test/rule/NaturalOrientationRule.java"
        "src/android/platform/test/rule/NotificationPressureRule.java"
        "src/android/platform/test/rule/PressHomeRule.java"
        "src/android/platform/test/rule/QuickstepPressureRule.java"
        "src/android/platform/test/rule/StopwatchRule.java"
        "src/android/platform/test/rule/TestWatcher.java"
        "src/android/platform/test/rule/TracePointRule.java"
    ];
};

in { inherit platform-test-rules; }
