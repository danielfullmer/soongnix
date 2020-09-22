{ android_robolectric_test }:
let

#  Copyright (C) 2019 The Android Open Source Project
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

#  Car Notifications Robolectric test target.
CarNotificationRoboTests = android_robolectric_test {
    name = "CarNotificationRoboTests";
    srcs = [
        "src/com/android/car/notification/BeeperTest.java"
        "src/com/android/car/notification/CarHeadsUpNotificationManagerTest.java"
        "src/com/android/car/notification/CarNotificationDiffTest.java"
        "src/com/android/car/notification/CarNotificationListenerTest.java"
        "src/com/android/car/notification/CarNotificationTypeItemTest.java"
        "src/com/android/car/notification/CarNotificationViewAdapterTest.java"
        "src/com/android/car/notification/CarNotificationViewTest.java"
        "src/com/android/car/notification/HeadsUpEntryTest.java"
        "src/com/android/car/notification/NotificationClickHandlerFactoryTest.java"
        "src/com/android/car/notification/NotificationDataManagerTest.java"
        "src/com/android/car/notification/NotificationGroupTest.java"
        "src/com/android/car/notification/NotificationUtilsTest.java"
        "src/com/android/car/notification/PreprocessingManagerTest.java"
        "src/com/android/car/notification/TestNotificationApplication.java"
        "src/com/android/car/notification/template/CarNotificationActionsViewTest.java"
        "src/com/android/car/notification/testutils/ShadowActivityManager.java"
        "src/com/android/car/notification/testutils/ShadowApplicationPackageManager.java"
        "src/com/android/car/notification/testutils/ShadowCar.java"
        "src/com/android/car/notification/testutils/ShadowCarAssistUtils.java"
        "src/com/android/car/notification/testutils/ShadowRingtoneManager.java"
        "src/com/android/car/notification/testutils/ShadowStatusBarNotification.java"
    ];

    libs = [
        "Robolectric_all-target"
        "robolectric_android-all-stub"
        "androidx.test.rules"
        "androidx.test.core"
        "mockito-robolectric-prebuilt"
        "truth-prebuilt"
        "testng"
        "android.car"
    ];

    java_resource_dirs = ["config"];

    instrumentation_for = "CarNotificationForTesting";

    test_options = {
        timeout = 36000;
    };
};

in { inherit CarNotificationRoboTests; }
