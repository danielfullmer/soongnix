{ android_test }:
let

#
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
#

PlatformRuleTests = android_test {
    name = "PlatformRuleTests";
    defaults = ["tradefed_errorprone_defaults"];

    sdk_version = "test_current";
    static_libs = [
        "platform-test-rules"
        "truth-prebuilt"
        "guava"
        "mockito-target"
    ];
    srcs = [
        "src/android/platform/test/rule/CompilationFilterRuleTest.java"
        "src/android/platform/test/rule/DropCachesRuleTest.java"
        "src/android/platform/test/rule/GarbageCollectRuleTest.java"
        "src/android/platform/test/rule/IorapCompilationRuleTest.java"
        "src/android/platform/test/rule/KillAppsRuleTest.java"
        "src/android/platform/test/rule/NaturalOrientationRuleTest.java"
        "src/android/platform/test/rule/NotificationPressureRuleTest.java"
        "src/android/platform/test/rule/PressHomeRuleTest.java"
        "src/android/platform/test/rule/QuickstepPressureRuleTest.java"
        "src/android/platform/test/rule/StopwatchRuleTest.java"
        "src/android/platform/test/rule/TracePointRuleTest.java"
        "src/android/platform/test/rule/UnlockScreenRuleTest.java"
    ];
    test_suites = ["device-tests"];
};

in { inherit PlatformRuleTests; }
