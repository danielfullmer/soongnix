{ android_test }:
let

#
#  Copyright (C) 2016 The Android Open Source Project
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

ContactsProviderTests2 = android_test {
    name = "ContactsProviderTests2";
    static_libs = [
        "ContactsProviderTestUtils"
        "androidx.test.rules"
        "mockito-target-minus-junit4"
    ];
    libs = [
        "android.test.runner"
        "android.test.base"
    ];
    srcs = ["src/**/*.java"];
    platform_apis = true;
    test_suites = ["device-tests"];
    instrumentation_for = "ContactsProvider";
    certificate = "shared";
    optimize = {
        enabled = false;
    };
};

in { inherit ContactsProviderTests2; }
