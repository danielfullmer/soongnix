{ android_test_helper_app }:
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

#  This app is meant for testing device policy permission APIs on legacy apps (pre-M)

CtsSimplePreMApp = android_test_helper_app {
    name = "CtsSimplePreMApp";
    defaults = ["cts_defaults"];
    srcs = ["src/com/android/cts/launcherapps/simplepremapp/SimpleActivity.java"];
    sdk_version = "21";
    #  tag this module as a cts test artifact
    test_suites = [
        "arcts"
        "cts"
        "vts10"
        "general-tests"
    ];
};

in { inherit CtsSimplePreMApp; }
