{ android_test_helper_app }:
let

#  Copyright (C) 2012 The Android Open Source Project
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

CtsDeviceTaskSwitchingAppA = android_test_helper_app {
    name = "CtsDeviceTaskSwitchingAppA";
    defaults = ["cts_support_defaults"];
    #  don't include this package in any target
    static_libs = [
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
    ];
    srcs = ["src/android/taskswitching/appa/AppAActivity.java"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    sdk_version = "test_current";
};

in { inherit CtsDeviceTaskSwitchingAppA; }
