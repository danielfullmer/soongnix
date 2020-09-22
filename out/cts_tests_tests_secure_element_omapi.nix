{ android_test_helper_app, android_test_import }:
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

# ////////////////////////////////////////////////////////////////
#  Signed Package

signed-CtsOmapiTestCases = android_test_import {
    name = "signed-CtsOmapiTestCases";
    apk = "apk/signed-CtsOmapiTestCases.apk";

    test_suites = [
        "cts"
        "vts10"
        "general-tests"
        "cts-instant"
    ];
    #  Make sure the build system doesn't try to resign the APK
    presigned = true;
    dex_preopt = {
        enabled = false;
    };
};

# #################################################################
#  Unsigned Package

CtsOmapiTestCases = android_test_helper_app {
    name = "CtsOmapiTestCases";
    defaults = ["cts_defaults"];
    static_libs = [
        "ctstestrunner-axt"
        "compatibility-device-util-axt"
    ];
    srcs = ["src/android/omapi/cts/OmapiTest.java"];
    #  was: sdk_version: "current",
    libs = [
        "android.test.runner"
        "android.test.base"
    ];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    dist = {
        targets = ["cts"];
    };
};

in { inherit CtsOmapiTestCases signed-CtsOmapiTestCases; }