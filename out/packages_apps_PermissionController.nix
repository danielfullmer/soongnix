{ android_app, genrule, java_library }:
let

#
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
#

statslog-permissioncontroller-java-gen = genrule {
    name = "statslog-permissioncontroller-java-gen";
    tools = ["stats-log-api-gen"];
    cmd = "$(location stats-log-api-gen) --java $(out) --module permissioncontroller --javaPackage com.android.packageinstaller --javaClass PermissionControllerStatsLog";
    out = ["com/android/packageinstaller/PermissionControllerStatsLog.java"];
};

permissioncontroller-statsd = java_library {
    name = "permissioncontroller-statsd";
    sdk_version = "system_current";

    srcs = [
        ":statslog-permissioncontroller-java-gen"
    ];
};

PermissionController = android_app {
    name = "PermissionController";
    sdk_version = "system_current";
    min_sdk_version = "28";
    privileged = true;
    certificate = "platform";

    srcs = [
        "src/android/support/wearable/view/AcceptDenyDialog.java"
        "src/android/support/wearable/view/CircledImageView.java"
        "src/android/support/wearable/view/Gusterpolator.java"
        "src/android/support/wearable/view/ProgressDrawable.java"
        "src/android/support/wearable/view/SimpleAnimatorListener.java"
        "src/android/support/wearable/view/WearableDialogHelper.java"
        "src/android/support/wearable/view/WearableListView.java"
        "src/com/android/packageinstaller/AsyncTaskLiveData.java"
        "src/com/android/packageinstaller/Constants.java"
        "src/com/android/packageinstaller/DeviceUtils.java"
        "src/com/android/packageinstaller/PackageInstallerApplication.java"
        "src/com/android/packageinstaller/auto/AutoSettingsFrameFragment.java"
        "src/com/android/packageinstaller/incident/ApprovalReceiver.java"
        "src/com/android/packageinstaller/incident/ConfirmationActivity.java"
        "src/com/android/packageinstaller/incident/ConfirmationReceiver.java"
        "src/com/android/packageinstaller/incident/Formatting.java"
        "src/com/android/packageinstaller/incident/PendingList.java"
        "src/com/android/packageinstaller/incident/ReportDetails.java"
        "src/com/android/packageinstaller/permission/data/BooleanSharedPreferenceLiveData.java"
        "src/com/android/packageinstaller/permission/data/ForcedUserSensitiveUidsLiveData.java"
        "src/com/android/packageinstaller/permission/data/NonSensitivePackagesLiveData.java"
        "src/com/android/packageinstaller/permission/data/PerUserUidToSensitivityLiveData.java"
        "src/com/android/packageinstaller/permission/data/UidToSensitivityLiveData.java"
        "src/com/android/packageinstaller/permission/data/UsersLiveData.java"
        "src/com/android/packageinstaller/permission/model/AppPermissionGroup.java"
        "src/com/android/packageinstaller/permission/model/AppPermissionUsage.java"
        "src/com/android/packageinstaller/permission/model/AppPermissions.java"
        "src/com/android/packageinstaller/permission/model/Permission.java"
        "src/com/android/packageinstaller/permission/model/PermissionApps.java"
        "src/com/android/packageinstaller/permission/model/PermissionGroup.java"
        "src/com/android/packageinstaller/permission/model/PermissionGroups.java"
        "src/com/android/packageinstaller/permission/model/PermissionUsages.java"
        "src/com/android/packageinstaller/permission/service/BackupHelper.java"
        "src/com/android/packageinstaller/permission/service/BaseSearchIndexablesProvider.java"
        "src/com/android/packageinstaller/permission/service/LocationAccessCheck.java"
        "src/com/android/packageinstaller/permission/service/PermissionControllerServiceImpl.java"
        "src/com/android/packageinstaller/permission/service/PermissionSearchIndexablesProvider.java"
        "src/com/android/packageinstaller/permission/service/RuntimePermissionPresenterServiceLegacyImpl.java"
        "src/com/android/packageinstaller/permission/service/RuntimePermissionsUpgradeController.java"
        "src/com/android/packageinstaller/permission/ui/AdjustUserSensitiveActivity.java"
        "src/com/android/packageinstaller/permission/ui/AppPermissionActivity.java"
        "src/com/android/packageinstaller/permission/ui/ButtonBarLayout.java"
        "src/com/android/packageinstaller/permission/ui/ConfirmActionDialogFragment.java"
        "src/com/android/packageinstaller/permission/ui/GrantPermissionsActivity.java"
        "src/com/android/packageinstaller/permission/ui/GrantPermissionsViewHandler.java"
        "src/com/android/packageinstaller/permission/ui/GrantPermissionsWatchViewHandler.java"
        "src/com/android/packageinstaller/permission/ui/LocationProviderInterceptDialog.java"
        "src/com/android/packageinstaller/permission/ui/ManagePermissionsActivity.java"
        "src/com/android/packageinstaller/permission/ui/ManagePermissionsActivityTrampoline.java"
        "src/com/android/packageinstaller/permission/ui/OverlayWarningDialog.java"
        "src/com/android/packageinstaller/permission/ui/PreferenceImageView.java"
        "src/com/android/packageinstaller/permission/ui/ReviewAccessibilityServicesActivity.java"
        "src/com/android/packageinstaller/permission/ui/ReviewOngoingUsageActivity.java"
        "src/com/android/packageinstaller/permission/ui/ReviewPermissionsActivity.java"
        "src/com/android/packageinstaller/permission/ui/auto/AutoAllAppPermissionsFragment.java"
        "src/com/android/packageinstaller/permission/ui/auto/AutoAppPermissionFragment.java"
        "src/com/android/packageinstaller/permission/ui/auto/AutoAppPermissionsFragment.java"
        "src/com/android/packageinstaller/permission/ui/auto/AutoManageCustomPermissionsFragment.java"
        "src/com/android/packageinstaller/permission/ui/auto/AutoManagePermissionsFragment.java"
        "src/com/android/packageinstaller/permission/ui/auto/AutoManageStandardPermissionsFragment.java"
        "src/com/android/packageinstaller/permission/ui/auto/AutoPermissionAppsFragment.java"
        "src/com/android/packageinstaller/permission/ui/auto/AutoPermissionsUtils.java"
        "src/com/android/packageinstaller/permission/ui/auto/AutoTwoTargetPreference.java"
        "src/com/android/packageinstaller/permission/ui/auto/GrantPermissionsAutoViewHandler.java"
        "src/com/android/packageinstaller/permission/ui/handheld/AdjustUserSensitiveFragment.java"
        "src/com/android/packageinstaller/permission/ui/handheld/AllAppPermissionsFragment.java"
        "src/com/android/packageinstaller/permission/ui/handheld/AppPermissionFragment.java"
        "src/com/android/packageinstaller/permission/ui/handheld/AppPermissionsFragment.java"
        "src/com/android/packageinstaller/permission/ui/handheld/GrantPermissionsViewHandlerImpl.java"
        "src/com/android/packageinstaller/permission/ui/handheld/ManageCustomPermissionsFragment.java"
        "src/com/android/packageinstaller/permission/ui/handheld/ManagePermissionsFragment.java"
        "src/com/android/packageinstaller/permission/ui/handheld/ManageStandardPermissionsFragment.java"
        "src/com/android/packageinstaller/permission/ui/handheld/MultiTargetSwitchPreference.java"
        "src/com/android/packageinstaller/permission/ui/handheld/PermissionAppsFragment.java"
        "src/com/android/packageinstaller/permission/ui/handheld/PermissionControlPreference.java"
        "src/com/android/packageinstaller/permission/ui/handheld/PermissionPreference.java"
        "src/com/android/packageinstaller/permission/ui/handheld/PermissionsFrameFragment.java"
        "src/com/android/packageinstaller/permission/ui/handheld/ReviewPermissionsFragment.java"
        "src/com/android/packageinstaller/permission/ui/handheld/SettingsWithHeader.java"
        "src/com/android/packageinstaller/permission/ui/handheld/SettingsWithLargeHeader.java"
        "src/com/android/packageinstaller/permission/ui/television/AllAppPermissionsFragment.java"
        "src/com/android/packageinstaller/permission/ui/television/AppPermissionsFragment.java"
        "src/com/android/packageinstaller/permission/ui/television/GrantPermissionsViewHandlerImpl.java"
        "src/com/android/packageinstaller/permission/ui/television/ManagePermissionsFragment.java"
        "src/com/android/packageinstaller/permission/ui/television/PermissionAppsFragment.java"
        "src/com/android/packageinstaller/permission/ui/television/PermissionsFrameFragment.java"
        "src/com/android/packageinstaller/permission/ui/television/SettingsWithHeader.java"
        "src/com/android/packageinstaller/permission/ui/wear/AppPermissionsFragmentWear.java"
        "src/com/android/packageinstaller/permission/ui/wear/ReviewPermissionsWearFragment.java"
        "src/com/android/packageinstaller/permission/utils/ArrayUtils.java"
        "src/com/android/packageinstaller/permission/utils/CollectionUtils.java"
        "src/com/android/packageinstaller/permission/utils/EventLogger.java"
        "src/com/android/packageinstaller/permission/utils/IoUtils.java"
        "src/com/android/packageinstaller/permission/utils/LocationUtils.java"
        "src/com/android/packageinstaller/permission/utils/PackageRemovalMonitor.java"
        "src/com/android/packageinstaller/permission/utils/SafetyNetLogger.java"
        "src/com/android/packageinstaller/permission/utils/SoftRestrictedPermissionPolicy.java"
        "src/com/android/packageinstaller/permission/utils/Utils.java"
        "src/com/android/packageinstaller/role/model/AppOp.java"
        "src/com/android/packageinstaller/role/model/AssistantRoleBehavior.java"
        "src/com/android/packageinstaller/role/model/BrowserRoleBehavior.java"
        "src/com/android/packageinstaller/role/model/DialerRoleBehavior.java"
        "src/com/android/packageinstaller/role/model/EmergencyRoleBehavior.java"
        "src/com/android/packageinstaller/role/model/EncryptionUnawareConfirmationMixin.java"
        "src/com/android/packageinstaller/role/model/ExclusiveDefaultHolderMixin.java"
        "src/com/android/packageinstaller/role/model/HomeRoleBehavior.java"
        "src/com/android/packageinstaller/role/model/IntentFilterData.java"
        "src/com/android/packageinstaller/role/model/PermissionSet.java"
        "src/com/android/packageinstaller/role/model/Permissions.java"
        "src/com/android/packageinstaller/role/model/PreferredActivity.java"
        "src/com/android/packageinstaller/role/model/RequiredActivity.java"
        "src/com/android/packageinstaller/role/model/RequiredBroadcastReceiver.java"
        "src/com/android/packageinstaller/role/model/RequiredComponent.java"
        "src/com/android/packageinstaller/role/model/RequiredContentProvider.java"
        "src/com/android/packageinstaller/role/model/RequiredMetaData.java"
        "src/com/android/packageinstaller/role/model/RequiredService.java"
        "src/com/android/packageinstaller/role/model/Role.java"
        "src/com/android/packageinstaller/role/model/RoleBehavior.java"
        "src/com/android/packageinstaller/role/model/Roles.java"
        "src/com/android/packageinstaller/role/model/SmsRoleBehavior.java"
        "src/com/android/packageinstaller/role/model/UserDeniedManager.java"
        "src/com/android/packageinstaller/role/model/VisibilityMixin.java"
        "src/com/android/packageinstaller/role/service/ClearUserDeniedReceiver.java"
        "src/com/android/packageinstaller/role/service/RoleControllerServiceImpl.java"
        "src/com/android/packageinstaller/role/service/RoleSearchIndexablesProvider.java"
        "src/com/android/packageinstaller/role/ui/CheckableLinearLayout.java"
        "src/com/android/packageinstaller/role/ui/DefaultAppActivity.java"
        "src/com/android/packageinstaller/role/ui/DefaultAppChildFragment.java"
        "src/com/android/packageinstaller/role/ui/DefaultAppConfirmationDialogFragment.java"
        "src/com/android/packageinstaller/role/ui/DefaultAppListActivity.java"
        "src/com/android/packageinstaller/role/ui/DefaultAppListChildFragment.java"
        "src/com/android/packageinstaller/role/ui/DefaultAppListViewModel.java"
        "src/com/android/packageinstaller/role/ui/DefaultAppViewModel.java"
        "src/com/android/packageinstaller/role/ui/HomeSettingsActivity.java"
        "src/com/android/packageinstaller/role/ui/ManageRoleHolderStateLiveData.java"
        "src/com/android/packageinstaller/role/ui/MergeRoleListLiveData.java"
        "src/com/android/packageinstaller/role/ui/MergeRoleLiveData.java"
        "src/com/android/packageinstaller/role/ui/RequestRoleActivity.java"
        "src/com/android/packageinstaller/role/ui/RequestRoleFragment.java"
        "src/com/android/packageinstaller/role/ui/RequestRoleViewModel.java"
        "src/com/android/packageinstaller/role/ui/RoleItem.java"
        "src/com/android/packageinstaller/role/ui/RoleListLiveData.java"
        "src/com/android/packageinstaller/role/ui/RoleListSortFunction.java"
        "src/com/android/packageinstaller/role/ui/RoleLiveData.java"
        "src/com/android/packageinstaller/role/ui/RoleSearchTrampolineActivity.java"
        "src/com/android/packageinstaller/role/ui/RoleSortFunction.java"
        "src/com/android/packageinstaller/role/ui/SpecialAppAccessActivity.java"
        "src/com/android/packageinstaller/role/ui/SpecialAppAccessChildFragment.java"
        "src/com/android/packageinstaller/role/ui/SpecialAppAccessListActivity.java"
        "src/com/android/packageinstaller/role/ui/SpecialAppAccessListChildFragment.java"
        "src/com/android/packageinstaller/role/ui/SpecialAppAccessListViewModel.java"
        "src/com/android/packageinstaller/role/ui/SpecialAppAccessViewModel.java"
        "src/com/android/packageinstaller/role/ui/TwoTargetPreference.java"
        "src/com/android/packageinstaller/role/ui/auto/AutoDefaultAppFragment.java"
        "src/com/android/packageinstaller/role/ui/auto/AutoDefaultAppListFragment.java"
        "src/com/android/packageinstaller/role/ui/auto/AutoDefaultAppPreference.java"
        "src/com/android/packageinstaller/role/ui/auto/AutoSettingsPreference.java"
        "src/com/android/packageinstaller/role/ui/auto/AutoSpecialAppAccessFragment.java"
        "src/com/android/packageinstaller/role/ui/auto/AutoSpecialAppAccessListFragment.java"
        "src/com/android/packageinstaller/role/ui/handheld/AppIconPreference.java"
        "src/com/android/packageinstaller/role/ui/handheld/AppIconRadioButtonPreference.java"
        "src/com/android/packageinstaller/role/ui/handheld/AppIconSettingsButtonPreference.java"
        "src/com/android/packageinstaller/role/ui/handheld/AppIconSwitchPreference.java"
        "src/com/android/packageinstaller/role/ui/handheld/FooterPreference.java"
        "src/com/android/packageinstaller/role/ui/handheld/HandHeldTwoTargetPreference.java"
        "src/com/android/packageinstaller/role/ui/handheld/HandheldDefaultAppFragment.java"
        "src/com/android/packageinstaller/role/ui/handheld/HandheldDefaultAppListFragment.java"
        "src/com/android/packageinstaller/role/ui/handheld/HandheldSpecialAppAccessFragment.java"
        "src/com/android/packageinstaller/role/ui/handheld/HandheldSpecialAppAccessListFragment.java"
        "src/com/android/packageinstaller/role/ui/handheld/RadioButtonPreference.java"
        "src/com/android/packageinstaller/role/ui/handheld/SettingsButtonPreference.java"
        "src/com/android/packageinstaller/role/ui/handheld/SettingsFragment.java"
        "src/com/android/packageinstaller/role/utils/PackageUtils.java"
        "src/com/android/packageinstaller/role/utils/UiUtils.java"
        "src/com/android/packageinstaller/role/utils/UserUtils.java"
        "src/com/android/packageinstaller/incident/incident_minimal.proto"
    ];

    libs = ["android.car-stubs"];

    static_libs = [
        "iconloader"
        "com.google.android.material_material"
        "androidx.transition_transition"
        "androidx-constraintlayout_constraintlayout"
        "androidx.core_core"
        "androidx.media_media"
        "androidx.legacy_legacy-support-core-utils"
        "androidx.legacy_legacy-support-core-ui"
        "androidx.fragment_fragment"
        "androidx.appcompat_appcompat"
        "androidx.preference_preference"
        "androidx.recyclerview_recyclerview"
        "androidx.legacy_legacy-preference-v14"
        "androidx.leanback_leanback"
        "androidx.leanback_leanback-preference"
        "androidx.lifecycle_lifecycle-extensions"
        "androidx.lifecycle_lifecycle-common-java8"
        "SettingsLibHelpUtils"
        "SettingsLibRestrictedLockUtils"
        "SettingsLibAppPreference"
        "SettingsLibSearchWidget"
        "SettingsLibLayoutPreference"
        "SettingsLibBarChartPreference"
        "SettingsLibActionBarShadow"
        "SettingsLibProgressBar"
        "androidx.annotation_annotation"
        "permissioncontroller-statsd"
        "car-ui-lib-bp"
    ];

    proto = {
        type = "lite";
    };

    optimize = {
        proguard_flags_files = ["proguard.flags"];
    };

    plugins = ["java_api_finder"];
};

in { inherit PermissionController permissioncontroller-statsd statslog-permissioncontroller-java-gen; }
