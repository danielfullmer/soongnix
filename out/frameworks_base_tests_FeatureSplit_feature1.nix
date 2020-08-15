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

FeatureSplit1 = android_test {
    name = "FeatureSplit1";
    srcs = ["src/com/android/test/split/feature/one/One.java"];
    sdk_version = "current";
    libs = ["FeatureSplitBase"];
    aaptflags = [
        "--package-id"
        "0x80"
    ] ++ [
        "--custom-package"
        "com.android.test.split.feature.one"
    ];
};

in { inherit FeatureSplit1; }
