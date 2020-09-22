{ android_app, android_library }:
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

EmergencyInfo = android_app {
    name = "EmergencyInfo";
    platform_apis = true;
    resource_dirs = [];
    optimize = {
        proguard_flags_files = ["proguard.flags"];
    };
    system_ext_specific = true;
    required = ["privapp_whitelist_com.android.emergency"];
    privileged = true;
    static_libs = [
        "EmergencyInfo-lib"
    ];
    certificate = "platform";
};

EmergencyInfo-lib = android_library {
    name = "EmergencyInfo-lib";
    platform_apis = true;
    resource_dirs = ["res"];
    srcs = [
        "src/com/android/emergency/CircleFramedDrawable.java"
        "src/com/android/emergency/EmergencyContactManager.java"
        "src/com/android/emergency/EmergencyDialerTrampoline.java"
        "src/com/android/emergency/EmergencySearchIndexablesProvider.java"
        "src/com/android/emergency/PreferenceKeys.java"
        "src/com/android/emergency/ReloadablePreferenceInterface.java"
        "src/com/android/emergency/edit/EditInfoActivity.java"
        "src/com/android/emergency/edit/EditInfoFragment.java"
        "src/com/android/emergency/edit/EditMedicalInfoActivity.java"
        "src/com/android/emergency/edit/EditMedicalInfoFragment.java"
        "src/com/android/emergency/edit/EmergencyContactsFeatureProvider.java"
        "src/com/android/emergency/edit/EmergencyContactsFeatureProviderImpl.java"
        "src/com/android/emergency/overlay/FeatureFactory.java"
        "src/com/android/emergency/overlay/FeatureFactoryImpl.java"
        "src/com/android/emergency/preferences/ContactPreference.java"
        "src/com/android/emergency/preferences/EditUserPhotoController.java"
        "src/com/android/emergency/preferences/EmergencyContactsPreference.java"
        "src/com/android/emergency/preferences/EmergencyEditTextPreference.java"
        "src/com/android/emergency/preferences/EmergencyListPreference.java"
        "src/com/android/emergency/preferences/EmergencyNamePreference.java"
        "src/com/android/emergency/preferences/ViewEmergencyContactsPreference.java"
        "src/com/android/emergency/util/PreferenceUtils.java"
        "src/com/android/emergency/view/ViewEmergencyContactsFragment.java"
        "src/com/android/emergency/view/ViewEmergencyInfoFragment.java"
        "src/com/android/emergency/view/ViewInfoActivity.java"
    ];
    static_libs = [
        "androidx.legacy_legacy-preference-v14"
        "androidx.legacy_legacy-support-v13"
        "androidx.appcompat_appcompat"
        "androidx.preference_preference"
        "androidx.recyclerview_recyclerview"
        "androidx.legacy_legacy-support-v4"
        "com.google.android.material_material"
        "androidx.transition_transition"
    ];
    defaults = ["SettingsLibDefaults"];
};

in { inherit EmergencyInfo EmergencyInfo-lib; }
