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
        "src/com/android/systemui/CarComponentBinder.java"
        "src/com/android/systemui/CarSystemUIBinder.java"
        "src/com/android/systemui/CarSystemUIFactory.java"
        "src/com/android/systemui/CarSystemUIModule.java"
        "src/com/android/systemui/CarSystemUIRootComponent.java"
        "src/com/android/systemui/car/CarDeviceProvisionedController.java"
        "src/com/android/systemui/car/CarDeviceProvisionedControllerImpl.java"
        "src/com/android/systemui/car/CarDeviceProvisionedListener.java"
        "src/com/android/systemui/car/CarServiceProvider.java"
        "src/com/android/systemui/car/bluetooth/CarBatteryController.java"
        "src/com/android/systemui/car/bluetooth/ConnectedDeviceSignalController.java"
        "src/com/android/systemui/car/hvac/AnimatedTemperatureView.java"
        "src/com/android/systemui/car/hvac/HvacController.java"
        "src/com/android/systemui/car/hvac/TemperatureBackgroundAnimator.java"
        "src/com/android/systemui/car/hvac/TemperatureColorStore.java"
        "src/com/android/systemui/car/hvac/TemperatureTextAnimator.java"
        "src/com/android/systemui/car/hvac/TemperatureTextView.java"
        "src/com/android/systemui/car/hvac/TemperatureView.java"
        "src/com/android/systemui/car/keyguard/CarKeyguardViewController.java"
        "src/com/android/systemui/car/keyguard/CarKeyguardViewMediator.java"
        "src/com/android/systemui/car/navigationbar/AssitantButton.java"
        "src/com/android/systemui/car/navigationbar/ButtonRoleHolderController.java"
        "src/com/android/systemui/car/navigationbar/ButtonSelectionStateController.java"
        "src/com/android/systemui/car/navigationbar/ButtonSelectionStateListener.java"
        "src/com/android/systemui/car/navigationbar/CarNavigationBar.java"
        "src/com/android/systemui/car/navigationbar/CarNavigationBarController.java"
        "src/com/android/systemui/car/navigationbar/CarNavigationBarView.java"
        "src/com/android/systemui/car/navigationbar/CarNavigationButton.java"
        "src/com/android/systemui/car/navigationbar/NavigationBarViewFactory.java"
        "src/com/android/systemui/car/notification/BottomNotificationPanelViewMediator.java"
        "src/com/android/systemui/car/notification/CarHeadsUpNotificationSystemContainer.java"
        "src/com/android/systemui/car/notification/CarNotificationModule.java"
        "src/com/android/systemui/car/notification/NotificationPanelViewController.java"
        "src/com/android/systemui/car/notification/NotificationPanelViewMediator.java"
        "src/com/android/systemui/car/notification/NotificationVisibilityLogger.java"
        "src/com/android/systemui/car/notification/PowerManagerHelper.java"
        "src/com/android/systemui/car/notification/TopNotificationPanelViewMediator.java"
        "src/com/android/systemui/car/sideloaded/SideLoadedAppController.java"
        "src/com/android/systemui/car/sideloaded/SideLoadedAppDetector.java"
        "src/com/android/systemui/car/sideloaded/SideLoadedAppListener.java"
        "src/com/android/systemui/car/sideloaded/SideLoadedAppStateController.java"
        "src/com/android/systemui/car/statusbar/CarStatusBar.java"
        "src/com/android/systemui/car/statusbar/CarStatusBarKeyguardViewManager.java"
        "src/com/android/systemui/car/statusbar/CarStatusBarModule.java"
        "src/com/android/systemui/car/statusbar/DozeServiceHost.java"
        "src/com/android/systemui/car/statusbar/DummyNotificationShadeWindowController.java"
        "src/com/android/systemui/car/userswitcher/CarStatusBarHeader.java"
        "src/com/android/systemui/car/userswitcher/FullScreenUserSwitcherViewController.java"
        "src/com/android/systemui/car/userswitcher/FullscreenUserSwitcherViewMediator.java"
        "src/com/android/systemui/car/userswitcher/UserGridRecyclerView.java"
        "src/com/android/systemui/car/userswitcher/UserIconProvider.java"
        "src/com/android/systemui/car/userswitcher/UserSwitchTransitionViewController.java"
        "src/com/android/systemui/car/userswitcher/UserSwitchTransitionViewMediator.java"
        "src/com/android/systemui/car/voicerecognition/ConnectedDeviceVoiceRecognitionNotifier.java"
        "src/com/android/systemui/car/volume/CarVolumeDialogComponent.java"
        "src/com/android/systemui/car/volume/CarVolumeDialogImpl.java"
        "src/com/android/systemui/car/volume/CarVolumeItem.java"
        "src/com/android/systemui/car/volume/CarVolumeItemAdapter.java"
        "src/com/android/systemui/car/volume/VolumeUI.java"
        "src/com/android/systemui/car/window/OverlayPanelViewController.java"
        "src/com/android/systemui/car/window/OverlayViewController.java"
        "src/com/android/systemui/car/window/OverlayViewGlobalStateController.java"
        "src/com/android/systemui/car/window/OverlayViewMediator.java"
        "src/com/android/systemui/car/window/OverlayWindowModule.java"
        "src/com/android/systemui/car/window/SystemUIOverlayWindowController.java"
        "src/com/android/systemui/car/window/SystemUIOverlayWindowManager.java"

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
        "car-ui-lib"
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
        "android.car"
    ];

    manifest = "AndroidManifest.xml";

    plugins = ["dagger2-compiler-2.19"];

};

CarSystemUI-tests = android_library {
    name = "CarSystemUI-tests";
    manifest = "tests/AndroidManifest.xml";
    resource_dirs = [
        "tests/res"
        "res-keyguard"
        "res"
    ];
    srcs = [
        "tests/src/com/android/AAAPlusPlusVerifySysuiRequiredTestPropertiesTest.java"
        "tests/src/com/android/systemui/car/hvac/HvacControllerTest.java"
        "tests/src/com/android/systemui/car/keyguard/CarKeyguardViewControllerTest.java"
        "tests/src/com/android/systemui/car/navigationbar/ButtonRoleHolderControllerTest.java"
        "tests/src/com/android/systemui/car/navigationbar/ButtonSelectionStateControllerTest.java"
        "tests/src/com/android/systemui/car/navigationbar/CarNavigationBarControllerTest.java"
        "tests/src/com/android/systemui/car/navigationbar/CarNavigationBarTest.java"
        "tests/src/com/android/systemui/car/navigationbar/CarNavigationBarViewTest.java"
        "tests/src/com/android/systemui/car/navigationbar/CarNavigationButtonTest.java"
        "tests/src/com/android/systemui/car/notification/CarHeadsUpNotificationSystemContainerTest.java"
        "tests/src/com/android/systemui/car/notification/NotificationVisibilityLoggerTest.java"
        "tests/src/com/android/systemui/car/sideloaded/SideLoadedAppDetectorTest.java"
        "tests/src/com/android/systemui/car/sideloaded/SideLoadedAppListenerTest.java"
        "tests/src/com/android/systemui/car/userswitcher/UserSwitchTransitionViewControllerTest.java"
        "tests/src/com/android/systemui/car/userswitcher/UserSwitchTransitionViewMediatorTest.java"
        "tests/src/com/android/systemui/car/voicerecognition/ConnectedDeviceVoiceRecognitionNotifierTest.java"
        "tests/src/com/android/systemui/car/window/OverlayPanelViewControllerTest.java"
        "tests/src/com/android/systemui/car/window/OverlayViewControllerTest.java"
        "tests/src/com/android/systemui/car/window/OverlayViewGlobalStateControllerTest.java"
        "src/com/android/systemui/CarComponentBinder.java"
        "src/com/android/systemui/CarSystemUIBinder.java"
        "src/com/android/systemui/CarSystemUIFactory.java"
        "src/com/android/systemui/CarSystemUIModule.java"
        "src/com/android/systemui/CarSystemUIRootComponent.java"
        "src/com/android/systemui/car/CarDeviceProvisionedController.java"
        "src/com/android/systemui/car/CarDeviceProvisionedControllerImpl.java"
        "src/com/android/systemui/car/CarDeviceProvisionedListener.java"
        "src/com/android/systemui/car/CarServiceProvider.java"
        "src/com/android/systemui/car/bluetooth/CarBatteryController.java"
        "src/com/android/systemui/car/bluetooth/ConnectedDeviceSignalController.java"
        "src/com/android/systemui/car/hvac/AnimatedTemperatureView.java"
        "src/com/android/systemui/car/hvac/HvacController.java"
        "src/com/android/systemui/car/hvac/TemperatureBackgroundAnimator.java"
        "src/com/android/systemui/car/hvac/TemperatureColorStore.java"
        "src/com/android/systemui/car/hvac/TemperatureTextAnimator.java"
        "src/com/android/systemui/car/hvac/TemperatureTextView.java"
        "src/com/android/systemui/car/hvac/TemperatureView.java"
        "src/com/android/systemui/car/keyguard/CarKeyguardViewController.java"
        "src/com/android/systemui/car/keyguard/CarKeyguardViewMediator.java"
        "src/com/android/systemui/car/navigationbar/AssitantButton.java"
        "src/com/android/systemui/car/navigationbar/ButtonRoleHolderController.java"
        "src/com/android/systemui/car/navigationbar/ButtonSelectionStateController.java"
        "src/com/android/systemui/car/navigationbar/ButtonSelectionStateListener.java"
        "src/com/android/systemui/car/navigationbar/CarNavigationBar.java"
        "src/com/android/systemui/car/navigationbar/CarNavigationBarController.java"
        "src/com/android/systemui/car/navigationbar/CarNavigationBarView.java"
        "src/com/android/systemui/car/navigationbar/CarNavigationButton.java"
        "src/com/android/systemui/car/navigationbar/NavigationBarViewFactory.java"
        "src/com/android/systemui/car/notification/BottomNotificationPanelViewMediator.java"
        "src/com/android/systemui/car/notification/CarHeadsUpNotificationSystemContainer.java"
        "src/com/android/systemui/car/notification/CarNotificationModule.java"
        "src/com/android/systemui/car/notification/NotificationPanelViewController.java"
        "src/com/android/systemui/car/notification/NotificationPanelViewMediator.java"
        "src/com/android/systemui/car/notification/NotificationVisibilityLogger.java"
        "src/com/android/systemui/car/notification/PowerManagerHelper.java"
        "src/com/android/systemui/car/notification/TopNotificationPanelViewMediator.java"
        "src/com/android/systemui/car/sideloaded/SideLoadedAppController.java"
        "src/com/android/systemui/car/sideloaded/SideLoadedAppDetector.java"
        "src/com/android/systemui/car/sideloaded/SideLoadedAppListener.java"
        "src/com/android/systemui/car/sideloaded/SideLoadedAppStateController.java"
        "src/com/android/systemui/car/statusbar/CarStatusBar.java"
        "src/com/android/systemui/car/statusbar/CarStatusBarKeyguardViewManager.java"
        "src/com/android/systemui/car/statusbar/CarStatusBarModule.java"
        "src/com/android/systemui/car/statusbar/DozeServiceHost.java"
        "src/com/android/systemui/car/statusbar/DummyNotificationShadeWindowController.java"
        "src/com/android/systemui/car/userswitcher/CarStatusBarHeader.java"
        "src/com/android/systemui/car/userswitcher/FullScreenUserSwitcherViewController.java"
        "src/com/android/systemui/car/userswitcher/FullscreenUserSwitcherViewMediator.java"
        "src/com/android/systemui/car/userswitcher/UserGridRecyclerView.java"
        "src/com/android/systemui/car/userswitcher/UserIconProvider.java"
        "src/com/android/systemui/car/userswitcher/UserSwitchTransitionViewController.java"
        "src/com/android/systemui/car/userswitcher/UserSwitchTransitionViewMediator.java"
        "src/com/android/systemui/car/voicerecognition/ConnectedDeviceVoiceRecognitionNotifier.java"
        "src/com/android/systemui/car/volume/CarVolumeDialogComponent.java"
        "src/com/android/systemui/car/volume/CarVolumeDialogImpl.java"
        "src/com/android/systemui/car/volume/CarVolumeItem.java"
        "src/com/android/systemui/car/volume/CarVolumeItemAdapter.java"
        "src/com/android/systemui/car/volume/VolumeUI.java"
        "src/com/android/systemui/car/window/OverlayPanelViewController.java"
        "src/com/android/systemui/car/window/OverlayViewController.java"
        "src/com/android/systemui/car/window/OverlayViewGlobalStateController.java"
        "src/com/android/systemui/car/window/OverlayViewMediator.java"
        "src/com/android/systemui/car/window/OverlayWindowModule.java"
        "src/com/android/systemui/car/window/SystemUIOverlayWindowController.java"
        "src/com/android/systemui/car/window/SystemUIOverlayWindowManager.java"

    ];
    static_libs = [
        "SystemUI-tests"
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
        "car-ui-lib"
        "SystemUI-tags"
        "SystemUI-proto"
        "metrics-helper-lib"
        "androidx.test.rules"
        "hamcrest-library"
        "mockito-target-inline-minus-junit4"
        "testables"
        "truth-prebuilt"
        "dagger2-2.19"
        "//external/kotlinc:kotlin-annotations"
    ];
    libs = [
        "android.test.runner"
        "android.test.base"
        "android.car"
    ];

    aaptflags = [
        "--extra-packages"
        "com.android.systemui"
    ];

    plugins = ["dagger2-compiler-2.19"];
};

CarSystemUI = android_app {
    name = "CarSystemUI";

    static_libs = [
        "CarSystemUI-core"
    ];

    libs = [
        "android.car"
    ];

    resource_dirs = [];

    overrides = [
        "SystemUI"
    ];

    platform_apis = true;
    system_ext_specific = true;
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

in { inherit CarSystemUI CarSystemUI-core CarSystemUI-tests; }
