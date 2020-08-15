{ android_test }:
let

#  Copyright 2015 Google Inc. All Rights Reserved.
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

PowerPerfTest = android_test {
    name = "PowerPerfTest";
    sdk_version = "current";
    static_libs = [
        "PowerTestHelper-src"
        "ub-uiautomator"
        "junit"
    ];
    libs = ["android.test.base.stubs"];
    certificate = "platform";
    srcs = ["src/com/android/powerperf/tests/PowerPerfTest.java"];

    test_suites = ["device-tests"];
};

in { inherit PowerPerfTest; }
