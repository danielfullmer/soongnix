{ java_library, java_test }:
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

flickerlib = java_test {
    name = "flickerlib";
    platform_apis = true;
    srcs = [
        "src/com/android/server/wm/flicker/Assertions.java"
        "src/com/android/server/wm/flicker/AssertionsChecker.java"
        "src/com/android/server/wm/flicker/ITraceEntry.java"
        "src/com/android/server/wm/flicker/LayersTrace.java"
        "src/com/android/server/wm/flicker/LayersTraceSubject.java"
        "src/com/android/server/wm/flicker/StandardAppHelper.java"
        "src/com/android/server/wm/flicker/TransitionRunner.java"
        "src/com/android/server/wm/flicker/WindowManagerTrace.java"
        "src/com/android/server/wm/flicker/WindowUtils.java"
        "src/com/android/server/wm/flicker/WmTraceSubject.java"
        "src/com/android/server/wm/flicker/helpers/AutomationUtils.java"
        "src/com/android/server/wm/flicker/monitor/ITransitionMonitor.java"
        "src/com/android/server/wm/flicker/monitor/LayersTraceMonitor.java"
        "src/com/android/server/wm/flicker/monitor/ScreenRecorder.java"
        "src/com/android/server/wm/flicker/monitor/TraceMonitor.java"
        "src/com/android/server/wm/flicker/monitor/WindowAnimationFrameStatsMonitor.java"
        "src/com/android/server/wm/flicker/monitor/WindowManagerTraceMonitor.java"
    ];
    static_libs = [
        "androidx.test.janktesthelper"
        "cts-wm-util"
        "platformprotosnano"
        "layersprotosnano"
        "truth-prebuilt"
        "sysui-helper"
        "launcher-helper-lib"
    ];
};

flickerlib_without_helpers = java_library {
    name = "flickerlib_without_helpers";
    platform_apis = true;
    srcs = [
        "src/com/android/server/wm/flicker/Assertions.java"
        "src/com/android/server/wm/flicker/AssertionsChecker.java"
        "src/com/android/server/wm/flicker/ITraceEntry.java"
        "src/com/android/server/wm/flicker/LayersTrace.java"
        "src/com/android/server/wm/flicker/LayersTraceSubject.java"
        "src/com/android/server/wm/flicker/StandardAppHelper.java"
        "src/com/android/server/wm/flicker/TransitionRunner.java"
        "src/com/android/server/wm/flicker/WindowManagerTrace.java"
        "src/com/android/server/wm/flicker/WindowUtils.java"
        "src/com/android/server/wm/flicker/WmTraceSubject.java"
        "src/com/android/server/wm/flicker/helpers/AutomationUtils.java"
        "src/com/android/server/wm/flicker/monitor/ITransitionMonitor.java"
        "src/com/android/server/wm/flicker/monitor/LayersTraceMonitor.java"
        "src/com/android/server/wm/flicker/monitor/ScreenRecorder.java"
        "src/com/android/server/wm/flicker/monitor/TraceMonitor.java"
        "src/com/android/server/wm/flicker/monitor/WindowAnimationFrameStatsMonitor.java"
        "src/com/android/server/wm/flicker/monitor/WindowManagerTraceMonitor.java"
    ];
    exclude_srcs = ["src/com/android/server/wm/flicker/helpers/AutomationUtils.java"];
    static_libs = [
        "cts-wm-util"
        "platformprotosnano"
        "layersprotosnano"
        "truth-prebuilt"
        "app-helpers-core"
    ];
};

flickerautomationhelperlib = java_library {
    name = "flickerautomationhelperlib";
    sdk_version = "test_current";
    srcs = [
        "src/com/android/server/wm/flicker/helpers/AutomationUtils.java"
        "src/com/android/server/wm/flicker/WindowUtils.java"
    ];
    static_libs = [
        "sysui-helper"
        "launcher-helper-lib"
        "compatibility-device-util-axt"
    ];
};

in { inherit flickerautomationhelperlib flickerlib flickerlib_without_helpers; }
