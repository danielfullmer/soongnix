{ android_test_helper_app }:
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

CtsMediaStorageApp = android_test_helper_app {
    name = "CtsMediaStorageApp";
    defaults = ["cts_support_defaults"];
    sdk_version = "test_current";
    static_libs = [
        "compatibility-device-util-axt"
        "androidx.test.rules"
        "ub-uiautomator"
    ];
    libs = ["android.test.base.stubs"];
    srcs = [
        "src/com/android/cts/mediastorageapp/GetResultActivity.java"
        "src/com/android/cts/mediastorageapp/MediaStorageTest.java"
        "src/com/android/cts/mediastorageapp/MediaStoreUtils.java"
    ];
    asset_dirs = ["assets"];
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsMediaStorageApp28 = android_test_helper_app {
    name = "CtsMediaStorageApp28";
    defaults = ["cts_support_defaults"];
    sdk_version = "test_current";
    static_libs = [
        "compatibility-device-util-axt"
        "androidx.test.rules"
        "ub-uiautomator"
    ];
    libs = ["android.test.base.stubs"];
    srcs = [
        "src/com/android/cts/mediastorageapp/GetResultActivity.java"
        "src/com/android/cts/mediastorageapp/MediaStorageTest.java"
        "src/com/android/cts/mediastorageapp/MediaStoreUtils.java"
    ];
    asset_dirs = ["assets"];
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    manifest = "AndroidManifest28.xml";
};

CtsMediaStorageApp29 = android_test_helper_app {
    name = "CtsMediaStorageApp29";
    defaults = ["cts_support_defaults"];
    sdk_version = "test_current";
    static_libs = [
        "compatibility-device-util-axt"
        "androidx.test.rules"
        "ub-uiautomator"
    ];
    libs = ["android.test.base.stubs"];
    srcs = [
        "src/com/android/cts/mediastorageapp/GetResultActivity.java"
        "src/com/android/cts/mediastorageapp/MediaStorageTest.java"
        "src/com/android/cts/mediastorageapp/MediaStoreUtils.java"
    ];
    asset_dirs = ["assets"];
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    manifest = "AndroidManifest29.xml";
};

in { inherit CtsMediaStorageApp CtsMediaStorageApp28 CtsMediaStorageApp29; }
