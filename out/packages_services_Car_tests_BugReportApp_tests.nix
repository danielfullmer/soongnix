{ android_test }:
let

#  Copyright (C) 2019 The Android Open Source Project
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

BugReportAppTest = android_test {
    name = "BugReportAppTest";

    srcs = ["src/com/google/android/car/bugreport/BugStorageUtilsTest.java"];

    instrumentation_for = "BugReportApp";

    certificate = "platform";
    optimize = {
        enabled = false;
    };
    platform_apis = true;

    libs = [
        "android.test.base"
        "android.test.mock"
        "android.test.runner"
    ];

    static_libs = [
        "android-support-test"
        "truth-prebuilt"
    ];

    test_suites = [
        "device-tests"
    ];
};

in { inherit BugReportAppTest; }
