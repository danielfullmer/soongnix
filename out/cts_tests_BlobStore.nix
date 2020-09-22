{ android_test, android_test_helper_app, filegroup }:
let

#  Copyright (C) 2019 The Android Open Source Project
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

CtsBlobStoreTestCases = android_test {
    name = "CtsBlobStoreTestCases";
    defaults = ["cts_defaults"];
    static_libs = [
        "androidx.test.ext.junit"
        "androidx.test.rules"
        "compatibility-device-util-axt"
        "guava"
        "truth-prebuilt"
        "testng"
        "BlobStoreTestUtils"
    ];
    srcs = [
        "src/com/android/cts/blob/BlobStoreManagerTest.java"
        "src/com/android/cts/blob/BlobStoreTestRunner.java"
        "src/com/android/cts/blob/DumpOnFailureRule.java"
        ":CtsBlobStoreTestsAidl"
    ];
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    sdk_version = "test_current";
};

CtsBlobStoreTestHelper = android_test_helper_app {
    name = "CtsBlobStoreTestHelper";
    defaults = ["cts_defaults"];
    static_libs = [
        "androidx.test.ext.junit"
        "truth-prebuilt"
        "BlobStoreTestUtils"
    ];
    srcs = [
        "helper-app/src/com/android/cts/blob/helper/BlobStoreTestService.java"
        ":CtsBlobStoreTestsAidl"
    ];
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    manifest = "helper-app/AndroidManifest.xml";
    sdk_version = "test_current";
};

CtsBlobStoreTestHelperDiffSig = android_test_helper_app {
    name = "CtsBlobStoreTestHelperDiffSig";
    defaults = ["cts_defaults"];
    static_libs = [
        "androidx.test.ext.junit"
        "truth-prebuilt"
        "BlobStoreTestUtils"
    ];
    srcs = [
        "helper-app/src/com/android/cts/blob/helper/BlobStoreTestService.java"
        ":CtsBlobStoreTestsAidl"
    ];
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    manifest = "helper-app/AndroidManifest.xml";
    aaptflags = [
        "--rename-manifest-package com.android.cts.blob.helper2"
    ];
    certificate = ":cts-blob-helper-cert";
    sdk_version = "test_current";
};

CtsBlobStoreTestHelperDiffSig2 = android_test_helper_app {
    name = "CtsBlobStoreTestHelperDiffSig2";
    defaults = ["cts_defaults"];
    static_libs = [
        "androidx.test.ext.junit"
        "truth-prebuilt"
        "BlobStoreTestUtils"
    ];
    srcs = [
        "helper-app/src/com/android/cts/blob/helper/BlobStoreTestService.java"
        ":CtsBlobStoreTestsAidl"
    ];
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    manifest = "helper-app/AndroidManifest.xml";
    aaptflags = [
        "--rename-manifest-package com.android.cts.blob.helper3"
    ];
    certificate = ":cts-blob-helper-cert2";
    sdk_version = "test_current";
};

CtsBlobStoreTestsAidl = filegroup {
    name = "CtsBlobStoreTestsAidl";
    srcs = [
        "aidl/com/android/cts/blob/ICommandReceiver.aidl"
    ];
};

in { inherit CtsBlobStoreTestCases CtsBlobStoreTestHelper CtsBlobStoreTestHelperDiffSig CtsBlobStoreTestHelperDiffSig2 CtsBlobStoreTestsAidl; }
