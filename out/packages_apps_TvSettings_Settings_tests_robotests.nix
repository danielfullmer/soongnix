{ android_robolectric_test }:
let

# ############################################
#  TvSettings Robolectric test target. #
# ############################################

TvSettingsRoboTests = android_robolectric_test {
    name = "TvSettingsRoboTests";

    srcs = [
        "src/com/android/tv/settings/MainFragmentTest.java"
        "src/com/android/tv/settings/PreferenceControllerFragmentTest.java"
        "src/com/android/tv/settings/about/LicenseActivityTest.java"
        "src/com/android/tv/settings/autofill/AutofillPickerFragmentTest.java"
        "src/com/android/tv/settings/connectivity/WifiConfigHelperTest.java"
        "src/com/android/tv/settings/connectivity/setup/AddPageBasedOnNetworkStateTest.java"
        "src/com/android/tv/settings/connectivity/setup/AddStartStateTest.java"
        "src/com/android/tv/settings/connectivity/setup/ConnectFailedFragmentTest.java"
        "src/com/android/tv/settings/connectivity/setup/ConnectStateTest.java"
        "src/com/android/tv/settings/device/DevicePrefFragmentTest.java"
        "src/com/android/tv/settings/device/apps/RecentAppsPreferenceControllerTest.java"
        "src/com/android/tv/settings/device/apps/specialaccess/SpecialAppAccessTest.java"
        "src/com/android/tv/settings/device/storage/FormatActivityFormatReceiverTest.java"
        "src/com/android/tv/settings/device/storage/SettingsStorageServiceTest.java"
        "src/com/android/tv/settings/inputmethod/KeyboardFragmentTest.java"
        "src/com/android/tv/settings/system/FallbackHomeTest.java"
        "src/com/android/tv/settings/testutils/ShadowIconDrawableFactory.java"
        "src/com/android/tv/settings/testutils/ShadowInputMethodManager.java"
        "src/com/android/tv/settings/testutils/ShadowStateMachine.java"
        "src/com/android/tv/settings/testutils/ShadowWifiConfigHelper.java"
        "src/com/android/tv/settings/testutils/TvShadowWifiManager.java"
        "src/com/android/tv/settings/testutils/Utils.java"
        "src/com/android/tv/settings/users/RestrictedProfilePinStorageTest.java"
        "src/com/android/tv/settings/users/RestrictedProfileTest.java"
    ];

    java_resource_dirs = ["config"];

    instrumentation_for = "TvSettings";

    test_options = {
        timeout = 36000;
    };
};

in { inherit TvSettingsRoboTests; }
