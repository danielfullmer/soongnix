{ android_test }:
let

#  Copyright 2020 Google Inc. All Rights Reserved.
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

NullHomeTest = android_test {
    name = "NullHomeTest";
    srcs = ["src/com/android/test/nullhome/NullHomeTest.java"];
    certificate = "platform";
    platform_apis = true;
    static_libs = ["android-support-test"];
    test_suites = ["device-tests"];
};

in { inherit NullHomeTest; }