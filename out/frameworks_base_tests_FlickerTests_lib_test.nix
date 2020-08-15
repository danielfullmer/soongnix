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

FlickerLibTest = android_test {
    name = "FlickerLibTest";
    #  sign this with platform cert, so this test is allowed to call private platform apis
    certificate = "platform";
    platform_apis = true;
    test_suites = ["tests"];
    srcs = [
        "src/com/android/server/wm/flicker/AssertionsCheckerTest.java"
        "src/com/android/server/wm/flicker/AssertionsTest.java"
        "src/com/android/server/wm/flicker/LayersTraceSubjectTest.java"
        "src/com/android/server/wm/flicker/LayersTraceTest.java"
        "src/com/android/server/wm/flicker/TestFileUtils.java"
        "src/com/android/server/wm/flicker/TransitionRunnerTest.java"
        "src/com/android/server/wm/flicker/WindowManagerTraceTest.java"
        "src/com/android/server/wm/flicker/WmTraceSubjectTest.java"
        "src/com/android/server/wm/flicker/monitor/LayersTraceMonitorTest.java"
        "src/com/android/server/wm/flicker/monitor/ScreenRecorderTest.java"
        "src/com/android/server/wm/flicker/monitor/WindowAnimationFrameStatsMonitorTest.java"
        "src/com/android/server/wm/flicker/monitor/WindowManagerTraceMonitorTest.java"
    ];
    libs = ["android.test.runner"];
    static_libs = [
        "androidx.test.rules"
        "platform-test-annotations"
        "truth-prebuilt"
        "platformprotosnano"
        "layersprotosnano"
        "flickerlib"
    ];
};

in { inherit FlickerLibTest; }
