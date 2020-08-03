{ android_test }:
let

#  Copyright 2016 Google Inc. All Rights Reserved.
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

BootHelperApp = android_test {
    name = "BootHelperApp";

    #  Only compile source java files in this apk.
    srcs = ["src/**/*.java"];

    sdk_version = "current";
    libs = ["android.test.runner.stubs"];
    static_libs = [
        "android-support-test"
        "ub-uiautomator"
    ];

    test_suites = ["device-tests"];
};

in { inherit BootHelperApp; }
