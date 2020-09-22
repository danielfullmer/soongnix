{ android_test }:
let

#
#  Copyright (C) 2020 The Android Open Source Project
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

CarSecurityPermissionTest = android_test {
    name = "CarSecurityPermissionTest";

    srcs = [
        "src/com/android/car/CarPermisisonTest.java"
        "src/com/android/car/CarPropertyManagerPublicPermissionTest.java"
        "src/com/android/car/CarPublicPermissionTest.java"
        "src/com/android/car/content/pm/CarPackageManagerPermissionTest.java"
        "src/com/android/car/input/CarInputManagerPermisisonTest.java"
        "src/com/android/car/media/CarAudioManagerPermissionTest.java"
        "src/com/android/car/media/CarAudioManagerPublicPermissionTest.java"
        "src/com/android/car/user/CarUserManagerPermissionTest.java"
    ];

    libs = [
        "android.car"
        "android.test.runner"
        "android.test.base"
        "android.test.mock"
    ];

    static_libs = [
        "androidx.test.core"
        "androidx.test.ext.junit"
        "androidx.test.rules"
        "car-frameworks-service"
        "compatibility-device-util-axt"
        "mockito-target-minus-junit4"
        "testng"
        "truth-prebuilt"
    ];

    platform_apis = true;

    certificate = "platform";
};

in { inherit CarSecurityPermissionTest; }