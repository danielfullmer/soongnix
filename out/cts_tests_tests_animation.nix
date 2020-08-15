{ android_test }:
let

#  Copyright (C) 2011 The Android Open Source Project
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

CtsAnimationTestCases = android_test {
    name = "CtsAnimationTestCases";
    defaults = ["cts_defaults"];

    static_libs = [
        "androidx.test.rules"
        "mockito-target-minus-junit4"
        "android-common"
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
        "platform-test-annotations"
    ];

    libs = ["android.test.runner.stubs"];

    srcs = [
        "src/android/animation/cts/AnimationActivity.java"
        "src/android/animation/cts/AnimatorListenerAdapterTest.java"
        "src/android/animation/cts/AnimatorSetTest.java"
        "src/android/animation/cts/AnimatorTest.java"
        "src/android/animation/cts/ButtonViewActivity.java"
        "src/android/animation/cts/CreationTest.java"
        "src/android/animation/cts/EvaluatorTest.java"
        "src/android/animation/cts/InterpolatorTest.java"
        "src/android/animation/cts/KeyframeTest.java"
        "src/android/animation/cts/LayoutAnimationActivity.java"
        "src/android/animation/cts/LayoutAnimationTest.java"
        "src/android/animation/cts/ObjectAnimatorTest.java"
        "src/android/animation/cts/PropertyValuesHolderTest.java"
        "src/android/animation/cts/ShapeHolder.java"
        "src/android/animation/cts/ValueAnimatorTest.java"
    ];

    test_suites = [
        "cts"
        "vts"
        "general-tests"
        "cts_instant"
    ];

    sdk_version = "test_current";
};

in { inherit CtsAnimationTestCases; }
