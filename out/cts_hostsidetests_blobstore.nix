{ android_test_helper_app, java_test_host }:
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

CtsBlobStoreHostTestCases = java_test_host {
    name = "CtsBlobStoreHostTestCases";
    defaults = ["cts_defaults"];
    srcs = [
        "src/com/android/cts/host/blob/BaseBlobStoreHostTest.java"
        "src/com/android/cts/host/blob/BlobStoreMultiUserTest.java"
        "src/com/android/cts/host/blob/DataCleanupTest.java"
        "src/com/android/cts/host/blob/DataPersistenceTest.java"
        "src/com/android/cts/host/blob/InstantAppAccessTest.java"
    ];
    libs = [
        "tools-common-prebuilt"
        "cts-tradefed"
        "tradefed"
        "truth-prebuilt"
    ];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

CtsBlobStoreHostTestHelper = android_test_helper_app {
    name = "CtsBlobStoreHostTestHelper";
    srcs = [
        "test-apps/BlobStoreHostTestHelper/src/com/android/cts/device/blob/BaseBlobStoreDeviceTest.java"
        "test-apps/BlobStoreHostTestHelper/src/com/android/cts/device/blob/DataCleanupTest.java"
        "test-apps/BlobStoreHostTestHelper/src/com/android/cts/device/blob/DataPersistenceTest.java"
        "test-apps/BlobStoreHostTestHelper/src/com/android/cts/device/blob/InstantAppAccessTest.java"
    ];
    static_libs = [
        "compatibility-device-util-axt"
        "androidx.test.ext.junit"
        "androidx.test.rules"
        "BlobStoreTestUtils"
        "truth-prebuilt"
        "testng"
    ];
    manifest = "test-apps/BlobStoreHostTestHelper/AndroidManifest.xml";
    sdk_version = "test_current";
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

in { inherit CtsBlobStoreHostTestCases CtsBlobStoreHostTestHelper; }
