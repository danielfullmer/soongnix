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

#  IMPORTANT: We build two apps from the same source but with different package name.
#  This allow us to have different device owner and profile owner, some APIs may behave differently
#  in this situation.

#  === App 1 ===

CtsCorpOwnedManagedProfile = android_test_helper_app {
    name = "CtsCorpOwnedManagedProfile";
    defaults = ["cts_defaults"];
    srcs = [
        "src/com/android/cts/comp/AdminReceiver.java"
        "src/com/android/cts/comp/BindDeviceAdminServiceFailsTest.java"
        "src/com/android/cts/comp/BindDeviceAdminServiceGoodSetupTest.java"
        "src/com/android/cts/comp/DeviceWideLoggingFeaturesTest.java"
        "src/com/android/cts/comp/ManagementTest.java"
        "src/com/android/cts/comp/ProtectedCrossUserService.java"
        "src/com/android/cts/comp/UnprotectedCrossUserService.java"
        "src/com/android/cts/comp/Utils.java"
        "src/com/android/cts/comp/WipeDataReceiver.java"
        "src/com/android/cts/comp/provisioning/AffiliationTest.java"
        "src/com/android/cts/comp/provisioning/ManagedProfileProvisioningTest.java"
        "src/com/android/cts/comp/provisioning/UserRestrictionTest.java"
        "src/com/android/cts/comp/ICrossUserService.aidl"
    ];
    aidl = {
        local_include_dirs = ["src"];
    };
    libs = [
        "android.test.runner.stubs"
        "junit"
        "android.test.base.stubs"
    ];
    static_libs = [
        "ctstestrunner-axt"
        "compatibility-device-util-axt"
    ];
    sdk_version = "test_current";
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

#  === App 2 ===
CtsCorpOwnedManagedProfile2 = android_test_helper_app {
    name = "CtsCorpOwnedManagedProfile2";
    defaults = ["cts_defaults"];
    srcs = [
        "src/com/android/cts/comp/AdminReceiver.java"
        "src/com/android/cts/comp/BindDeviceAdminServiceFailsTest.java"
        "src/com/android/cts/comp/BindDeviceAdminServiceGoodSetupTest.java"
        "src/com/android/cts/comp/DeviceWideLoggingFeaturesTest.java"
        "src/com/android/cts/comp/ManagementTest.java"
        "src/com/android/cts/comp/ProtectedCrossUserService.java"
        "src/com/android/cts/comp/UnprotectedCrossUserService.java"
        "src/com/android/cts/comp/Utils.java"
        "src/com/android/cts/comp/WipeDataReceiver.java"
        "src/com/android/cts/comp/provisioning/AffiliationTest.java"
        "src/com/android/cts/comp/provisioning/ManagedProfileProvisioningTest.java"
        "src/com/android/cts/comp/provisioning/UserRestrictionTest.java"
        "src/com/android/cts/comp/ICrossUserService.aidl"
    ];
    aidl = {
        local_include_dirs = ["src"];
    };
    libs = [
        "android.test.runner.stubs"
        "junit"
        "android.test.base.stubs"
    ];
    static_libs = [
        "ctstestrunner-axt"
        "compatibility-device-util-axt"
    ];
    sdk_version = "test_current";
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    aaptflags = [
        "--rename-manifest-package"
        "com.android.cts.comp2"
        "--rename-instrumentation-target-package"
        "com.android.cts.comp2"
    ];
};

in { inherit CtsCorpOwnedManagedProfile CtsCorpOwnedManagedProfile2; }
