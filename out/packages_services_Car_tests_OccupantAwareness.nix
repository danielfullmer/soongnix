{ android_test }:
let

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

OccupantAwarenessSystemTests = android_test {
    name = "OccupantAwarenessSystemTests";

    srcs = [
        "src/com/android/car/test/OccupantAwarenessServiceIntegrationTest.java"
        "src/com/android/car/test/OccupantAwarenessSystemServiceTest.java"
        "src/com/android/car/test/OccupantAwarenessUtilsTest.java"
    ];

    instrumentation_for = "CarService";

    optimize = {
        enabled = false;
    };

    certificate = "platform";
    platform_apis = true;
    privileged = true;

    libs = [
        "android.car"
        "android.test.base"
        "android.test.mock"
        "android.test.runner"
        #  After here
        "android.car-test-stubs"
        "android.car.testapi"
    ];

    static_libs = [
        "android-support-test"
        "truth-prebuilt"
        "android.hardware.automotive.occupant_awareness-java"
        "android.test.base.stubs"
        "car-service-test-static-lib"
        "androidx.test.core"
        "androidx.test.ext.junit"
        "androidx.test.rules"
        "car-frameworks-service"
    ];
};

in { inherit OccupantAwarenessSystemTests; }
