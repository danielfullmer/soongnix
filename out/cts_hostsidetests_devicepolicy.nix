{ java_test_host }:
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

CtsDevicePolicyManagerTestCases = java_test_host {
    name = "CtsDevicePolicyManagerTestCases";
    defaults = ["cts_defaults"];
    srcs = [
        "src/com/android/cts/devicepolicy/AccountCheckHostSideTest.java"
        "src/com/android/cts/devicepolicy/AdbProvisioningTests.java"
        "src/com/android/cts/devicepolicy/BaseDeviceAdminHostSideTest.java"
        "src/com/android/cts/devicepolicy/BaseDeviceAdminServiceTest.java"
        "src/com/android/cts/devicepolicy/BaseDevicePolicyTest.java"
        "src/com/android/cts/devicepolicy/BaseLauncherAppsTest.java"
        "src/com/android/cts/devicepolicy/BaseManagedProfileTest.java"
        "src/com/android/cts/devicepolicy/CrossProfileAppsHostSideTest.java"
        "src/com/android/cts/devicepolicy/CrossProfileAppsPermissionHostSideTest.java"
        "src/com/android/cts/devicepolicy/CustomDeviceOwnerTest.java"
        "src/com/android/cts/devicepolicy/CustomManagedProfileTest.java"
        "src/com/android/cts/devicepolicy/DeviceAdminHelper.java"
        "src/com/android/cts/devicepolicy/DeviceAdminHostSideTestApi23.java"
        "src/com/android/cts/devicepolicy/DeviceAdminHostSideTestApi24.java"
        "src/com/android/cts/devicepolicy/DeviceAdminHostSideTestApi29.java"
        "src/com/android/cts/devicepolicy/DeviceAdminServiceDeviceOwnerTest.java"
        "src/com/android/cts/devicepolicy/DeviceAdminServiceProfileOwnerTest.java"
        "src/com/android/cts/devicepolicy/DeviceAndProfileOwnerHostSideTransferTest.java"
        "src/com/android/cts/devicepolicy/DeviceAndProfileOwnerTest.java"
        "src/com/android/cts/devicepolicy/DeviceAndProfileOwnerTestApi25.java"
        "src/com/android/cts/devicepolicy/DeviceOwnerPlusProfileOwnerTest.java"
        "src/com/android/cts/devicepolicy/DeviceOwnerTest.java"
        "src/com/android/cts/devicepolicy/EphemeralUserTest.java"
        "src/com/android/cts/devicepolicy/LauncherAppsMultiUserTest.java"
        "src/com/android/cts/devicepolicy/LauncherAppsProfileTest.java"
        "src/com/android/cts/devicepolicy/LauncherAppsSingleUserTest.java"
        "src/com/android/cts/devicepolicy/LimitAppIconHidingTest.java"
        "src/com/android/cts/devicepolicy/ManagedProfileContactsTest.java"
        "src/com/android/cts/devicepolicy/ManagedProfileCrossProfileTest.java"
        "src/com/android/cts/devicepolicy/ManagedProfilePasswordTest.java"
        "src/com/android/cts/devicepolicy/ManagedProfileProvisioningSingleAdminTest.java"
        "src/com/android/cts/devicepolicy/ManagedProfileProvisioningTest.java"
        "src/com/android/cts/devicepolicy/ManagedProfileRingtoneTest.java"
        "src/com/android/cts/devicepolicy/ManagedProfileTest.java"
        "src/com/android/cts/devicepolicy/ManagedProfileTimeoutTest.java"
        "src/com/android/cts/devicepolicy/ManagedProfileWipeTest.java"
        "src/com/android/cts/devicepolicy/MixedDeviceOwnerTest.java"
        "src/com/android/cts/devicepolicy/MixedDeviceOwnerTestApi25.java"
        "src/com/android/cts/devicepolicy/MixedManagedProfileOwnerTest.java"
        "src/com/android/cts/devicepolicy/MixedManagedProfileOwnerTestApi25.java"
        "src/com/android/cts/devicepolicy/MixedProfileOwnerHostSideTransferTest.java"
        "src/com/android/cts/devicepolicy/MixedProfileOwnerTest.java"
        "src/com/android/cts/devicepolicy/MixedProfileOwnerTestApi25.java"
        "src/com/android/cts/devicepolicy/OrgOwnedProfileOwnerTest.java"
        "src/com/android/cts/devicepolicy/PasswordComplexityTest.java"
        "src/com/android/cts/devicepolicy/ProfileOwnerTest.java"
        "src/com/android/cts/devicepolicy/ProfileOwnerTestApi23.java"
        "src/com/android/cts/devicepolicy/QuietModeHostsideTest.java"
        "src/com/android/cts/devicepolicy/UserActivityEmulator.java"
        "src/com/android/cts/devicepolicy/UserRestrictionsTest.java"
        "src/com/android/cts/devicepolicy/annotations/LockSettingsTest.java"
        "src/com/android/cts/devicepolicy/annotations/PermissionsTest.java"
        "src/com/android/cts/devicepolicy/crossprofile/CrossProfileAppsManagedProfileTest.java"
        "src/com/android/cts/devicepolicy/metrics/AtomMetricTester.java"
        "src/com/android/cts/devicepolicy/metrics/DevicePolicyEventLogVerifier.java"
        "src/com/android/cts/devicepolicy/metrics/DevicePolicyEventWrapper.java"
    ];
    libs = [
        "tools-common-prebuilt"
        "cts-tradefed"
        "tradefed"
        "compatibility-host-util"
        "compatibility-host-util-axt"
        "guava"
        "truth-prebuilt"
    ];
    #  tag this module as a cts test artifact
    test_suites = [
        "arcts"
        "cts"
        "general-tests"
        "vts10"
    ];
    java_resource_dirs = ["res"];
    data = [":current-api-xml"];
};

in { inherit CtsDevicePolicyManagerTestCases; }
