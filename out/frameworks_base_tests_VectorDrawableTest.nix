{ android_test }:
let

#
#  Copyright (C) 2014 The Android Open Source Project
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

VectorDrawableTest = android_test {
    name = "VectorDrawableTest";
    srcs = [
        "src/com/android/test/dynamic/AnimatedStateVectorDrawableTest.java"
        "src/com/android/test/dynamic/AnimatedVectorDrawableAttr.java"
        "src/com/android/test/dynamic/AnimatedVectorDrawableDupPerf.java"
        "src/com/android/test/dynamic/AnimatedVectorDrawableTest.java"
        "src/com/android/test/dynamic/BitmapDrawableDupe.java"
        "src/com/android/test/dynamic/BoundsCheckTest.java"
        "src/com/android/test/dynamic/ScaleDrawableTests.java"
        "src/com/android/test/dynamic/VectorCheckbox.java"
        "src/com/android/test/dynamic/VectorDrawable01.java"
        "src/com/android/test/dynamic/VectorDrawableAnimation.java"
        "src/com/android/test/dynamic/VectorDrawableDupPerf.java"
        "src/com/android/test/dynamic/VectorDrawablePerformance.java"
        "src/com/android/test/dynamic/VectorDrawableStaticPerf.java"
        "src/com/android/test/dynamic/VectorDrawableTest.java"
        "src/com/android/test/dynamic/VectorPathChecking.java"
    ];
    platform_apis = true;
};

in { inherit VectorDrawableTest; }
