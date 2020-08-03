{ android_test_helper_app }:
let

#  Copyright (C) 2018 The Android Open Source Project
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

SuspendTestApp = android_test_helper_app {
    name = "SuspendTestApp";

    test_suites = ["device-tests"];

    static_libs = [
        "androidx.test.runner"
        "ub-uiautomator"
    ];

    srcs = [
        "**/*.java"
        ":servicestests-SuspendTestApp-files"
    ];

    dex_preopt = {
        enabled = false;
    };
    optimize = {
        enabled = false;
    };

    platform_apis = true;

};

in { inherit SuspendTestApp; }
