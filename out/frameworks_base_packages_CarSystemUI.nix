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
        "src/com/android/systemui/CarSystemUIFactory.java"
        "src/com/android/systemui/CarSystemUIModule.java"
        "src/com/android/systemui/CarSystemUIRootComponent.java"
        "src/com/android/systemui/car/CarNotificationEntryManager.java"
        "src/com/android/systemui/car/CarNotificationInterruptionStateProvider.java"
        "src/com/android/systemui/car/CarServiceProvider.java"
        "src/com/android/systemui/car/SUWProgressController.java"
        "src/com/android/systemui/qs/car/CarQSFooter.java"
        "src/com/android/systemui/qs/car/CarQSFragment.java"
        "src/com/android/systemui/qs/car/CarStatusBarHeader.java"
        "src/com/android/systemui/statusbar/car/AssitantButton.java"
        "src/com/android/systemui/statusbar/car/CarBatteryController.java"
        "src/com/android/systemui/statusbar/car/CarFacetButton.java"
        "src/com/android/systemui/statusbar/car/CarFacetButtonController.java"
        "src/com/android/systemui/statusbar/car/CarNavigationBarView.java"
        "src/com/android/systemui/statusbar/car/CarNavigationButton.java"
        "src/com/android/systemui/statusbar/car/CarStatusBar.java"
        "src/com/android/systemui/statusbar/car/CarStatusBarKeyguardViewManager.java"
        "src/com/android/systemui/statusbar/car/CarTrustAgentUnlockDialogHelper.java"
        "src/com/android/systemui/statusbar/car/ConnectedDeviceSignalController.java"
        "src/com/android/systemui/statusbar/car/DrivingStateHelper.java"
        "src/com/android/systemui/statusbar/car/FullscreenUserSwitcher.java"
        "src/com/android/systemui/statusbar/car/PowerManagerHelper.java"
        "src/com/android/systemui/statusbar/car/SwitchToGuestTimer.java"
        "src/com/android/systemui/statusbar/car/UserGridRecyclerView.java"
        "src/com/android/systemui/statusbar/car/hvac/HvacController.java"
        "src/com/android/systemui/statusbar/car/hvac/TemperatureTextView.java"
        "src/com/android/systemui/statusbar/car/hvac/TemperatureView.java"
        "src/com/android/systemui/statusbar/hvac/AnimatedTemperatureView.java"
        "src/com/android/systemui/statusbar/hvac/TemperatureBackgroundAnimator.java"
        "src/com/android/systemui/statusbar/hvac/TemperatureColorStore.java"
        "src/com/android/systemui/statusbar/hvac/TemperatureTextAnimator.java"
        "src/com/android/systemui/voicerecognition/car/ConnectedDeviceVoiceRecognitionNotifier.java"
        "src/com/android/systemui/volume/CarVolumeDialogComponent.java"
        "src/com/android/systemui/volume/CarVolumeDialogImpl.java"
        "src/com/android/systemui/volume/CarVolumeItem.java"
        "src/com/android/systemui/volume/CarVolumeItemAdapter.java"

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
