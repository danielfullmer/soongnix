{ android_test_helper_app, java_library }:
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

CtsBatterySavingAppTargetApiCurrent = android_test_helper_app {
    name = "CtsBatterySavingAppTargetApiCurrent";
    defaults = ["cts_defaults"];
    static_libs = ["CtsBatterSavingAppTargetLib"];
    sdk_version = "test_current";
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsBatterSavingAppTargetLib = java_library {
    name = "CtsBatterSavingAppTargetLib";
    defaults = ["cts_defaults"];
    srcs = [
        "src/android/os/cts/batterysaving/app/CommReceiver.java"
        "src/android/os/cts/batterysaving/app/TestService.java"
    ];
    static_libs = [
        "BatterySavingCtsCommon"
        "androidx.test.rules"
        "androidx.legacy_legacy-support-v4"
        "mockito-target-minus-junit4"
        "compatibility-device-util-axt"
        "ub-uiautomator"
    ];
    sdk_version = "test_current";
};

in { inherit CtsBatterSavingAppTargetLib CtsBatterySavingAppTargetApiCurrent; }
