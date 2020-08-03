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
        "src/**/*.java"
        "src/**/*.proto"
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
