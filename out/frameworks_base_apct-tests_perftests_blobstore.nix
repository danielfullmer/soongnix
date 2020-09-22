{ android_test }:
let

#  Copyright (C) 2020 The Android Open Source Project
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

BlobStorePerfTests = android_test {
    name = "BlobStorePerfTests";
    srcs = [
        "src/com/android/perftests/blob/AtraceUtils.java"
        "src/com/android/perftests/blob/BlobStorePerfTests.java"
    ];
    static_libs = [
        "BlobStoreTestUtils"
        "androidx.test.rules"
        "androidx.annotation_annotation"
        "apct-perftests-utils"
        "ub-uiautomator"
    ];
    platform_apis = true;
    test_suites = ["device-tests"];
    certificate = "platform";
};

in { inherit BlobStorePerfTests; }