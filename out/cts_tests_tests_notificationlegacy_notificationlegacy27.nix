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

CtsLegacyNotification27TestCases = android_test {
    name = "CtsLegacyNotification27TestCases";
    defaults = ["cts_defaults"];
    platform_apis = true;
    static_libs = [
        "androidx.test.rules"
        "ctstestrunner-axt"
        "androidx.test.rules"
        "junit"
    ];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    srcs = [
        "src/android/app/notification/legacy/cts/ConditionProviderServiceTest.java"
        "src/android/app/notification/legacy/cts/LegacyConditionProviderService.java"
        "src/android/app/notification/legacy/cts/LegacyNotificationManagerTest.java"
        "src/android/app/notification/legacy/cts/PollableConditionProviderService.java"
        "src/android/app/notification/legacy/cts/SecondaryConditionProviderService.java"
        "src/android/app/notification/legacy/cts/SecondaryNotificationListener.java"
        "src/android/app/notification/legacy/cts/TestNotificationListener.java"
        "src/android/app/notification/legacy/cts/ZenModeBroadcastReceiver.java"
    ];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    min_sdk_version = "27";
};

in { inherit CtsLegacyNotification27TestCases; }