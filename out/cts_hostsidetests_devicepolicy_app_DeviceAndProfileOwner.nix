{ android_test_helper_app }:
let

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

CtsDeviceAndProfileOwnerApp23 = android_test_helper_app {
    name = "CtsDeviceAndProfileOwnerApp23";
    defaults = ["cts_defaults"];
    platform_apis = true;
    srcs = ["src/**/*.java"];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    static_libs = [
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
        "ub-uiautomator"
        "cts-security-test-support-library"
        "androidx.legacy_legacy-support-v4"
    ];
    resource_dirs = ["res"];
    asset_dirs = ["assets"];
    min_sdk_version = "23";
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts"
        "general-tests"
    ];
    manifest = "api23/AndroidManifest.xml";
};

CtsDeviceAndProfileOwnerApp25 = android_test_helper_app {
    name = "CtsDeviceAndProfileOwnerApp25";
    defaults = ["cts_defaults"];
    platform_apis = true;
    srcs = ["src/**/*.java"];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    static_libs = [
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
        "ub-uiautomator"
        "cts-security-test-support-library"
        "androidx.legacy_legacy-support-v4"
    ];
    resource_dirs = ["res"];
    asset_dirs = ["assets"];
    min_sdk_version = "23";
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts"
        "general-tests"
    ];
    manifest = "api25/AndroidManifest.xml";
};

CtsDeviceAndProfileOwnerApp = android_test_helper_app {
    name = "CtsDeviceAndProfileOwnerApp";
    defaults = ["cts_defaults"];
    platform_apis = true;
    srcs = ["src/**/*.java"];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    static_libs = [
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
        "ub-uiautomator"
        "cts-security-test-support-library"
        "androidx.legacy_legacy-support-v4"
    ];
    resource_dirs = ["res"];
    asset_dirs = ["assets"];
    min_sdk_version = "23";
    #  tag this module as a cts test artifact
    test_suites = [
        "arcts"
        "cts"
        "vts"
        "general-tests"
    ];
    manifest = "latest/AndroidManifest.xml";
};

in { inherit CtsDeviceAndProfileOwnerApp CtsDeviceAndProfileOwnerApp23 CtsDeviceAndProfileOwnerApp25; }
