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

DummyApp1 = android_test_helper_app {
    name = "DummyApp1";
    defaults = ["cts_defaults"];
    platform_apis = true;
    srcs = ["dummyapp1/src/CanInteractAcrossProfilesChangedReceiver.java"];
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
    min_sdk_version = "23";
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    manifest = "dummyapp1/AndroidManifest.xml";
};

DummyApp2 = android_test_helper_app {
    name = "DummyApp2";
    defaults = ["cts_defaults"];
    platform_apis = true;
    srcs = ["dummyapp2/src/CanInteractAcrossProfilesChangedReceiver.java"];
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
    min_sdk_version = "23";
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    manifest = "dummyapp2/AndroidManifest.xml";
};

DummyApp3 = android_test_helper_app {
    name = "DummyApp3";
    defaults = ["cts_defaults"];
    platform_apis = true;
    srcs = ["dummyapp3/src/CanInteractAcrossProfilesChangedReceiver.java"];
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
    min_sdk_version = "23";
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    manifest = "dummyapp3/AndroidManifest.xml";
};

DummyApp4 = android_test_helper_app {
    name = "DummyApp4";
    defaults = ["cts_defaults"];
    platform_apis = true;
    srcs = ["dummyapp4/src/CanInteractAcrossProfilesChangedReceiver.java"];
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
    min_sdk_version = "23";
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    manifest = "dummyapp4/AndroidManifest.xml";
};

in { inherit DummyApp1 DummyApp2 DummyApp3 DummyApp4; }
