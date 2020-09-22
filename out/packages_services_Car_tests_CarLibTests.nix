{ android_app, android_robolectric_test }:
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

CarLibTestApp = android_app {
    name = "CarLibTestApp";
    platform_apis = true;
};

# ###########################################################
#  Robolectric test target for testing car test lib classes #
# ###########################################################
CarLibTests = android_robolectric_test {
    enabled = true;

    name = "CarLibTests";

    srcs = [
        "src/android/car/CarAppFocusManagerTest.java"
        "src/android/car/CarNavigationStatusManagerTest.java"
        "src/android/car/CarProjectionManagerTest.java"
        "src/android/car/CarPropertyManagerTest.java"
        "src/android/car/CarUxRestrictionsManagerTest.java"
    ];

    java_resource_dirs = ["config"];

    libs = [
        "Robolectric_all-target"
        "robolectric_android-all-stub"
        "mockito-robolectric-prebuilt"
        "truth-prebuilt"
        "androidx.test.core"
        "android.car.testapi"
        "androidx.test.rules"
    ];

    instrumentation_for = "CarLibTestApp";

};

in { inherit CarLibTestApp CarLibTests; }
