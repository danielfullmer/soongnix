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

CtsAccountCheckTestOnlyOwnerApp = android_test_helper_app {
    name = "CtsAccountCheckTestOnlyOwnerApp";
    defaults = ["cts_defaults"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts"
        "general-tests"
    ];
    srcs = ["src-owner/com/android/cts/devicepolicy/accountcheck/owner/AdminReceiver.java"];
    resource_dirs = ["TestOnlyOwner/res"];
    static_libs = [
        "androidx.legacy_legacy-support-v4"
        "ctstestrunner-axt"
        "ub-uiautomator"
        "androidx.test.rules"
    ];
    sdk_version = "current";
    manifest = "TestOnlyOwner/AndroidManifest.xml";
};

CtsAccountCheckNonTestOnlyOwnerApp = android_test_helper_app {
    name = "CtsAccountCheckNonTestOnlyOwnerApp";
    defaults = ["cts_defaults"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts"
        "general-tests"
    ];
    srcs = ["src-owner/com/android/cts/devicepolicy/accountcheck/owner/AdminReceiver.java"];
    resource_dirs = ["NonTestOnlyOwner/res"];
    static_libs = [
        "androidx.legacy_legacy-support-v4"
        "ctstestrunner-axt"
        "ub-uiautomator"
        "androidx.test.rules"
    ];
    sdk_version = "current";
    manifest = "NonTestOnlyOwner/AndroidManifest.xml";
};

CtsAccountCheckTestOnlyOwnerUpdateApp = android_test_helper_app {
    name = "CtsAccountCheckTestOnlyOwnerUpdateApp";
    defaults = ["cts_defaults"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts"
        "general-tests"
    ];
    srcs = ["src-owner/com/android/cts/devicepolicy/accountcheck/owner/AdminReceiver.java"];
    resource_dirs = ["TestOnlyOwnerUpdate/res"];
    static_libs = [
        "androidx.legacy_legacy-support-v4"
        "ctstestrunner-axt"
        "ub-uiautomator"
        "androidx.test.rules"
    ];
    sdk_version = "current";
    manifest = "TestOnlyOwnerUpdate/AndroidManifest.xml";
};

in { inherit CtsAccountCheckNonTestOnlyOwnerApp CtsAccountCheckTestOnlyOwnerApp CtsAccountCheckTestOnlyOwnerUpdateApp; }
