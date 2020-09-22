{ android_test_helper_app }:
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

CtsProfileSerialNumberApp = android_test_helper_app {
    name = "CtsProfileSerialNumberApp";
    defaults = ["cts_defaults"];
    static_libs = [
        "androidx.test.rules"
        "platform-test-annotations"
        "compatibility-device-util-axt"
    ];
    srcs = ["src/android/cts/backup/profileserialnumberapp/ProfileSerialNumberTest.java"];
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
    ];
    #  Uncomment when b/78787392 is fixed
    #  sdk_version: "system_test_current",
    platform_apis = true;
};

in { inherit CtsProfileSerialNumberApp; }
