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

CtsDeviceAndProfileOwnerApp23 = android_test_helper_app {
    name = "CtsDeviceAndProfileOwnerApp23";
    defaults = ["cts_defaults"];
    platform_apis = true;
    srcs = [
        "src/com/android/cts/deviceandprofileowner/AccessibilityServicesTest.java"
        "src/com/android/cts/deviceandprofileowner/AffiliationTest.java"
        "src/com/android/cts/deviceandprofileowner/AllowedAccountManagementTest.java"
        "src/com/android/cts/deviceandprofileowner/AlwaysOnVpnMultiStageTest.java"
        "src/com/android/cts/deviceandprofileowner/AlwaysOnVpnTest.java"
        "src/com/android/cts/deviceandprofileowner/AlwaysOnVpnUnsupportedTest.java"
        "src/com/android/cts/deviceandprofileowner/ApplicationHiddenTest.java"
        "src/com/android/cts/deviceandprofileowner/ApplicationRestrictionsIsCallerDelegateHelper.java"
        "src/com/android/cts/deviceandprofileowner/ApplicationRestrictionsTest.java"
        "src/com/android/cts/deviceandprofileowner/AssistScreenCaptureDisabledTest.java"
        "src/com/android/cts/deviceandprofileowner/AudioRestrictionTest.java"
        "src/com/android/cts/deviceandprofileowner/AutofillActivity.java"
        "src/com/android/cts/deviceandprofileowner/AutofillRestrictionsTest.java"
        "src/com/android/cts/deviceandprofileowner/BaseDeviceAdminTest.java"
        "src/com/android/cts/deviceandprofileowner/CaCertManagementTest.java"
        "src/com/android/cts/deviceandprofileowner/ClearApplicationDataTest.java"
        "src/com/android/cts/deviceandprofileowner/ClearProfileOwnerNegativeTest.java"
        "src/com/android/cts/deviceandprofileowner/ContentCaptureActivity.java"
        "src/com/android/cts/deviceandprofileowner/ContentCaptureRestrictionsTest.java"
        "src/com/android/cts/deviceandprofileowner/ContentSuggestionsActivity.java"
        "src/com/android/cts/deviceandprofileowner/ContentSuggestionsRestrictionsTest.java"
        "src/com/android/cts/deviceandprofileowner/CustomizationRestrictionsTest.java"
        "src/com/android/cts/deviceandprofileowner/DelegatedCertInstallerHelper.java"
        "src/com/android/cts/deviceandprofileowner/DelegatedCertInstallerTest.java"
        "src/com/android/cts/deviceandprofileowner/DelegationTest.java"
        "src/com/android/cts/deviceandprofileowner/DeviceIdAttestationTest.java"
        "src/com/android/cts/deviceandprofileowner/DevicePolicyLoggingTest.java"
        "src/com/android/cts/deviceandprofileowner/ExampleIntentReceivingActivity1.java"
        "src/com/android/cts/deviceandprofileowner/ExampleIntentReceivingActivity2.java"
        "src/com/android/cts/deviceandprofileowner/FbeHelper.java"
        "src/com/android/cts/deviceandprofileowner/GetCurrentFailedPasswordAttemptsTest.java"
        "src/com/android/cts/deviceandprofileowner/GetPasswordExpirationTest.java"
        "src/com/android/cts/deviceandprofileowner/InputMethodsTest.java"
        "src/com/android/cts/deviceandprofileowner/KeyManagementActivity.java"
        "src/com/android/cts/deviceandprofileowner/KeyManagementTest.java"
        "src/com/android/cts/deviceandprofileowner/LockTaskHostDrivenTest.java"
        "src/com/android/cts/deviceandprofileowner/LockTaskTest.java"
        "src/com/android/cts/deviceandprofileowner/LockTaskUtilityActivity.java"
        "src/com/android/cts/deviceandprofileowner/LockTaskUtilityActivityIfWhitelisted.java"
        "src/com/android/cts/deviceandprofileowner/MeteredDataRestrictionTest.java"
        "src/com/android/cts/deviceandprofileowner/PasswordExpirationTest.java"
        "src/com/android/cts/deviceandprofileowner/PasswordSufficientInitiallyTest.java"
        "src/com/android/cts/deviceandprofileowner/PermissionsTest.java"
        "src/com/android/cts/deviceandprofileowner/PersistentIntentResolvingTest.java"
        "src/com/android/cts/deviceandprofileowner/PolicyTransparencyTest.java"
        "src/com/android/cts/deviceandprofileowner/PrintActivity.java"
        "src/com/android/cts/deviceandprofileowner/PrintingPolicyTest.java"
        "src/com/android/cts/deviceandprofileowner/RandomizedWifiMacAddressTest.java"
        "src/com/android/cts/deviceandprofileowner/RequiredStrongAuthTimeoutTest.java"
        "src/com/android/cts/deviceandprofileowner/ResetPasswordTest.java"
        "src/com/android/cts/deviceandprofileowner/ResetPasswordWithTokenTest.java"
        "src/com/android/cts/deviceandprofileowner/ScreenCaptureDisabledTest.java"
        "src/com/android/cts/deviceandprofileowner/SetPolicyActivity.java"
        "src/com/android/cts/deviceandprofileowner/SetSystemSettingTest.java"
        "src/com/android/cts/deviceandprofileowner/StorageEncryptionTest.java"
        "src/com/android/cts/deviceandprofileowner/SupportMessageTest.java"
        "src/com/android/cts/deviceandprofileowner/SuspendPackageTest.java"
        "src/com/android/cts/deviceandprofileowner/TrustAgentInfoTest.java"
        "src/com/android/cts/deviceandprofileowner/UnavailableSecureLockScreenTest.java"
        "src/com/android/cts/deviceandprofileowner/Utils.java"
        "src/com/android/cts/deviceandprofileowner/userrestrictions/BaseUserRestrictionsTest.java"
        "src/com/android/cts/deviceandprofileowner/userrestrictions/CheckNoOwnerRestrictionsTest.java"
        "src/com/android/cts/deviceandprofileowner/userrestrictions/DeviceOwnerUserRestrictionsTest.java"
        "src/com/android/cts/deviceandprofileowner/userrestrictions/ManagedProfileOwnerUserRestrictionsTest.java"
        "src/com/android/cts/deviceandprofileowner/userrestrictions/PrimaryProfileOwnerUserRestrictionsTest.java"
        "src/com/android/cts/deviceandprofileowner/userrestrictions/ProfileGlobalRestrictionsTest.java"
        "src/com/android/cts/deviceandprofileowner/userrestrictions/SecondaryProfileOwnerUserRestrictionsTest.java"
        "src/com/android/cts/deviceandprofileowner/vpn/VpnTestHelper.java"
    ];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    static_libs = [
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
        "ub-uiautomator"
        "cts-security-test-support-library"
        "androidx.legacy_legacy-support-v4"
    ];
    resource_dirs = ["res"];
    asset_dirs = ["assets"];
    min_sdk_version = "23";
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts"
        "general-tests"
    ];
    manifest = "api23/AndroidManifest.xml";
};

CtsDeviceAndProfileOwnerApp25 = android_test_helper_app {
    name = "CtsDeviceAndProfileOwnerApp25";
    defaults = ["cts_defaults"];
    platform_apis = true;
    srcs = [
        "src/com/android/cts/deviceandprofileowner/AccessibilityServicesTest.java"
        "src/com/android/cts/deviceandprofileowner/AffiliationTest.java"
        "src/com/android/cts/deviceandprofileowner/AllowedAccountManagementTest.java"
        "src/com/android/cts/deviceandprofileowner/AlwaysOnVpnMultiStageTest.java"
        "src/com/android/cts/deviceandprofileowner/AlwaysOnVpnTest.java"
        "src/com/android/cts/deviceandprofileowner/AlwaysOnVpnUnsupportedTest.java"
        "src/com/android/cts/deviceandprofileowner/ApplicationHiddenTest.java"
        "src/com/android/cts/deviceandprofileowner/ApplicationRestrictionsIsCallerDelegateHelper.java"
        "src/com/android/cts/deviceandprofileowner/ApplicationRestrictionsTest.java"
        "src/com/android/cts/deviceandprofileowner/AssistScreenCaptureDisabledTest.java"
        "src/com/android/cts/deviceandprofileowner/AudioRestrictionTest.java"
        "src/com/android/cts/deviceandprofileowner/AutofillActivity.java"
        "src/com/android/cts/deviceandprofileowner/AutofillRestrictionsTest.java"
        "src/com/android/cts/deviceandprofileowner/BaseDeviceAdminTest.java"
        "src/com/android/cts/deviceandprofileowner/CaCertManagementTest.java"
        "src/com/android/cts/deviceandprofileowner/ClearApplicationDataTest.java"
        "src/com/android/cts/deviceandprofileowner/ClearProfileOwnerNegativeTest.java"
        "src/com/android/cts/deviceandprofileowner/ContentCaptureActivity.java"
        "src/com/android/cts/deviceandprofileowner/ContentCaptureRestrictionsTest.java"
        "src/com/android/cts/deviceandprofileowner/ContentSuggestionsActivity.java"
        "src/com/android/cts/deviceandprofileowner/ContentSuggestionsRestrictionsTest.java"
        "src/com/android/cts/deviceandprofileowner/CustomizationRestrictionsTest.java"
        "src/com/android/cts/deviceandprofileowner/DelegatedCertInstallerHelper.java"
        "src/com/android/cts/deviceandprofileowner/DelegatedCertInstallerTest.java"
        "src/com/android/cts/deviceandprofileowner/DelegationTest.java"
        "src/com/android/cts/deviceandprofileowner/DeviceIdAttestationTest.java"
        "src/com/android/cts/deviceandprofileowner/DevicePolicyLoggingTest.java"
        "src/com/android/cts/deviceandprofileowner/ExampleIntentReceivingActivity1.java"
        "src/com/android/cts/deviceandprofileowner/ExampleIntentReceivingActivity2.java"
        "src/com/android/cts/deviceandprofileowner/FbeHelper.java"
        "src/com/android/cts/deviceandprofileowner/GetCurrentFailedPasswordAttemptsTest.java"
        "src/com/android/cts/deviceandprofileowner/GetPasswordExpirationTest.java"
        "src/com/android/cts/deviceandprofileowner/InputMethodsTest.java"
        "src/com/android/cts/deviceandprofileowner/KeyManagementActivity.java"
        "src/com/android/cts/deviceandprofileowner/KeyManagementTest.java"
        "src/com/android/cts/deviceandprofileowner/LockTaskHostDrivenTest.java"
        "src/com/android/cts/deviceandprofileowner/LockTaskTest.java"
        "src/com/android/cts/deviceandprofileowner/LockTaskUtilityActivity.java"
        "src/com/android/cts/deviceandprofileowner/LockTaskUtilityActivityIfWhitelisted.java"
        "src/com/android/cts/deviceandprofileowner/MeteredDataRestrictionTest.java"
        "src/com/android/cts/deviceandprofileowner/PasswordExpirationTest.java"
        "src/com/android/cts/deviceandprofileowner/PasswordSufficientInitiallyTest.java"
        "src/com/android/cts/deviceandprofileowner/PermissionsTest.java"
        "src/com/android/cts/deviceandprofileowner/PersistentIntentResolvingTest.java"
        "src/com/android/cts/deviceandprofileowner/PolicyTransparencyTest.java"
        "src/com/android/cts/deviceandprofileowner/PrintActivity.java"
        "src/com/android/cts/deviceandprofileowner/PrintingPolicyTest.java"
        "src/com/android/cts/deviceandprofileowner/RandomizedWifiMacAddressTest.java"
        "src/com/android/cts/deviceandprofileowner/RequiredStrongAuthTimeoutTest.java"
        "src/com/android/cts/deviceandprofileowner/ResetPasswordTest.java"
        "src/com/android/cts/deviceandprofileowner/ResetPasswordWithTokenTest.java"
        "src/com/android/cts/deviceandprofileowner/ScreenCaptureDisabledTest.java"
        "src/com/android/cts/deviceandprofileowner/SetPolicyActivity.java"
        "src/com/android/cts/deviceandprofileowner/SetSystemSettingTest.java"
        "src/com/android/cts/deviceandprofileowner/StorageEncryptionTest.java"
        "src/com/android/cts/deviceandprofileowner/SupportMessageTest.java"
        "src/com/android/cts/deviceandprofileowner/SuspendPackageTest.java"
        "src/com/android/cts/deviceandprofileowner/TrustAgentInfoTest.java"
        "src/com/android/cts/deviceandprofileowner/UnavailableSecureLockScreenTest.java"
        "src/com/android/cts/deviceandprofileowner/Utils.java"
        "src/com/android/cts/deviceandprofileowner/userrestrictions/BaseUserRestrictionsTest.java"
        "src/com/android/cts/deviceandprofileowner/userrestrictions/CheckNoOwnerRestrictionsTest.java"
        "src/com/android/cts/deviceandprofileowner/userrestrictions/DeviceOwnerUserRestrictionsTest.java"
        "src/com/android/cts/deviceandprofileowner/userrestrictions/ManagedProfileOwnerUserRestrictionsTest.java"
        "src/com/android/cts/deviceandprofileowner/userrestrictions/PrimaryProfileOwnerUserRestrictionsTest.java"
        "src/com/android/cts/deviceandprofileowner/userrestrictions/ProfileGlobalRestrictionsTest.java"
        "src/com/android/cts/deviceandprofileowner/userrestrictions/SecondaryProfileOwnerUserRestrictionsTest.java"
        "src/com/android/cts/deviceandprofileowner/vpn/VpnTestHelper.java"
    ];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    static_libs = [
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
        "ub-uiautomator"
        "cts-security-test-support-library"
        "androidx.legacy_legacy-support-v4"
    ];
    resource_dirs = ["res"];
    asset_dirs = ["assets"];
    min_sdk_version = "23";
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts"
        "general-tests"
    ];
    manifest = "api25/AndroidManifest.xml";
};

CtsDeviceAndProfileOwnerApp = android_test_helper_app {
    name = "CtsDeviceAndProfileOwnerApp";
    defaults = ["cts_defaults"];
    platform_apis = true;
    srcs = [
        "src/com/android/cts/deviceandprofileowner/AccessibilityServicesTest.java"
        "src/com/android/cts/deviceandprofileowner/AffiliationTest.java"
        "src/com/android/cts/deviceandprofileowner/AllowedAccountManagementTest.java"
        "src/com/android/cts/deviceandprofileowner/AlwaysOnVpnMultiStageTest.java"
        "src/com/android/cts/deviceandprofileowner/AlwaysOnVpnTest.java"
        "src/com/android/cts/deviceandprofileowner/AlwaysOnVpnUnsupportedTest.java"
        "src/com/android/cts/deviceandprofileowner/ApplicationHiddenTest.java"
        "src/com/android/cts/deviceandprofileowner/ApplicationRestrictionsIsCallerDelegateHelper.java"
        "src/com/android/cts/deviceandprofileowner/ApplicationRestrictionsTest.java"
        "src/com/android/cts/deviceandprofileowner/AssistScreenCaptureDisabledTest.java"
        "src/com/android/cts/deviceandprofileowner/AudioRestrictionTest.java"
        "src/com/android/cts/deviceandprofileowner/AutofillActivity.java"
        "src/com/android/cts/deviceandprofileowner/AutofillRestrictionsTest.java"
        "src/com/android/cts/deviceandprofileowner/BaseDeviceAdminTest.java"
        "src/com/android/cts/deviceandprofileowner/CaCertManagementTest.java"
        "src/com/android/cts/deviceandprofileowner/ClearApplicationDataTest.java"
        "src/com/android/cts/deviceandprofileowner/ClearProfileOwnerNegativeTest.java"
        "src/com/android/cts/deviceandprofileowner/ContentCaptureActivity.java"
        "src/com/android/cts/deviceandprofileowner/ContentCaptureRestrictionsTest.java"
        "src/com/android/cts/deviceandprofileowner/ContentSuggestionsActivity.java"
        "src/com/android/cts/deviceandprofileowner/ContentSuggestionsRestrictionsTest.java"
        "src/com/android/cts/deviceandprofileowner/CustomizationRestrictionsTest.java"
        "src/com/android/cts/deviceandprofileowner/DelegatedCertInstallerHelper.java"
        "src/com/android/cts/deviceandprofileowner/DelegatedCertInstallerTest.java"
        "src/com/android/cts/deviceandprofileowner/DelegationTest.java"
        "src/com/android/cts/deviceandprofileowner/DeviceIdAttestationTest.java"
        "src/com/android/cts/deviceandprofileowner/DevicePolicyLoggingTest.java"
        "src/com/android/cts/deviceandprofileowner/ExampleIntentReceivingActivity1.java"
        "src/com/android/cts/deviceandprofileowner/ExampleIntentReceivingActivity2.java"
        "src/com/android/cts/deviceandprofileowner/FbeHelper.java"
        "src/com/android/cts/deviceandprofileowner/GetCurrentFailedPasswordAttemptsTest.java"
        "src/com/android/cts/deviceandprofileowner/GetPasswordExpirationTest.java"
        "src/com/android/cts/deviceandprofileowner/InputMethodsTest.java"
        "src/com/android/cts/deviceandprofileowner/KeyManagementActivity.java"
        "src/com/android/cts/deviceandprofileowner/KeyManagementTest.java"
        "src/com/android/cts/deviceandprofileowner/LockTaskHostDrivenTest.java"
        "src/com/android/cts/deviceandprofileowner/LockTaskTest.java"
        "src/com/android/cts/deviceandprofileowner/LockTaskUtilityActivity.java"
        "src/com/android/cts/deviceandprofileowner/LockTaskUtilityActivityIfWhitelisted.java"
        "src/com/android/cts/deviceandprofileowner/MeteredDataRestrictionTest.java"
        "src/com/android/cts/deviceandprofileowner/PasswordExpirationTest.java"
        "src/com/android/cts/deviceandprofileowner/PasswordSufficientInitiallyTest.java"
        "src/com/android/cts/deviceandprofileowner/PermissionsTest.java"
        "src/com/android/cts/deviceandprofileowner/PersistentIntentResolvingTest.java"
        "src/com/android/cts/deviceandprofileowner/PolicyTransparencyTest.java"
        "src/com/android/cts/deviceandprofileowner/PrintActivity.java"
        "src/com/android/cts/deviceandprofileowner/PrintingPolicyTest.java"
        "src/com/android/cts/deviceandprofileowner/RandomizedWifiMacAddressTest.java"
        "src/com/android/cts/deviceandprofileowner/RequiredStrongAuthTimeoutTest.java"
        "src/com/android/cts/deviceandprofileowner/ResetPasswordTest.java"
        "src/com/android/cts/deviceandprofileowner/ResetPasswordWithTokenTest.java"
        "src/com/android/cts/deviceandprofileowner/ScreenCaptureDisabledTest.java"
        "src/com/android/cts/deviceandprofileowner/SetPolicyActivity.java"
        "src/com/android/cts/deviceandprofileowner/SetSystemSettingTest.java"
        "src/com/android/cts/deviceandprofileowner/StorageEncryptionTest.java"
        "src/com/android/cts/deviceandprofileowner/SupportMessageTest.java"
        "src/com/android/cts/deviceandprofileowner/SuspendPackageTest.java"
        "src/com/android/cts/deviceandprofileowner/TrustAgentInfoTest.java"
        "src/com/android/cts/deviceandprofileowner/UnavailableSecureLockScreenTest.java"
        "src/com/android/cts/deviceandprofileowner/Utils.java"
        "src/com/android/cts/deviceandprofileowner/userrestrictions/BaseUserRestrictionsTest.java"
        "src/com/android/cts/deviceandprofileowner/userrestrictions/CheckNoOwnerRestrictionsTest.java"
        "src/com/android/cts/deviceandprofileowner/userrestrictions/DeviceOwnerUserRestrictionsTest.java"
        "src/com/android/cts/deviceandprofileowner/userrestrictions/ManagedProfileOwnerUserRestrictionsTest.java"
        "src/com/android/cts/deviceandprofileowner/userrestrictions/PrimaryProfileOwnerUserRestrictionsTest.java"
        "src/com/android/cts/deviceandprofileowner/userrestrictions/ProfileGlobalRestrictionsTest.java"
        "src/com/android/cts/deviceandprofileowner/userrestrictions/SecondaryProfileOwnerUserRestrictionsTest.java"
        "src/com/android/cts/deviceandprofileowner/vpn/VpnTestHelper.java"
    ];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    static_libs = [
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
        "ub-uiautomator"
        "cts-security-test-support-library"
        "androidx.legacy_legacy-support-v4"
    ];
    resource_dirs = ["res"];
    asset_dirs = ["assets"];
    min_sdk_version = "23";
    #  tag this module as a cts test artifact
    test_suites = [
        "arcts"
        "cts"
        "vts"
        "general-tests"
    ];
    manifest = "latest/AndroidManifest.xml";
};

in { inherit CtsDeviceAndProfileOwnerApp CtsDeviceAndProfileOwnerApp23 CtsDeviceAndProfileOwnerApp25; }
