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

CtsFragmentTestCases = android_test {
    name = "CtsFragmentTestCases";
    defaults = ["cts_defaults"];

    dex_preopt = {
        enabled = false;
    };

    optimize = {
        enabled = false;
    };

    static_libs = [
        "androidx.test.rules"
        "mockito-target-minus-junit4"
        "android-common"
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
    ];
    libs = ["android.test.base.stubs"];

    srcs = [
        "src/android/fragment/cts/ConfigOnStopActivity.java"
        "src/android/fragment/cts/CountCallsFragment.java"
        "src/android/fragment/cts/FragmentAnimatorTest.java"
        "src/android/fragment/cts/FragmentExecuteTests.java"
        "src/android/fragment/cts/FragmentLifecycleTest.java"
        "src/android/fragment/cts/FragmentManagerConfigTest.java"
        "src/android/fragment/cts/FragmentReorderingTest.java"
        "src/android/fragment/cts/FragmentTestActivity.java"
        "src/android/fragment/cts/FragmentTestUtil.java"
        "src/android/fragment/cts/FragmentTransactionTest.java"
        "src/android/fragment/cts/FragmentTransitionTest.java"
        "src/android/fragment/cts/FragmentViewTests.java"
        "src/android/fragment/cts/HostCallbacks.java"
        "src/android/fragment/cts/LoaderActivity.java"
        "src/android/fragment/cts/LoaderTest.java"
        "src/android/fragment/cts/NestedInflatedFragmentTest.java"
        "src/android/fragment/cts/NewIntentActivity.java"
        "src/android/fragment/cts/PostponedTransitionTest.java"
        "src/android/fragment/cts/PrimaryNavFragmentTest.java"
        "src/android/fragment/cts/RecreatedActivity.java"
        "src/android/fragment/cts/ReentrantFragment.java"
        "src/android/fragment/cts/StrictFragment.java"
        "src/android/fragment/cts/StrictViewFragment.java"
        "src/android/fragment/cts/TransitionFragment.java"
    ];

    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];

    sdk_version = "test_current";
};

in { inherit CtsFragmentTestCases; }
