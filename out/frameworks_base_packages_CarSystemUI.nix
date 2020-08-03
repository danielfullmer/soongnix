{ android_app, android_library }:
let

#
#  Copyright (C) 2018 The Android Open Source Project
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
CarSystemUI-core = android_library {
    name = "CarSystemUI-core";

    srcs = [
        "src/**/*.java"
        "src/**/I*.aidl"
    ];

    resource_dirs = [
        "res-keyguard"
        "res"
    ];

    static_libs = [
        "SystemUI-core"
        "CarNotificationLib"
        "SystemUIPluginLib"
        "SystemUISharedLib"
        "SettingsLib"
        "android.car.userlib"
        "androidx.legacy_legacy-support-v4"
        "androidx.recyclerview_recyclerview"
        "androidx.preference_preference"
        "androidx.appcompat_appcompat"
        "androidx.mediarouter_mediarouter"
        "androidx.palette_palette"
        "androidx.legacy_legacy-preference-v14"
        "androidx.leanback_leanback"
        "androidx.slice_slice-core"
        "androidx.slice_slice-view"
        "androidx.slice_slice-builders"
        "androidx.arch.core_core-runtime"
        "androidx.lifecycle_lifecycle-extensions"
        "SystemUI-tags"
        "SystemUI-proto"
        "dagger2-2.19"
        "//external/kotlinc:kotlin-annotations"
    ];

    libs = [
        "telephony-common"
        "android.car"
    ];

    manifest = "AndroidManifest.xml";

    plugins = ["dagger2-compiler-2.19"];

};

CarSystemUI = android_app {
    name = "CarSystemUI";

    static_libs = [
        "CarSystemUI-core"
    ];

    libs = [
        "telephony-common"
        "android.car"
    ];

    resource_dirs = [];

    overrides = [
        "SystemUI"
    ];

    platform_apis = true;
    product_specific = true;
    certificate = "platform";
    privileged = true;

    optimize = {
        proguard_flags_files = [
            "proguard.flags"
        ];
    };
    dxflags = ["--multi-dex"];

    aaptflags = [
        "--extra-packages"
        "com.android.keyguard"
    ];

    kotlincflags = ["-Xjvm-default=enable"];

    plugins = ["dagger2-compiler-2.19"];

    required = ["privapp_whitelist_com.android.systemui"];
};

in { inherit CarSystemUI CarSystemUI-core; }
