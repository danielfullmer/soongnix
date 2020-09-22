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

CtsAppDataIsolationAppA = android_test_helper_app {
    name = "CtsAppDataIsolationAppA";
    defaults = ["cts_support_defaults"];
    srcs = [
        "common/src/com/android/cts/appdataisolation/common/FileUtils.java"
        "AppA/src/com/android/cts/appdataisolation/appa/AppATests.java"
        "AppA/src/com/android/cts/appdataisolation/appa/AppZygoteIsolatedService.java"
        "AppA/src/com/android/cts/appdataisolation/appa/DummyReceiver.java"
        "AppA/src/com/android/cts/appdataisolation/appa/IsolatedService.java"
        "AppA/aidl/com/android/cts/appdataisolation/appa/IIsolatedService.aidl"
    ];
    sdk_version = "current";
    static_libs = [
        "androidx.test.rules"
        "truth-prebuilt"
        "testng"
        "ub-uiautomator"
    ];
    libs = ["android.test.base.stubs"];
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    certificate = ":cts-testkey1";
    dex_preopt = {
        enabled = false;
    };
    manifest = "AppA/AndroidManifest.xml";
};

CtsAppDataIsolationAppSharedA = android_test_helper_app {
    name = "CtsAppDataIsolationAppSharedA";
    defaults = ["cts_support_defaults"];
    srcs = [
        "common/src/com/android/cts/appdataisolation/common/FileUtils.java"
        "AppA/src/com/android/cts/appdataisolation/appa/AppATests.java"
        "AppA/src/com/android/cts/appdataisolation/appa/AppZygoteIsolatedService.java"
        "AppA/src/com/android/cts/appdataisolation/appa/DummyReceiver.java"
        "AppA/src/com/android/cts/appdataisolation/appa/IsolatedService.java"
        "AppA/aidl/com/android/cts/appdataisolation/appa/IIsolatedService.aidl"
    ];
    sdk_version = "current";
    static_libs = [
        "androidx.test.rules"
        "truth-prebuilt"
        "testng"
        "ub-uiautomator"
    ];
    libs = ["android.test.base.stubs"];
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    certificate = ":cts-testkey1";
    dex_preopt = {
        enabled = false;
    };
    manifest = "AppA/AndroidManifest_shared.xml";
};

CtsAppDataIsolationAppDirectBootA = android_test_helper_app {
    name = "CtsAppDataIsolationAppDirectBootA";
    defaults = ["cts_support_defaults"];
    srcs = [
        "common/src/com/android/cts/appdataisolation/common/FileUtils.java"
        "AppA/src/com/android/cts/appdataisolation/appa/AppATests.java"
        "AppA/src/com/android/cts/appdataisolation/appa/AppZygoteIsolatedService.java"
        "AppA/src/com/android/cts/appdataisolation/appa/DummyReceiver.java"
        "AppA/src/com/android/cts/appdataisolation/appa/IsolatedService.java"
        "AppA/aidl/com/android/cts/appdataisolation/appa/IIsolatedService.aidl"
    ];
    sdk_version = "current";
    static_libs = [
        "androidx.test.rules"
        "truth-prebuilt"
        "testng"
        "ub-uiautomator"
    ];
    libs = ["android.test.base.stubs"];
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    certificate = ":cts-testkey1";
    dex_preopt = {
        enabled = false;
    };
    manifest = "AppA/AndroidManifest_directboot.xml";
};

CtsAppDataIsolationAppB = android_test_helper_app {
    name = "CtsAppDataIsolationAppB";
    defaults = ["cts_support_defaults"];
    srcs = [
        "common/src/com/android/cts/appdataisolation/common/FileUtils.java"
        "AppB/src/com/android/cts/appdataisolation/appb/AppBTests.java"
    ];
    sdk_version = "current";
    static_libs = [
        "androidx.test.rules"
        "truth-prebuilt"
        "testng"
    ];
    libs = ["android.test.base.stubs"];
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    certificate = ":cts-testkey1";
    dex_preopt = {
        enabled = false;
    };
    manifest = "AppB/AndroidManifest.xml";
};

CtsAppDataIsolationAppSharedB = android_test_helper_app {
    name = "CtsAppDataIsolationAppSharedB";
    defaults = ["cts_support_defaults"];
    srcs = [
        "common/src/com/android/cts/appdataisolation/common/FileUtils.java"
        "AppB/src/com/android/cts/appdataisolation/appb/AppBTests.java"
    ];
    sdk_version = "current";
    static_libs = [
        "androidx.test.rules"
        "truth-prebuilt"
        "testng"
    ];
    libs = ["android.test.base.stubs"];
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    certificate = ":cts-testkey1";
    dex_preopt = {
        enabled = false;
    };
    manifest = "AppB/AndroidManifest_shared.xml";
};

in { inherit CtsAppDataIsolationAppA CtsAppDataIsolationAppB CtsAppDataIsolationAppDirectBootA CtsAppDataIsolationAppSharedA CtsAppDataIsolationAppSharedB; }
