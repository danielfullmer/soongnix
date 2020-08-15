{ android_test }:
let

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

NotificationFunctionalTests = android_test {
    name = "NotificationFunctionalTests";
    srcs = [
        "src/com/android/notification/functional/HeadsUpNotificationTests.java"
        "src/com/android/notification/functional/NotificationBundlingTests.java"
        "src/com/android/notification/functional/NotificationHelper.java"
        "src/com/android/notification/functional/NotificationInlineReplyTests.java"
        "src/com/android/notification/functional/NotificationInteractionTests.java"
        "src/com/android/notification/functional/NotificationSecurityLargeTests.java"
        "src/com/android/notification/functional/NotificationSecurityTests.java"
    ];
    static_libs = [
        "android-support-test"
        "launcher-helper-lib"
        "metrics-helper-lib"
        "platform-test-annotations"
        "ub-uiautomator"
        #  services.* are notifications specific, do not copy to other tests
        "services.accessibility"
        "services.core"
        "services.devicepolicy"
        "services.net"
        "services.usage"
        "services.core"
        "system-helpers"
        "sysui-helper"
    ];

    libs = ["android.test.base"];

    platform_apis = true;

    test_suites = ["device-tests"];
};

in { inherit NotificationFunctionalTests; }
