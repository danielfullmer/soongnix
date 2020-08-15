{ android_test }:
let

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

PrintSpoolerOutOfProcessTests = android_test {
    name = "PrintSpoolerOutOfProcessTests";

    srcs = ["src/com/android/printspooler/outofprocess/tests/WorkflowTest.java"];

    libs = ["android.test.runner.stubs"];
    static_libs = [
        "androidx.test.rules"
        "ub-uiautomator"
        "mockito-target-minus-junit4"
        "print-test-util-lib"
    ];

    sdk_version = "test_current";
    test_suites = ["device-tests"];
};

in { inherit PrintSpoolerOutOfProcessTests; }
