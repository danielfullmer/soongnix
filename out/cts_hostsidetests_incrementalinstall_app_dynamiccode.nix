{ android_test_helper_app }:
let

#  Copyright (C) 2020 Google Inc.
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

IncrementalTestAppDynamicCode = android_test_helper_app {
    name = "IncrementalTestAppDynamicCode";
    sdk_version = "current";
    test_suites = [
        "general-tests"
    ];
    v4_signature = true;
    export_package_resources = true;
    aapt_include_all_resources = true;
    libs = ["IncrementalTestApp"];
    srcs = ["src/android/incrementalinstall/incrementaltestapp/dynamiccode/DynamicCode.java"];
    aaptflags = [
        "--rename-manifest-package android.incrementalinstall.incrementaltestapp"
        "--package-id 0x81"
    ];
};

in { inherit IncrementalTestAppDynamicCode; }
