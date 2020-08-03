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

LatinIMETests = android_test {
    name = "LatinIMETests";

    certificate = "shared";

    aaptflags = [
        #  Do not compress dictionary files to mmap dict data runtime
        "-0 .dict"

        #  Do not compress test data file
        "-0 .txt"
    ];

    static_libs = [
        "androidx.test.rules"
        "mockito-target-minus-junit4"
    ];
    libs = [
        "android.test.mock.stubs"
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];

    #  Include all test java files.
    srcs = ["src/**/*.java"];

    instrumentation_for = "LatinIME";

    min_sdk_version = "14";
    target_sdk_version = "21";
    sdk_version = "current";
};

in { inherit LatinIMETests; }
