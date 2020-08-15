{ java_library }:
let

#
#  Copyright (C) 2016 The Android Open Source Project
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

sysui-helper = java_library {
    name = "sysui-helper";
    static_libs = [
        "ub-uiautomator"
        "android-support-test"
        "activity-helper"
        "commands-helper"
        "device-helper"
        "app-helpers-handheld-interfaces"
    ];

    srcs = [
        "src/android/system/helpers/HotseatHelper.java"
        "src/android/system/helpers/LockscreenHelper.java"
        "src/android/system/helpers/NotificationHelper.java"
        "src/android/system/helpers/OverviewHelper.java"
        "src/android/system/helpers/QuickSettingsHelper.java"
    ];
    sdk_version = "test_current";
};

in { inherit sysui-helper; }
