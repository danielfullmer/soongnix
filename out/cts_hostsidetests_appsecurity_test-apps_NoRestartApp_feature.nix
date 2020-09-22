{ android_test_helper_app }:
let

#
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
#

CtsNoRestartFeature = android_test_helper_app {
    name = "CtsNoRestartFeature";
    defaults = ["cts_support_defaults"];
    srcs = ["src/com/android/cts/norestart/feature/NoRestartFeatureActivity.java"];
    resource_dirs = ["res"];
    sdk_version = "current";
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    libs = ["CtsNoRestartBase"];
    aaptflags = [
        "--package-id 0x80"
        "--rename-manifest-package com.android.cts.norestart"
    ];
};

in { inherit CtsNoRestartFeature; }