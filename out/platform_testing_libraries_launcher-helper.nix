{ java_library }:
let

#
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
#

launcher-helper-lib = java_library {
    name = "launcher-helper-lib";
    libs = [
        "ub-uiautomator"
        "android-support-test"
        "androidx.test.runner"
        "activity-helper"
    ];
    static_libs = [
        "dpad-util"
        "commands-helper"
        "activity-helper"
        "launcher-aosp-tapl"
    ];
    sdk_version = "test_current";
    srcs = [
        "src/android/support/test/launcherhelper/AllAppsScreenHelper.java"
        "src/android/support/test/launcherhelper/AospLauncherStrategy.java"
        "src/android/support/test/launcherhelper/AutoLauncherStrategy.java"
        "src/android/support/test/launcherhelper/BaseLauncher3Strategy.java"
        "src/android/support/test/launcherhelper/CommonLauncherHelper.java"
        "src/android/support/test/launcherhelper/GoogleExperienceLauncherStrategy.java"
        "src/android/support/test/launcherhelper/IAutoLauncherStrategy.java"
        "src/android/support/test/launcherhelper/ILauncherStrategy.java"
        "src/android/support/test/launcherhelper/ILeanbackLauncherStrategy.java"
        "src/android/support/test/launcherhelper/Launcher3Strategy.java"
        "src/android/support/test/launcherhelper/LauncherStrategyFactory.java"
        "src/android/support/test/launcherhelper/LeanbackLauncherStrategy.java"
        "src/android/support/test/launcherhelper/NexusLauncherStrategy.java"
        "src/android/support/test/launcherhelper/PixelCLauncherStrategy.java"
        "src/android/support/test/launcherhelper/TvLauncherStrategy.java"
        "src/android/support/test/launcherhelper/VolvoLauncherStrategy.java"
        "src/android/support/test/launcherhelper/WearLauncherStrategy.java"
    ];
};

in { inherit launcher-helper-lib; }
