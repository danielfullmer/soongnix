{ android_test, android_test_helper_app, java_test_host }:
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

CtsScopedStorageTestAppA = android_test_helper_app {
    name = "CtsScopedStorageTestAppA";
    manifest = "ScopedStorageTestHelper/TestAppA.xml";
    static_libs = ["cts-scopedstorage-lib"];
    sdk_version = "test_current";
    srcs = ["ScopedStorageTestHelper/src/android/scopedstorage/cts/ScopedStorageTestHelper.java"];
};

CtsScopedStorageTestAppB = android_test_helper_app {
    name = "CtsScopedStorageTestAppB";
    manifest = "ScopedStorageTestHelper/TestAppB.xml";
    static_libs = ["cts-scopedstorage-lib"];
    sdk_version = "test_current";
    srcs = ["ScopedStorageTestHelper/src/android/scopedstorage/cts/ScopedStorageTestHelper.java"];
};

CtsScopedStorageTestAppC = android_test_helper_app {
    name = "CtsScopedStorageTestAppC";
    manifest = "ScopedStorageTestHelper/TestAppC.xml";
    static_libs = ["cts-scopedstorage-lib"];
    sdk_version = "test_current";
    srcs = ["ScopedStorageTestHelper/src/android/scopedstorage/cts/ScopedStorageTestHelper.java"];
};

CtsScopedStorageTestAppCLegacy = android_test_helper_app {
    name = "CtsScopedStorageTestAppCLegacy";
    manifest = "ScopedStorageTestHelper/TestAppCLegacy.xml";
    static_libs = ["cts-scopedstorage-lib"];
    sdk_version = "test_current";
    target_sdk_version = "28";
    srcs = ["ScopedStorageTestHelper/src/android/scopedstorage/cts/ScopedStorageTestHelper.java"];
};

ScopedStorageTest = android_test {
    name = "ScopedStorageTest";
    manifest = "AndroidManifest.xml";
    srcs = [
        "src/android/scopedstorage/cts/PublicVolumeTest.java"
        "src/android/scopedstorage/cts/PublicVolumeTestHelper.java"
        "src/android/scopedstorage/cts/ScopedStorageTest.java"
    ];
    static_libs = [
        "truth-prebuilt"
        "cts-scopedstorage-lib"
    ];
    compile_multilib = "both";
    test_suites = [
        "general-tests"
        "mts"
        "cts"
    ];
    sdk_version = "test_current";
    java_resources = [
        ":CtsScopedStorageTestAppA"
        ":CtsScopedStorageTestAppB"
        ":CtsScopedStorageTestAppC"
        ":CtsScopedStorageTestAppCLegacy"
    ];
};

LegacyStorageTest = android_test {
    name = "LegacyStorageTest";
    manifest = "legacy/AndroidManifest.xml";
    srcs = [
        "legacy/src/android/scopedstorage/cts/legacy/LegacyStorageTest.java"
        "legacy/src/android/scopedstorage/cts/legacy/PublicVolumeLegacyTest.java"
    ];
    static_libs = [
        "truth-prebuilt"
        "cts-scopedstorage-lib"
    ];
    compile_multilib = "both";
    test_suites = [
        "general-tests"
        "mts"
        "cts"
    ];
    sdk_version = "test_current";
    target_sdk_version = "29";
    java_resources = [
        ":CtsScopedStorageTestAppA"
    ];
};

CtsScopedStorageHostTest = java_test_host {
    name = "CtsScopedStorageHostTest";
    srcs = [
        "host/src/android/scopedstorage/cts/host/LegacyStorageHostTest.java"
        "host/src/android/scopedstorage/cts/host/PublicVolumeHostTest.java"
        "host/src/android/scopedstorage/cts/host/PublicVolumeLegacyHostTest.java"
        "host/src/android/scopedstorage/cts/host/ScopedStorageHostTest.java"
        "host/src/android/scopedstorage/cts/host/ScopedStorageInstantAppHostTest.java"
    ];
    libs = [
        "tradefed"
        "testng"
    ];
    test_suites = [
        "general-tests"
        "mts"
        "cts"
    ];
    test_config = "AndroidTest.xml";
};

CtsScopedStoragePublicVolumeHostTest = java_test_host {
    name = "CtsScopedStoragePublicVolumeHostTest";
    srcs = [
        "host/src/android/scopedstorage/cts/host/LegacyStorageHostTest.java"
        "host/src/android/scopedstorage/cts/host/PublicVolumeHostTest.java"
        "host/src/android/scopedstorage/cts/host/PublicVolumeLegacyHostTest.java"
        "host/src/android/scopedstorage/cts/host/ScopedStorageHostTest.java"
        "host/src/android/scopedstorage/cts/host/ScopedStorageInstantAppHostTest.java"
    ];
    libs = [
        "tradefed"
        "testng"
    ];
    test_suites = [
        "general-tests"
        "mts"
    ];
    test_config = "PublicVolumeTest.xml";
};

in { inherit CtsScopedStorageHostTest CtsScopedStoragePublicVolumeHostTest CtsScopedStorageTestAppA CtsScopedStorageTestAppB CtsScopedStorageTestAppC CtsScopedStorageTestAppCLegacy LegacyStorageTest ScopedStorageTest; }
