{ android_app, android_robolectric_test }:
let

#
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
#

# ###########################################################
#  CarUi lib just for Robolectric test target.     #
# ###########################################################
CarUi = android_app {
    name = "CarUi";

    resource_dirs = [
        "res"
    ];

    platform_apis = true;

    privileged = true;

    libs = ["android.car"];

    static_libs = ["car-ui-lib"];

};

# ###############################################
#  Car Ui Robolectric test target. #
# ###############################################
CarUiRoboTests = android_robolectric_test {
    name = "CarUiRoboTests";

    srcs = [
        "src/com/android/car/ui/recyclerview/CarUiListItemTest.java"
        "src/com/android/car/ui/recyclerview/CarUiRecyclerViewAdapterTest.java"
        "src/com/android/car/ui/recyclerview/CarUiRecyclerViewTest.java"
        "src/com/android/car/ui/recyclerview/CarUiSmoothScrollerTest.java"
        "src/com/android/car/ui/recyclerview/CarUiSnapHelperTest.java"
        "src/com/android/car/ui/recyclerview/DefaultScrollBarTest.java"
        "src/com/android/car/ui/toolbar/ExtendedShadowTypeface.java"
        "src/com/android/car/ui/toolbar/ShadowAsyncLayoutInflater.java"
        "src/com/android/car/ui/toolbar/TestActivity.java"
        "src/com/android/car/ui/toolbar/ToolbarTest.java"
        "src/com/android/car/ui/utils/CarUxRestrictionsUtilTest.java"
    ];

    java_resource_dirs = ["config"];

    libs = [
        "android.car"
        "testng"
    ];

    instrumentation_for = "CarUi";
};

in { inherit CarUi CarUiRoboTests; }
