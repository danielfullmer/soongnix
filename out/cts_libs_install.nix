{ android_test_helper_app, java_library }:
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

TestAppAv1 = android_test_helper_app {
    name = "TestAppAv1";
    manifest = "testapp/Av1.xml";
    sdk_version = "current";
    srcs = [
        "testapp/src/com/android/cts/install/lib/testapp/CrashingMainActivity.java"
        "testapp/src/com/android/cts/install/lib/testapp/MainActivity.java"
        "testapp/src/com/android/cts/install/lib/testapp/ProcessUserData.java"
    ];
    resource_dirs = ["testapp/res_v1"];
    apex_available = ["com.android.apex.apkrollback.test_v1"];
};

TestAppAv2 = android_test_helper_app {
    name = "TestAppAv2";
    manifest = "testapp/Av2.xml";
    sdk_version = "current";
    srcs = [
        "testapp/src/com/android/cts/install/lib/testapp/CrashingMainActivity.java"
        "testapp/src/com/android/cts/install/lib/testapp/MainActivity.java"
        "testapp/src/com/android/cts/install/lib/testapp/ProcessUserData.java"
    ];
    resource_dirs = ["testapp/res_v2"];
    apex_available = ["com.android.apex.apkrollback.test_v2"];
};

TestAppAv3 = android_test_helper_app {
    name = "TestAppAv3";
    manifest = "testapp/Av3.xml";
    sdk_version = "current";
    srcs = [
        "testapp/src/com/android/cts/install/lib/testapp/CrashingMainActivity.java"
        "testapp/src/com/android/cts/install/lib/testapp/MainActivity.java"
        "testapp/src/com/android/cts/install/lib/testapp/ProcessUserData.java"
    ];
    resource_dirs = ["testapp/res_v3"];
};

TestAppACrashingV2 = android_test_helper_app {
    name = "TestAppACrashingV2";
    manifest = "testapp/ACrashingV2.xml";
    sdk_version = "current";
    srcs = [
        "testapp/src/com/android/cts/install/lib/testapp/CrashingMainActivity.java"
        "testapp/src/com/android/cts/install/lib/testapp/MainActivity.java"
        "testapp/src/com/android/cts/install/lib/testapp/ProcessUserData.java"
    ];
    resource_dirs = ["testapp/res_v2"];
    apex_available = ["com.android.apex.apkrollback.test_v2Crashing"];
};

TestAppBv1 = android_test_helper_app {
    name = "TestAppBv1";
    manifest = "testapp/Bv1.xml";
    sdk_version = "current";
    srcs = [
        "testapp/src/com/android/cts/install/lib/testapp/CrashingMainActivity.java"
        "testapp/src/com/android/cts/install/lib/testapp/MainActivity.java"
        "testapp/src/com/android/cts/install/lib/testapp/ProcessUserData.java"
    ];
    resource_dirs = ["testapp/res_v1"];
};

TestAppBv2 = android_test_helper_app {
    name = "TestAppBv2";
    manifest = "testapp/Bv2.xml";
    sdk_version = "current";
    srcs = [
        "testapp/src/com/android/cts/install/lib/testapp/CrashingMainActivity.java"
        "testapp/src/com/android/cts/install/lib/testapp/MainActivity.java"
        "testapp/src/com/android/cts/install/lib/testapp/ProcessUserData.java"
    ];
    resource_dirs = ["testapp/res_v2"];
};

TestAppCv1 = android_test_helper_app {
    name = "TestAppCv1";
    manifest = "testapp/Cv1.xml";
    sdk_version = "current";
    srcs = [
        "testapp/src/com/android/cts/install/lib/testapp/CrashingMainActivity.java"
        "testapp/src/com/android/cts/install/lib/testapp/MainActivity.java"
        "testapp/src/com/android/cts/install/lib/testapp/ProcessUserData.java"
    ];
    resource_dirs = ["testapp/res_v1"];
};

TestAppASplitV1 = android_test_helper_app {
    name = "TestAppASplitV1";
    manifest = "testapp/Av1.xml";
    sdk_version = "current";
    srcs = [
        "testapp/src/com/android/cts/install/lib/testapp/CrashingMainActivity.java"
        "testapp/src/com/android/cts/install/lib/testapp/MainActivity.java"
        "testapp/src/com/android/cts/install/lib/testapp/ProcessUserData.java"
    ];
    resource_dirs = ["testapp/res_v1"];
    package_splits = ["anydpi"];
};

TestAppASplitV2 = android_test_helper_app {
    name = "TestAppASplitV2";
    manifest = "testapp/Av2.xml";
    sdk_version = "current";
    srcs = [
        "testapp/src/com/android/cts/install/lib/testapp/CrashingMainActivity.java"
        "testapp/src/com/android/cts/install/lib/testapp/MainActivity.java"
        "testapp/src/com/android/cts/install/lib/testapp/ProcessUserData.java"
    ];
    resource_dirs = ["testapp/res_v2"];
    package_splits = ["anydpi"];
};

cts-install-lib = java_library {
    name = "cts-install-lib";
    srcs = [
        "src/com/android/cts/install/lib/Install.java"
        "src/com/android/cts/install/lib/InstallUtils.java"
        "src/com/android/cts/install/lib/LocalIntentSender.java"
        "src/com/android/cts/install/lib/TestApp.java"
        "src/com/android/cts/install/lib/Uninstall.java"
    ];
    static_libs = [
        "androidx.test.rules"
        "compatibility-device-util-axt"
        "truth-prebuilt"
    ];
    sdk_version = "test_current";
    java_resources = [
        ":TestAppAv1"
        ":TestAppAv2"
        ":TestAppAv3"
        ":TestAppBv1"
        ":TestAppBv2"
        ":TestAppCv1"
        ":TestAppACrashingV2"
        ":TestAppASplitV1"
        ":TestAppASplitV2"
        ":StagedInstallTestApexV1"
        ":StagedInstallTestApexV2"
        ":StagedInstallTestApexV3"
    ];
};

in { inherit TestAppACrashingV2 TestAppASplitV1 TestAppASplitV2 TestAppAv1 TestAppAv2 TestAppAv3 TestAppBv1 TestAppBv2 TestAppCv1 cts-install-lib; }
