{ android_test_helper_app }:
let

#  Copyright (C) 2014 The Android Open Source Project
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

CtsDeviceOwnerApp = android_test_helper_app {
    name = "CtsDeviceOwnerApp";
    defaults = ["cts_defaults"];
    platform_apis = true;
    srcs = [
        "src/com/android/cts/deviceowner/AdminActionBookkeepingTest.java"
        "src/com/android/cts/deviceowner/AffiliationTest.java"
        "src/com/android/cts/deviceowner/AirplaneModeRestrictionTest.java"
        "src/com/android/cts/deviceowner/BackupServicePoliciesTest.java"
        "src/com/android/cts/deviceowner/BaseAffiliatedProfileOwnerTest.java"
        "src/com/android/cts/deviceowner/BaseDeviceOwnerTest.java"
        "src/com/android/cts/deviceowner/BasicAdminReceiver.java"
        "src/com/android/cts/deviceowner/BluetoothRestrictionTest.java"
        "src/com/android/cts/deviceowner/CreateAndManageUserTest.java"
        "src/com/android/cts/deviceowner/DeviceIdentifiersTest.java"
        "src/com/android/cts/deviceowner/DeviceOwnerProvisioningTest.java"
        "src/com/android/cts/deviceowner/DeviceOwnerSetupTest.java"
        "src/com/android/cts/deviceowner/DevicePolicyLoggingTest.java"
        "src/com/android/cts/deviceowner/HardwarePropertiesManagerTest.java"
        "src/com/android/cts/deviceowner/InstallUpdateTest.java"
        "src/com/android/cts/deviceowner/LockScreenInfoTest.java"
        "src/com/android/cts/deviceowner/NetworkLoggingTest.java"
        "src/com/android/cts/deviceowner/NotificationListener.java"
        "src/com/android/cts/deviceowner/OverrideApnTest.java"
        "src/com/android/cts/deviceowner/PackageInstallTest.java"
        "src/com/android/cts/deviceowner/PreDeviceOwnerTest.java"
        "src/com/android/cts/deviceowner/PrivateDnsPolicyTest.java"
        "src/com/android/cts/deviceowner/RemoteBugreportTest.java"
        "src/com/android/cts/deviceowner/SecurityLoggingTest.java"
        "src/com/android/cts/deviceowner/SetPolicyActivity.java"
        "src/com/android/cts/deviceowner/SetTimeTest.java"
        "src/com/android/cts/deviceowner/SystemUpdatePolicyTest.java"
        "src/com/android/cts/deviceowner/UserSessionTest.java"
        "src/com/android/cts/deviceowner/VrTemperatureTest.java"
        "src/com/android/cts/deviceowner/WifiConfigLockdownTest.java"
        "src/com/android/cts/deviceowner/WifiSetHttpProxyTest.java"
        "src/com/android/cts/deviceowner/WifiTest.java"
        "src/com/android/cts/deviceowner/ICrossUserService.aidl"
    ];
    aidl = {
        local_include_dirs = ["src"];
    };
    libs = [
        "android.test.runner.stubs"
        "junit"
        "android.test.base.stubs"
        "bouncycastle-unbundled"
    ];
    static_libs = [
        "ctstestrunner-axt"
        "compatibility-device-util-axt"
        "androidx.test.rules"
        "cts-security-test-support-library"
        "testng"
        "truth-prebuilt"
        "androidx.legacy_legacy-support-v4"
    ];
    min_sdk_version = "21";
    #  tag this module as a cts test artifact
    test_suites = [
        "arcts"
        "cts"
        "vts"
        "general-tests"
    ];
};

in { inherit CtsDeviceOwnerApp; }
