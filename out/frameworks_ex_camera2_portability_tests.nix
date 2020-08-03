{ android_test }:
let

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

android-ex-camera2-portability-tests = android_test {
    name = "android-ex-camera2-portability-tests";
    sdk_version = "current";
    srcs = [
        "src/**/*.java"
    ];
    static_libs = [
        "android-ex-camera2-portability"
        "android-ex-camera2-utils"
        "android-ex-camera2-utils-tests"
        "androidx.test.rules"
        "mockito-target-minus-junit4"
    ];
};

in { inherit android-ex-camera2-portability-tests; }
