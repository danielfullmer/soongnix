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

cts-scopedstorage-lib = java_library {
    name = "cts-scopedstorage-lib";
    srcs = [
        "src/android/scopedstorage/cts/lib/RedactionTestHelper.java"
        "src/android/scopedstorage/cts/lib/TestUtils.java"
    ];
    static_libs = [
        "androidx.test.rules"
        "cts-install-lib"
        "platform-test-annotations"
    ];
    sdk_version = "test_current";
};

in { inherit cts-scopedstorage-lib; }