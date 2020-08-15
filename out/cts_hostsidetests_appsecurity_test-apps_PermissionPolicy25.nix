{ android_test }:
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

CtsPermissionPolicyTest25 = android_test {
    name = "CtsPermissionPolicyTest25";
    defaults = ["cts_support_defaults"];
    static_libs = [
        "androidx.test.rules"
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
    ];
    srcs = ["src/com/android/cts/permission/policy/PermissionPolicyTest25.java"];
    sdk_version = "test_current";
    min_sdk_version = "25";
    test_suites = [
        "cts"
        "vts"
        "general-tests"
        "mts"
    ];
    optimize = {
        enabled = false;
    };
    dex_preopt = {
        enabled = false;
    };
};

in { inherit CtsPermissionPolicyTest25; }
