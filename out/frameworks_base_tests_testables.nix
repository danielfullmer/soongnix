{ java_library }:
let

#
#  Copyright (C) 2017 The Android Open Source Project
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

testables = java_library {
    name = "testables";
    srcs = [
        "src/android/testing/AndroidTestingRunner.java"
        "src/android/testing/BaseFragmentTest.java"
        "src/android/testing/DexmakerShareClassLoaderRule.java"
        "src/android/testing/LayoutInflaterBuilder.java"
        "src/android/testing/LeakCheck.java"
        "src/android/testing/PollingCheck.java"
        "src/android/testing/TestableContentResolver.java"
        "src/android/testing/TestableContext.java"
        "src/android/testing/TestableImageView.java"
        "src/android/testing/TestableInstrumentation.java"
        "src/android/testing/TestableLooper.java"
        "src/android/testing/TestablePermissions.java"
        "src/android/testing/TestableResources.java"
        "src/android/testing/TestableSettingsProvider.java"
        "src/android/testing/UiThreadTest.java"
        "src/android/testing/ViewUtils.java"
    ];
    libs = [
        "android.test.runner"
        "android.test.mock"
        "androidx.test.rules"
        "mockito-target-inline-minus-junit4"
    ];
};

in { inherit testables; }
