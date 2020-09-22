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

CtsManagedProfileApp = android_test_helper_app {
    name = "CtsManagedProfileApp";
    defaults = ["cts_defaults"];
    srcs = [
        "src/com/android/cts/managedprofile/AccountAuthenticator.java"
        "src/com/android/cts/managedprofile/AccountService.java"
        "src/com/android/cts/managedprofile/AllUsersActivity.java"
        "src/com/android/cts/managedprofile/BaseManagedProfileTest.java"
        "src/com/android/cts/managedprofile/BluetoothSharingRestrictionPrimaryProfileTest.java"
        "src/com/android/cts/managedprofile/BluetoothSharingRestrictionTest.java"
        "src/com/android/cts/managedprofile/BluetoothTest.java"
        "src/com/android/cts/managedprofile/CameraPolicyTest.java"
        "src/com/android/cts/managedprofile/CameraUtils.java"
        "src/com/android/cts/managedprofile/ComponentDisablingActivity.java"
        "src/com/android/cts/managedprofile/ContactsTest.java"
        "src/com/android/cts/managedprofile/CrossProfileCalendarTest.java"
        "src/com/android/cts/managedprofile/CrossProfileIntentFilterTest.java"
        "src/com/android/cts/managedprofile/CrossProfileNotificationListenerService.java"
        "src/com/android/cts/managedprofile/CrossProfileSharingTest.java"
        "src/com/android/cts/managedprofile/CrossProfileTest.java"
        "src/com/android/cts/managedprofile/CrossProfileUtils.java"
        "src/com/android/cts/managedprofile/CrossProfileWidgetPrimaryUserTest.java"
        "src/com/android/cts/managedprofile/CrossProfileWidgetTest.java"
        "src/com/android/cts/managedprofile/CurrentApiHelper.java"
        "src/com/android/cts/managedprofile/CurrentApiHelperTest.java"
        "src/com/android/cts/managedprofile/DeviceIdentifiersTest.java"
        "src/com/android/cts/managedprofile/DevicePolicyLoggingTest.java"
        "src/com/android/cts/managedprofile/DevicePolicyManagerParentSupportTest.java"
        "src/com/android/cts/managedprofile/DisallowSharingIntoProfileTest.java"
        "src/com/android/cts/managedprofile/DummyConnectionService.java"
        "src/com/android/cts/managedprofile/DummyCrossProfileViewEventActivity.java"
        "src/com/android/cts/managedprofile/DummyDialerActivity.java"
        "src/com/android/cts/managedprofile/IsUsingUnifiedPasswordTest.java"
        "src/com/android/cts/managedprofile/LauncherAppsTest.java"
        "src/com/android/cts/managedprofile/LockProfileReceiver.java"
        "src/com/android/cts/managedprofile/ManagedProfileActivity.java"
        "src/com/android/cts/managedprofile/ManagedProfileSetupTest.java"
        "src/com/android/cts/managedprofile/MissedCallNotificationReceiver.java"
        "src/com/android/cts/managedprofile/NfcTest.java"
        "src/com/android/cts/managedprofile/NotificationListener.java"
        "src/com/android/cts/managedprofile/NotificationListenerTest.java"
        "src/com/android/cts/managedprofile/OrganizationInfoTest.java"
        "src/com/android/cts/managedprofile/ParentProfileTest.java"
        "src/com/android/cts/managedprofile/PasswordMinimumRestrictionsTest.java"
        "src/com/android/cts/managedprofile/PhoneAccountTest.java"
        "src/com/android/cts/managedprofile/PreManagedProfileTest.java"
        "src/com/android/cts/managedprofile/PrimaryUserActivity.java"
        "src/com/android/cts/managedprofile/PrimaryUserAdminHelper.java"
        "src/com/android/cts/managedprofile/PrimaryUserDeviceAdmin.java"
        "src/com/android/cts/managedprofile/PrimaryUserFilterSetterActivity.java"
        "src/com/android/cts/managedprofile/PrimaryUserTest.java"
        "src/com/android/cts/managedprofile/ProfileTimeoutTestHelper.java"
        "src/com/android/cts/managedprofile/ProvisioningSuccessActivity.java"
        "src/com/android/cts/managedprofile/ProvisioningTest.java"
        "src/com/android/cts/managedprofile/ResetPasswordWithTokenTest.java"
        "src/com/android/cts/managedprofile/RingtoneSyncTest.java"
        "src/com/android/cts/managedprofile/SanityTest.java"
        "src/com/android/cts/managedprofile/SetPolicyActivity.java"
        "src/com/android/cts/managedprofile/SettingsIntentsTest.java"
        "src/com/android/cts/managedprofile/TestActivity.java"
        "src/com/android/cts/managedprofile/TimeoutActivity.java"
        "src/com/android/cts/managedprofile/TrustAgentInfoTest.java"
        "src/com/android/cts/managedprofile/UserManagerTest.java"
        "src/com/android/cts/managedprofile/Utils.java"
        "src/com/android/cts/managedprofile/WebViewActivity.java"
        "src/com/android/cts/managedprofile/WifiTest.java"
        "src/com/android/cts/managedprofile/WipeDataNotificationTest.java"
        "src/com/android/cts/managedprofile/WipeDataReceiver.java"
    ];
    libs = [
        "android.test.runner.stubs"
        "junit"
        "android.test.base.stubs"
    ];
    static_libs = [
        "ctstestrunner-axt"
        "compatibility-device-util-axt"
        "ub-uiautomator"
        "androidx.test.rules"
        "guava"
        "truth-prebuilt"
        "testng"
        "androidx.legacy_legacy-support-v4"
    ];
    min_sdk_version = "27";
    #  tag this module as a cts test artifact
    test_suites = [
        "arcts"
        "cts"
        "vts10"
        "general-tests"
    ];
    platform_apis = true;
};

in { inherit CtsManagedProfileApp; }
