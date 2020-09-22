{ android_test }:
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

CtsBatterySavingTestCases = android_test {
    name = "CtsBatterySavingTestCases";
    defaults = ["cts_defaults"];
    static_libs = [
        "BatterySavingCtsCommon"
        "androidx.test.rules"
        "androidx.legacy_legacy-support-v4"
        "mockito-target-minus-junit4"
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
        "platformprotosnano"
        "truth-prebuilt"
        "ub-uiautomator"
    ];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    srcs = [
        "src/android/os/cts/batterysaving/ActionChargingTest.java"
        "src/android/os/cts/batterysaving/BatterySaverAlarmTest.java"
        "src/android/os/cts/batterysaving/BatterySaverBgServiceTest.java"
        "src/android/os/cts/batterysaving/BatterySaverLocationTest.java"
        "src/android/os/cts/batterysaving/BatterySaverTest.java"
        "src/android/os/cts/batterysaving/BatterySavingTestBase.java"
        "src/android/os/cts/batterysaving/BroadcastRpc.java"
        "src/android/os/cts/deviceidle/DeviceIdleTest.java"
        "src/android/os/cts/powerwhitelist/PowerWhitelistTest.java"
    ];
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    sdk_version = "test_current";
};

in { inherit CtsBatterySavingTestCases; }