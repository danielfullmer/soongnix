{ java_library }:
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

BlobStoreTestUtils = java_library {
    name = "BlobStoreTestUtils";
    srcs = [
        "src/com/android/utils/blob/DummyBlobData.java"
        "src/com/android/utils/blob/Utils.java"
    ];
    static_libs = [
        "truth-prebuilt"
        "androidx.test.uiautomator_uiautomator"
        "androidx.test.ext.junit"
    ];
    sdk_version = "test_current";
};

in { inherit BlobStoreTestUtils; }
