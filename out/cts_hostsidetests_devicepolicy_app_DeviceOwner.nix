{ android_test_helper_app }:
let

#  Copyright (C) 2014 The Android Open Source Project
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

CtsDeviceOwnerApp = android_test_helper_app {
    name = "CtsDeviceOwnerApp";
    defaults = ["cts_defaults"];
    platform_apis = true;
    srcs = [
        "src/**/*.java"
        "src/**/I*.aidl"
    ];
    aidl = {
        local_include_dirs = ["src"];
    };
    libs = [
        "android.test.runner.stubs"
        "junit"
        "android.test.base.stubs"
        "bouncycastle-unbundled"
    ];
    static_libs = [
        "ctstestrunner-axt"
        "compatibility-device-util-axt"
        "androidx.test.rules"
        "cts-security-test-support-library"
        "testng"
        "truth-prebuilt"
        "androidx.legacy_legacy-support-v4"
    ];
    min_sdk_version = "21";
    #  tag this module as a cts test artifact
    test_suites = [
        "arcts"
        "cts"
        "vts"
        "general-tests"
    ];
};

in { inherit CtsDeviceOwnerApp; }
