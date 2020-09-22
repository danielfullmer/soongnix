{ android_app, filegroup, genrule, java_library }:
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
    cmd = "$(location stats-log-api-gen) --java $(out) --module permissioncontroller --javaPackage com.android.permissioncontroller --javaClass PermissionControllerStatsLog --supportQ";
    out = ["com/android/permissioncontroller/PermissionControllerStatsLog.java"];
};

permissioncontroller-statsd = java_library {
    name = "permissioncontroller-statsd";
    sdk_version = "system_current";

    srcs = [
        ":statslog-permissioncontroller-java-gen"
    ];
};

#  File to be included by permission controller app an mocking tests
permissioncontroller-sources = filegroup {
    name = "permissioncontroller-sources";
    srcs = [
        "src/android/support/wearable/view/AcceptDenyDialog.java"
        "src/android/support/wearable/view/CircledImageView.java"
        "src/android/support/wearable/view/Gusterpolator.java"
        "src/android/support/wearable/view/ProgressDrawable.java"
        "src/android/support/wearable/view/SimpleAnimatorListener.java"
        "src/android/support/wearable/view/WearableDialogHelper.java"
        "src/android/support/wearable/view/WearableListView.java"
        "src/com/android/permissioncontroller/AsyncTaskLiveData.java"
        "src/com/android/permissioncontroller/Constants.java"
        "src/com/android/permissioncontroller/DeviceUtils.java"
        "src/com/android/permissioncontroller/PermissionControllerApplication.java"
        "src/com/android/permissioncontroller/auto/AutoSettingsFrameFragment.java"
        "src/com/android/permissioncontroller/incident/ApprovalReceiver.java"
        "src/com/android/permissioncontroller/incident/ConfirmationActivity.java"
        "src/com/android/permissioncontroller/incident/ConfirmationReceiver.java"
        "src/com/android/permissioncontroller/incident/Formatting.java"
        "src/com/android/permissioncontroller/incident/PendingList.java"
        "src/com/android/permissioncontroller/incident/ReportDetails.java"
        "src/com/android/permissioncontroller/permission/model/AppPermissionGroup.java"
        "src/com/android/permissioncontroller/permission/model/AppPermissions.java"
        "src/com/android/permissioncontroller/permission/model/Permission.java"
        "src/com/android/permissioncontroller/permission/model/legacy/PermissionApps.java"
        "src/com/android/permissioncontroller/permission/model/legacy/PermissionGroup.java"
        "src/com/android/permissioncontroller/permission/model/legacy/PermissionGroups.java"
        "src/com/android/permissioncontroller/permission/service/BackupHelper.java"
        "src/com/android/permissioncontroller/permission/service/BaseSearchIndexablesProvider.java"
        "src/com/android/permissioncontroller/permission/service/LocationAccessCheck.java"
        "src/com/android/permissioncontroller/permission/service/PermissionControllerLifecycleService.java"
        "src/com/android/permissioncontroller/permission/service/PermissionControllerServiceImpl.java"
        "src/com/android/permissioncontroller/permission/service/PermissionSearchIndexablesProvider.java"
        "src/com/android/permissioncontroller/permission/service/RuntimePermissionPresenterServiceLegacyImpl.java"
        "src/com/android/permissioncontroller/permission/service/ServiceLifecycleDispatcher.java"
        "src/com/android/permissioncontroller/permission/ui/AutoGrantPermissionsNotifier.java"
        "src/com/android/permissioncontroller/permission/ui/ConfirmActionDialogFragment.java"
        "src/com/android/permissioncontroller/permission/ui/GrantPermissionsActivity.java"
        "src/com/android/permissioncontroller/permission/ui/GrantPermissionsViewHandler.java"
        "src/com/android/permissioncontroller/permission/ui/LocationProviderInterceptDialog.java"
        "src/com/android/permissioncontroller/permission/ui/ManagePermissionsActivity.java"
        "src/com/android/permissioncontroller/permission/ui/ManagePermissionsActivityTrampoline.java"
        "src/com/android/permissioncontroller/permission/ui/OverlayWarningDialog.java"
        "src/com/android/permissioncontroller/permission/ui/ReviewAccessibilityServicesActivity.java"
        "src/com/android/permissioncontroller/permission/ui/ReviewPermissionsActivity.java"
        "src/com/android/permissioncontroller/permission/ui/auto/AutoAllAppPermissionsFragment.java"
        "src/com/android/permissioncontroller/permission/ui/auto/AutoAppPermissionFragment.java"
        "src/com/android/permissioncontroller/permission/ui/auto/AutoAppPermissionsFragment.java"
        "src/com/android/permissioncontroller/permission/ui/auto/AutoManageCustomPermissionsFragment.java"
        "src/com/android/permissioncontroller/permission/ui/auto/AutoManagePermissionsFragment.java"
        "src/com/android/permissioncontroller/permission/ui/auto/AutoManageStandardPermissionsFragment.java"
        "src/com/android/permissioncontroller/permission/ui/auto/AutoPermissionAppsFragment.java"
        "src/com/android/permissioncontroller/permission/ui/auto/AutoPermissionsUtils.java"
        "src/com/android/permissioncontroller/permission/ui/auto/AutoTwoTargetPreference.java"
        "src/com/android/permissioncontroller/permission/ui/auto/GrantPermissionsAutoViewHandler.java"
        "src/com/android/permissioncontroller/permission/ui/handheld/AllAppPermissionsFragment.java"
        "src/com/android/permissioncontroller/permission/ui/handheld/AppPermissionFragment.java"
        "src/com/android/permissioncontroller/permission/ui/handheld/AppPermissionGroupsFragment.java"
        "src/com/android/permissioncontroller/permission/ui/handheld/GrantPermissionsViewHandlerImpl.java"
        "src/com/android/permissioncontroller/permission/ui/handheld/ManageCustomPermissionsFragment.java"
        "src/com/android/permissioncontroller/permission/ui/handheld/ManagePermissionsFragment.java"
        "src/com/android/permissioncontroller/permission/ui/handheld/ManageStandardPermissionsFragment.java"
        "src/com/android/permissioncontroller/permission/ui/handheld/MultiTargetSwitchPreference.java"
        "src/com/android/permissioncontroller/permission/ui/handheld/PermissionAppsFragment.java"
        "src/com/android/permissioncontroller/permission/ui/handheld/PermissionControlPreference.java"
        "src/com/android/permissioncontroller/permission/ui/handheld/PermissionPreference.java"
        "src/com/android/permissioncontroller/permission/ui/handheld/PermissionsFrameFragment.java"
        "src/com/android/permissioncontroller/permission/ui/handheld/ReviewPermissionsFragment.java"
        "src/com/android/permissioncontroller/permission/ui/handheld/SettingsWithHeader.java"
        "src/com/android/permissioncontroller/permission/ui/handheld/SettingsWithLargeHeader.java"
        "src/com/android/permissioncontroller/permission/ui/legacy/AppPermissionActivity.java"
        "src/com/android/permissioncontroller/permission/ui/television/AllAppPermissionsFragment.java"
        "src/com/android/permissioncontroller/permission/ui/television/AppPermissionFragment.java"
        "src/com/android/permissioncontroller/permission/ui/television/AppPermissionsFragment.java"
        "src/com/android/permissioncontroller/permission/ui/television/GrantPermissionsViewHandlerImpl.java"
        "src/com/android/permissioncontroller/permission/ui/television/ManagePermissionsFragment.java"
        "src/com/android/permissioncontroller/permission/ui/television/PermissionAppsFragment.java"
        "src/com/android/permissioncontroller/permission/ui/television/PermissionsFrameFragment.java"
        "src/com/android/permissioncontroller/permission/ui/television/RadioButtonPreference.java"
        "src/com/android/permissioncontroller/permission/ui/television/SettingsWithHeader.java"
        "src/com/android/permissioncontroller/permission/ui/wear/AppPermissionsFragmentWear.java"
        "src/com/android/permissioncontroller/permission/ui/wear/GrantPermissionsWearViewHandler.java"
        "src/com/android/permissioncontroller/permission/ui/wear/ReviewPermissionsWearFragment.java"
        "src/com/android/permissioncontroller/permission/utils/ArrayUtils.java"
        "src/com/android/permissioncontroller/permission/utils/CollectionUtils.java"
        "src/com/android/permissioncontroller/permission/utils/EventLogger.java"
        "src/com/android/permissioncontroller/permission/utils/IoUtils.java"
        "src/com/android/permissioncontroller/permission/utils/LocationUtils.java"
        "src/com/android/permissioncontroller/permission/utils/PackageRemovalMonitor.java"
        "src/com/android/permissioncontroller/permission/utils/SafetyNetLogger.java"
        "src/com/android/permissioncontroller/permission/utils/SoftRestrictedPermissionPolicy.java"
        "src/com/android/permissioncontroller/permission/utils/Utils.java"
        "src/com/android/permissioncontroller/role/model/AppOp.java"
        "src/com/android/permissioncontroller/role/model/AppOpPermissions.java"
        "src/com/android/permissioncontroller/role/model/AssistantRoleBehavior.java"
        "src/com/android/permissioncontroller/role/model/BrowserRoleBehavior.java"
        "src/com/android/permissioncontroller/role/model/DialerRoleBehavior.java"
        "src/com/android/permissioncontroller/role/model/EmergencyRoleBehavior.java"
        "src/com/android/permissioncontroller/role/model/EncryptionUnawareConfirmationMixin.java"
        "src/com/android/permissioncontroller/role/model/HomeRoleBehavior.java"
        "src/com/android/permissioncontroller/role/model/IntentFilterData.java"
        "src/com/android/permissioncontroller/role/model/PermissionSet.java"
        "src/com/android/permissioncontroller/role/model/Permissions.java"
        "src/com/android/permissioncontroller/role/model/PreferredActivity.java"
        "src/com/android/permissioncontroller/role/model/RequiredActivity.java"
        "src/com/android/permissioncontroller/role/model/RequiredBroadcastReceiver.java"
        "src/com/android/permissioncontroller/role/model/RequiredComponent.java"
        "src/com/android/permissioncontroller/role/model/RequiredContentProvider.java"
        "src/com/android/permissioncontroller/role/model/RequiredService.java"
        "src/com/android/permissioncontroller/role/model/Role.java"
        "src/com/android/permissioncontroller/role/model/RoleBehavior.java"
        "src/com/android/permissioncontroller/role/model/RoleParser.java"
        "src/com/android/permissioncontroller/role/model/Roles.java"
        "src/com/android/permissioncontroller/role/model/SmsRoleBehavior.java"
        "src/com/android/permissioncontroller/role/model/UserDeniedManager.java"
        "src/com/android/permissioncontroller/role/model/VisibilityMixin.java"
        "src/com/android/permissioncontroller/role/service/ClearUserDeniedReceiver.java"
        "src/com/android/permissioncontroller/role/service/RoleControllerServiceImpl.java"
        "src/com/android/permissioncontroller/role/service/RoleSearchIndexablesProvider.java"
        "src/com/android/permissioncontroller/role/ui/CheckableLinearLayout.java"
        "src/com/android/permissioncontroller/role/ui/DefaultAppActivity.java"
        "src/com/android/permissioncontroller/role/ui/DefaultAppChildFragment.java"
        "src/com/android/permissioncontroller/role/ui/DefaultAppConfirmationDialogFragment.java"
        "src/com/android/permissioncontroller/role/ui/DefaultAppListActivity.java"
        "src/com/android/permissioncontroller/role/ui/DefaultAppListChildFragment.java"
        "src/com/android/permissioncontroller/role/ui/DefaultAppListViewModel.java"
        "src/com/android/permissioncontroller/role/ui/DefaultAppViewModel.java"
        "src/com/android/permissioncontroller/role/ui/HomeSettingsActivity.java"
        "src/com/android/permissioncontroller/role/ui/ManageRoleHolderStateLiveData.java"
        "src/com/android/permissioncontroller/role/ui/RequestRoleActivity.java"
        "src/com/android/permissioncontroller/role/ui/RequestRoleFragment.java"
        "src/com/android/permissioncontroller/role/ui/RequestRoleViewModel.java"
        "src/com/android/permissioncontroller/role/ui/RoleItem.java"
        "src/com/android/permissioncontroller/role/ui/RoleListLiveData.java"
        "src/com/android/permissioncontroller/role/ui/RoleListSortFunction.java"
        "src/com/android/permissioncontroller/role/ui/RoleLiveData.java"
        "src/com/android/permissioncontroller/role/ui/RoleSearchTrampolineActivity.java"
        "src/com/android/permissioncontroller/role/ui/RoleSortFunction.java"
        "src/com/android/permissioncontroller/role/ui/SpecialAppAccessActivity.java"
        "src/com/android/permissioncontroller/role/ui/SpecialAppAccessListActivity.java"
        "src/com/android/permissioncontroller/role/ui/TwoTargetPreference.java"
        "src/com/android/permissioncontroller/role/ui/auto/AutoDefaultAppFragment.java"
        "src/com/android/permissioncontroller/role/ui/auto/AutoDefaultAppListFragment.java"
        "src/com/android/permissioncontroller/role/ui/auto/AutoDefaultAppPreference.java"
        "src/com/android/permissioncontroller/role/ui/auto/AutoSettingsPreference.java"
        "src/com/android/permissioncontroller/role/ui/auto/AutoSpecialAppAccessFragment.java"
        "src/com/android/permissioncontroller/role/ui/auto/AutoSpecialAppAccessListFragment.java"
        "src/com/android/permissioncontroller/role/ui/handheld/AppIconPreference.java"
        "src/com/android/permissioncontroller/role/ui/handheld/AppIconRadioButtonPreference.java"
        "src/com/android/permissioncontroller/role/ui/handheld/AppIconSettingsButtonPreference.java"
        "src/com/android/permissioncontroller/role/ui/handheld/FooterPreference.java"
        "src/com/android/permissioncontroller/role/ui/handheld/HandHeldTwoTargetPreference.java"
        "src/com/android/permissioncontroller/role/ui/handheld/HandheldDefaultAppFragment.java"
        "src/com/android/permissioncontroller/role/ui/handheld/HandheldDefaultAppListFragment.java"
        "src/com/android/permissioncontroller/role/ui/handheld/RadioButtonPreference.java"
        "src/com/android/permissioncontroller/role/ui/handheld/SettingsButtonPreference.java"
        "src/com/android/permissioncontroller/role/ui/handheld/SettingsFragment.java"
        "src/com/android/permissioncontroller/role/ui/specialappaccess/MergeRoleListLiveData.java"
        "src/com/android/permissioncontroller/role/ui/specialappaccess/MergeRoleLiveData.java"
        "src/com/android/permissioncontroller/role/ui/specialappaccess/SpecialAppAccessActivity.java"
        "src/com/android/permissioncontroller/role/ui/specialappaccess/SpecialAppAccessChildFragment.java"
        "src/com/android/permissioncontroller/role/ui/specialappaccess/SpecialAppAccessListActivity.java"
        "src/com/android/permissioncontroller/role/ui/specialappaccess/SpecialAppAccessListChildFragment.java"
        "src/com/android/permissioncontroller/role/ui/specialappaccess/SpecialAppAccessListViewModel.java"
        "src/com/android/permissioncontroller/role/ui/specialappaccess/SpecialAppAccessViewModel.java"
        "src/com/android/permissioncontroller/role/ui/specialappaccess/handheld/AppIconSwitchPreference.java"
        "src/com/android/permissioncontroller/role/ui/specialappaccess/handheld/HandheldSpecialAppAccessFragment.java"
        "src/com/android/permissioncontroller/role/ui/specialappaccess/handheld/HandheldSpecialAppAccessListFragment.java"
        "src/com/android/permissioncontroller/role/utils/PackageUtils.java"
        "src/com/android/permissioncontroller/role/utils/UiUtils.java"
        "src/com/android/permissioncontroller/role/utils/UserUtils.java"
        "src/com/android/permissioncontroller/DumpableLog.kt"
        "src/com/android/permissioncontroller/permission/data/AllPackageInfosLiveData.kt"
        "src/com/android/permissioncontroller/permission/data/AppOpLiveData.kt"
        "src/com/android/permissioncontroller/permission/data/AppPermGroupUiInfoLiveData.kt"
        "src/com/android/permissioncontroller/permission/data/AutoRevokeStateLiveData.kt"
        "src/com/android/permissioncontroller/permission/data/AutoRevokedPackagesLiveData.kt"
        "src/com/android/permissioncontroller/permission/data/BroadcastReceiverLiveData.kt"
        "src/com/android/permissioncontroller/permission/data/CarrierPrivilegedStatusLiveData.kt"
        "src/com/android/permissioncontroller/permission/data/CustomPermGroupNamesLiveData.kt"
        "src/com/android/permissioncontroller/permission/data/DataRepository.kt"
        "src/com/android/permissioncontroller/permission/data/ForegroundPermNamesLiveData.kt"
        "src/com/android/permissioncontroller/permission/data/FullStoragePermissionAppsLiveData.kt"
        "src/com/android/permissioncontroller/permission/data/HasIntentAction.kt"
        "src/com/android/permissioncontroller/permission/data/LauncherPackagesLiveData.kt"
        "src/com/android/permissioncontroller/permission/data/LightAppPermGroupLiveData.kt"
        "src/com/android/permissioncontroller/permission/data/LightPackageInfoLiveData.kt"
        "src/com/android/permissioncontroller/permission/data/LightPermInfoLiveData.kt"
        "src/com/android/permissioncontroller/permission/data/PackageBroadcastReceiver.kt"
        "src/com/android/permissioncontroller/permission/data/PackagePermissionsLiveData.kt"
        "src/com/android/permissioncontroller/permission/data/PermGroupLiveData.kt"
        "src/com/android/permissioncontroller/permission/data/PermGroupsPackagesLiveData.kt"
        "src/com/android/permissioncontroller/permission/data/PermGroupsPackagesUiInfoLiveData.kt"
        "src/com/android/permissioncontroller/permission/data/PermStateLiveData.kt"
        "src/com/android/permissioncontroller/permission/data/PermissionListenerMultiplexer.kt"
        "src/com/android/permissioncontroller/permission/data/PreinstalledUserPackageInfosLiveData.kt"
        "src/com/android/permissioncontroller/permission/data/ServiceLiveData.kt"
        "src/com/android/permissioncontroller/permission/data/SinglePermGroupPackagesUiInfoLiveData.kt"
        "src/com/android/permissioncontroller/permission/data/SmartAsyncMediatorLiveData.kt"
        "src/com/android/permissioncontroller/permission/data/SmartUpdateMediatorLiveData.kt"
        "src/com/android/permissioncontroller/permission/data/StandardPermGroupNamesLiveData.kt"
        "src/com/android/permissioncontroller/permission/data/UsageStatsLiveData.kt"
        "src/com/android/permissioncontroller/permission/data/UserPackageInfosLiveData.kt"
        "src/com/android/permissioncontroller/permission/data/UserSensitivityLiveData.kt"
        "src/com/android/permissioncontroller/permission/data/UsersLiveData.kt"
        "src/com/android/permissioncontroller/permission/model/livedatatypes/AppPermGroupUiInfo.kt"
        "src/com/android/permissioncontroller/permission/model/livedatatypes/AutoRevokeState.kt"
        "src/com/android/permissioncontroller/permission/model/livedatatypes/LightAppPermGroup.kt"
        "src/com/android/permissioncontroller/permission/model/livedatatypes/LightPackageInfo.kt"
        "src/com/android/permissioncontroller/permission/model/livedatatypes/LightPermGroupInfo.kt"
        "src/com/android/permissioncontroller/permission/model/livedatatypes/LightPermInfo.kt"
        "src/com/android/permissioncontroller/permission/model/livedatatypes/LightPermission.kt"
        "src/com/android/permissioncontroller/permission/model/livedatatypes/PermGroup.kt"
        "src/com/android/permissioncontroller/permission/model/livedatatypes/PermGroupPackagesUiInfo.kt"
        "src/com/android/permissioncontroller/permission/model/livedatatypes/PermState.kt"
        "src/com/android/permissioncontroller/permission/model/livedatatypes/UidSensitivityState.kt"
        "src/com/android/permissioncontroller/permission/service/AutoRevokePermissions.kt"
        "src/com/android/permissioncontroller/permission/service/CheckLifecycleRegistry.kt"
        "src/com/android/permissioncontroller/permission/service/PermissionControllerServiceModel.kt"
        "src/com/android/permissioncontroller/permission/service/RuntimePermissionsUpgradeController.kt"
        "src/com/android/permissioncontroller/permission/ui/Category.kt"
        "src/com/android/permissioncontroller/permission/ui/handheld/AutoRevokeFragment.kt"
        "src/com/android/permissioncontroller/permission/ui/handheld/AutoRevokePermissionPreference.kt"
        "src/com/android/permissioncontroller/permission/ui/handheld/FooterPreference.kt"
        "src/com/android/permissioncontroller/permission/ui/handheld/SmartIconLoadPackagePermissionPreference.kt"
        "src/com/android/permissioncontroller/permission/ui/handheld/Utils.kt"
        "src/com/android/permissioncontroller/permission/ui/model/AllAppPermissionsViewModel.kt"
        "src/com/android/permissioncontroller/permission/ui/model/AppPermissionGroupsViewModel.kt"
        "src/com/android/permissioncontroller/permission/ui/model/AppPermissionViewModel.kt"
        "src/com/android/permissioncontroller/permission/ui/model/AutoRevokeViewModel.kt"
        "src/com/android/permissioncontroller/permission/ui/model/ManageCustomPermissionsViewModel.kt"
        "src/com/android/permissioncontroller/permission/ui/model/ManageStandardPermissionsViewModel.kt"
        "src/com/android/permissioncontroller/permission/ui/model/PermissionAppsViewModel.kt"
        "src/com/android/permissioncontroller/permission/utils/AndroidUtils.kt"
        "src/com/android/permissioncontroller/permission/utils/DebugUtils.kt"
        "src/com/android/permissioncontroller/permission/utils/KotlinUtils.kt"
        "src/com/android/permissioncontroller/permission/utils/UserSensitiveFlagsUtils.kt"
        ":permissioncontroller-protos"
    ];
};

permissioncontroller-protos = filegroup {
    name = "permissioncontroller-protos";
    srcs = [
        "src/com/android/permissioncontroller/PermissionController.proto"
        "src/com/android/permissioncontroller/incident/incident_minimal.proto"
        "src/com/android/permissioncontroller/permission/service/AutoRevokePermissions.proto"
    ];
};

PermissionController = android_app {
    name = "PermissionController";
    sdk_version = "system_current";
    min_sdk_version = "28";
    updatable = true;
    privileged = true;
    certificate = "platform";

    srcs = [":permissioncontroller-sources"];

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
        "kotlin-stdlib"
        "kotlinx-coroutines-android"
        "androidx.navigation_navigation-common-ktx"
        "androidx.navigation_navigation-fragment-ktx"
        "androidx.navigation_navigation-runtime-ktx"
        "androidx.navigation_navigation-ui-ktx"
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
        "car-ui-lib"
        "libprotobuf-java-lite"
        "SettingsLibUtils"
    ];

    proto = {
        type = "lite";
    };

    optimize = {
        proguard_flags_files = ["proguard.flags"];
    };

    plugins = ["java_api_finder"];
};

in { inherit PermissionController permissioncontroller-protos permissioncontroller-sources permissioncontroller-statsd statslog-permissioncontroller-java-gen; }
