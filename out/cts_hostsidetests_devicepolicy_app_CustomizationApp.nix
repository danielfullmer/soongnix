{ android_test_helper_app }:
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

CtsCustomizationApp = android_test_helper_app {
    name = "CtsCustomizationApp";
    defaults = ["cts_defaults"];
    test_suites = [
        "arcts"
        "cts"
        "vts"
        "general-tests"
    ];
    srcs = ["src/**/*.java"];
    static_libs = [
        "androidx.test.rules"
        "compatibility-device-util-axt"
    ];
    libs = ["android.test.base.stubs"];
    sdk_version = "test_current";
    min_sdk_version = "24";
};

in { inherit CtsCustomizationApp; }
