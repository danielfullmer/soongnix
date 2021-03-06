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

WindowAnimationJank = android_test {
    name = "WindowAnimationJank";
    srcs = [
        "src/android/windowanimationjank/ElementLayoutActivity.java"
        "src/android/windowanimationjank/FlowLayout.java"
        "src/android/windowanimationjank/FullscreenRotationTest.java"
        "src/android/windowanimationjank/Utils.java"
        "src/android/windowanimationjank/WindowAnimationJankTestBase.java"
    ];
    static_libs = [
        "ub-uiautomator"
        "androidx.test.janktesthelper"
        "junit"
    ];
    libs = ["android.test.base.stubs"];
    sdk_version = "current";
};

in { inherit WindowAnimationJank; }
