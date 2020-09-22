{ filegroup, java_test_helper_library }:
let

#  Copyright (C) 2012 The Android Open Source Project
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

cts-wm-app-util = filegroup {
    name = "cts-wm-app-util";
    srcs = [
        "src/android/server/wm/ActivityLauncher.java"
        "src/android/server/wm/CommandSession.java"
        "src/android/server/wm/ComponentNameUtils.java"
        "src/android/server/wm/TestJournalProvider.java"
        "src/android/server/wm/TestLogClient.java"
        ":cts-wm-components"
    ];
};

cts-wm-util = java_test_helper_library {
    name = "cts-wm-util";

    srcs = [
        "src/android/server/wm/ActivityLauncher.java"
        "src/android/server/wm/ActivityManagerTestBase.java"
        "src/android/server/wm/BarTestUtils.java"
        "src/android/server/wm/CommandSession.java"
        "src/android/server/wm/ComponentNameUtils.java"
        "src/android/server/wm/Condition.java"
        "src/android/server/wm/ObjectTracker.java"
        "src/android/server/wm/ProtoExtractors.java"
        "src/android/server/wm/StateLogger.java"
        "src/android/server/wm/TestJournalProvider.java"
        "src/android/server/wm/TestLogClient.java"
        "src/android/server/wm/TestTaskOrganizer.java"
        "src/android/server/wm/UiDeviceUtils.java"
        "src/android/server/wm/WaitForValidActivityState.java"
        "src/android/server/wm/WindowInsetsAnimationUtils.java"
        "src/android/server/wm/WindowManagerState.java"
        "src/android/server/wm/WindowManagerStateHelper.java"
        "src/android/server/wm/annotation/Group1.java"
        "src/android/server/wm/annotation/Group2.java"
        "src/android/server/wm/annotation/Group3.java"
        "src/android/server/wm/settings/SettingsSession.java"
        ":cts-wm-components"
        ":cts-wm-components-base"
    ];

    static_libs = [
        "platformprotosnano"
        "compatibility-device-util-axt"
        "androidx.test.rules"
        "hamcrest-library"
    ];

    sdk_version = "test_current";
};

in { inherit cts-wm-app-util cts-wm-util; }
