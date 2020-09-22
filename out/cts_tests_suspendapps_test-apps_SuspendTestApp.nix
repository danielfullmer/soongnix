{ android_test_helper_app }:
let

#  Copyright (C) 2020 The Android Open Source Project
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

CtsSuspendTestApp = android_test_helper_app {
    name = "CtsSuspendTestApp";
    defaults = ["cts_support_defaults"];

    srcs = [
        "src/com/android/suspendapps/suspendtestapp/Constants.java"
        "src/com/android/suspendapps/suspendtestapp/SuspendTestActivity.java"
        "src/com/android/suspendapps/suspendtestapp/SuspendTestReceiver.java"
        "src/com/android/suspendapps/suspendtestapp/TestService.java"
        ":CtsSuspendHelpersAidl"
    ];

    sdk_version = "current";

    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];

    static_libs = [
        "androidx.test.rules"
    ];
};

#  -----------------------------------------------

CtsSuspendTestApp2 = android_test_helper_app {
    name = "CtsSuspendTestApp2";
    defaults = ["cts_support_defaults"];

    srcs = [
        "src/com/android/suspendapps/suspendtestapp/Constants.java"
        "src/com/android/suspendapps/suspendtestapp/SuspendTestActivity.java"
        "src/com/android/suspendapps/suspendtestapp/SuspendTestReceiver.java"
        "src/com/android/suspendapps/suspendtestapp/TestService.java"
        ":CtsSuspendHelpersAidl"
    ];

    sdk_version = "current";

    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];

    static_libs = [
        "androidx.test.rules"
    ];

    aaptflags = [
        "--rename-manifest-package com.android.suspendapps.suspendtestapp2"
    ];
};

in { inherit CtsSuspendTestApp CtsSuspendTestApp2; }
