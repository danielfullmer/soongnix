{ android_test }:
let

#  Copyright (C) 2015 The Android Open Source Project
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

UbSystemUiJankTests = android_test {
    name = "UbSystemUiJankTests";
    platform_apis = true;
    srcs = ["src/**/*.java"];

    static_libs = [
        "ub-janktesthelper"
        "ub-uiautomator"
        "launcher-helper-lib"
        "timeresult-helper-lib"
        "sysui-helper"
        "collector-device-lib"
        "launcher-aosp-tapl"
    ];

    libs = ["android.test.base"];
    optimize = {
        enabled = false;
    };
    test_suites = ["device-tests"];
};

in { inherit UbSystemUiJankTests; }
