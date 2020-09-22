{ android_test }:
let

#  Copyright (C) 2015 The Android Open Source Project
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

CtsTransitionTestCases = android_test {
    name = "CtsTransitionTestCases";
    defaults = ["cts_defaults"];

    static_libs = [
        "androidx.test.rules"
        "mockito-target-minus-junit4"
        "hamcrest-library"
        "android-common"
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
        "platform-test-annotations"
    ];

    libs = ["android.test.runner.stubs"];

    srcs = [
        "src/android/transition/cts/ActivityTransitionTest.java"
        "src/android/transition/cts/ArcMotionTest.java"
        "src/android/transition/cts/BaseTransitionTest.java"
        "src/android/transition/cts/CaptureValuesTest.java"
        "src/android/transition/cts/ChangeBoundsTest.java"
        "src/android/transition/cts/ChangeClipBoundsTest.java"
        "src/android/transition/cts/ChangeImageTransformTest.java"
        "src/android/transition/cts/ChangeScrollTest.java"
        "src/android/transition/cts/ChangeTransformTest.java"
        "src/android/transition/cts/ExplodeTest.java"
        "src/android/transition/cts/FadeTest.java"
        "src/android/transition/cts/PathMotionTest.java"
        "src/android/transition/cts/PatternPathMotionTest.java"
        "src/android/transition/cts/PropagationTest.java"
        "src/android/transition/cts/SceneTest.java"
        "src/android/transition/cts/SharedElementCallbackTest.java"
        "src/android/transition/cts/SlideBadEdgeTest.java"
        "src/android/transition/cts/SlideDefaultEdgeTest.java"
        "src/android/transition/cts/SlideEdgeTest.java"
        "src/android/transition/cts/TargetActivity.java"
        "src/android/transition/cts/TrackingVisibilityWithAnimator.java"
        "src/android/transition/cts/TransitionActivity.java"
        "src/android/transition/cts/TransitionInflaterTest.java"
        "src/android/transition/cts/TransitionListenerAdapterTest.java"
        "src/android/transition/cts/TransitionManagerTest.java"
        "src/android/transition/cts/TransitionSetTest.java"
        "src/android/transition/cts/TransitionTest.java"
        "src/android/transition/cts/VisibilityTest.java"
    ];

    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];

    sdk_version = "test_current";
};

in { inherit CtsTransitionTestCases; }
