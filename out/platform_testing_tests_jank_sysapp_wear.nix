{ android_test }:
let

#  Copyright 2015 Google Inc. All Rights Reserved.
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

SysAppJankTestsWear = android_test {
    name = "SysAppJankTestsWear";
    srcs = [
        "src/com/android/wearable/sysapp/janktests/AppLauncherFlingJankTest.java"
        "src/com/android/wearable/sysapp/janktests/CardsJankTest.java"
        "src/com/android/wearable/sysapp/janktests/QuickSettingsJankTest.java"
        "src/com/android/wearable/sysapp/janktests/SettingsFlingJankTest.java"
        "src/com/android/wearable/sysapp/janktests/SysAppTestHelper.java"
        "src/com/android/wearable/sysapp/janktests/WatchFaceHelper.java"
        "src/com/android/wearable/sysapp/janktests/WatchFaceJankTest.java"
        "src/com/android/wearable/sysapp/janktests/WatchFacePickerJankTest.java"
    ];

    static_libs = [
        "ub-uiautomator"
        "ub-janktesthelper"
        "junit"
    ];

    libs = ["android.test.base.stubs"];

    sdk_version = "current";

    test_suites = ["device-tests"];
};

in { inherit SysAppJankTestsWear; }
