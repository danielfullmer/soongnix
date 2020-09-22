{ android_test_helper_app }:
let

#
#  Copyright (C) 2017 The Android Open Source Project
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

CtsAccessSerialModern = android_test_helper_app {
    name = "CtsAccessSerialModern";
    defaults = ["cts_support_defaults"];
    static_libs = [
        "compatibility-device-util-axt"
        "androidx.test.rules"
    ];
    srcs = ["src/android/os/cts/AccessSerialModernTest.java"];
    sdk_version = "test_current";
    min_sdk_version = "27";
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    optimize = {
        enabled = false;
    };
    dex_preopt = {
        enabled = false;
    };
};

in { inherit CtsAccessSerialModern; }
