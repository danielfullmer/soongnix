{ android_test }:
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

CarUILibUnitTests = android_test {
    name = "CarUILibUnitTests";
    certificate = "platform";
    libs = [
        "android.test.runner"
        "android.test.base"
        "android.car"
    ];
    resource_dirs = [
        "res"
    ];
    static_libs = [
        "androidx.test.rules"
        "androidx.test.espresso.core"
        "androidx.test.espresso.contrib"
        "car-ui-lib"
        "platform-test-annotations"
        "mockito-target-inline-minus-junit4"
        "truth-prebuilt"
    ];

    jni_libs = [
        #  For mockito extended
        "libdexmakerjvmtiagent"
        "libstaticjvmtiagent"
    ];

    #  Include all test java files.
    srcs = [
        "src/com/android/car/ui/FocusAreaTest.java"
        "src/com/android/car/ui/FocusAreaTestActivity.java"
        "src/com/android/car/ui/FocusParkingViewTest.java"
        "src/com/android/car/ui/FocusParkingViewTestActivity.java"
        "src/com/android/car/ui/TestActivity.java"
        "src/com/android/car/ui/TestFocusArea.java"
        "src/com/android/car/ui/actions/LowLevelActions.java"
        "src/com/android/car/ui/actions/ViewActions.java"
        "src/com/android/car/ui/actions/WaitForViewAction.java"
        "src/com/android/car/ui/matchers/DrawableMatcher.java"
        "src/com/android/car/ui/matchers/NthChildMatcher.java"
        "src/com/android/car/ui/matchers/ViewMatchers.java"
        "src/com/android/car/ui/recyclerview/CarUiListItemTest.java"
        "src/com/android/car/ui/recyclerview/CarUiRecyclerViewTest.java"
        "src/com/android/car/ui/recyclerview/CarUiRecyclerViewTestActivity.java"
        "src/com/android/car/ui/toolbar/ToolbarTest.java"
        "src/com/android/car/ui/toolbar/ToolbarTestActivity.java"
    ];

    platform_apis = true;
    test_suites = ["device-tests"];
};

in { inherit CarUILibUnitTests; }
