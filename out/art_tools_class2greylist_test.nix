{ java_test_host }:
let

#  Copyright (C) 2018 The Android Open Source Project
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

class2greylisttest = java_test_host {
    name = "class2greylisttest";

    #  Only compile source java files in this apk.
    srcs = [
        "src/com/android/class2greylist/AnnotationHandlerTestBase.java"
        "src/com/android/class2greylist/AnnotationPropertyWriterTest.java"
        "src/com/android/class2greylist/ApiComponentsTest.java"
        "src/com/android/class2greylist/ApiResolverTest.java"
        "src/com/android/class2greylist/CovariantReturnTypeHandlerTest.java"
        "src/com/android/class2greylist/RepeatedAnnotationHandlerTest.java"
        "src/com/android/class2greylist/UnsupportedAppUsageAnnotationHandlerTest.java"
    ];

    static_libs = [
        "class2greylistlib"
        "libjavac"
        "truth-host-prebuilt"
        "mockito-host"
        "junit-host"
        "objenesis"
    ];
};

in { inherit class2greylisttest; }
