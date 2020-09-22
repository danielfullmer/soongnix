{ android_test }:
let

#  Copyright (C) 2015 The Android Open Source Project
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

CtsDeviceServicesTestApp = android_test {
    name = "CtsDeviceServicesTestApp";
    defaults = ["cts_support_defaults"];

    static_libs = [
        "cts-wm-app-base"
        #  Used by InputMethodTestActivity for ImeAwareEditText.
        "compatibility-device-util-axt"
    ];

    srcs = [
        "src/android/server/wm/app/AltLaunchingActivity.java"
        "src/android/server/wm/app/AlwaysFocusablePipActivity.java"
        "src/android/server/wm/app/AnimationTestActivity.java"
        "src/android/server/wm/app/AssistantActivity.java"
        "src/android/server/wm/app/AssistantVoiceInteractionService.java"
        "src/android/server/wm/app/AssistantVoiceInteractionSessionService.java"
        "src/android/server/wm/app/BottomActivity.java"
        "src/android/server/wm/app/BottomLeftLayoutActivity.java"
        "src/android/server/wm/app/BottomRightLayoutActivity.java"
        "src/android/server/wm/app/BroadcastReceiverActivity.java"
        "src/android/server/wm/app/ClickableToastActivity.java"
        "src/android/server/wm/app/Components.java"
        "src/android/server/wm/app/DialogWhenLargeActivity.java"
        "src/android/server/wm/app/DismissKeyguardActivity.java"
        "src/android/server/wm/app/DismissKeyguardMethodActivity.java"
        "src/android/server/wm/app/DisplayAccessCheckEmbeddingActivity.java"
        "src/android/server/wm/app/DockedActivity.java"
        "src/android/server/wm/app/FontScaleActivity.java"
        "src/android/server/wm/app/FontScaleNoRelaunchActivity.java"
        "src/android/server/wm/app/FreeformActivity.java"
        "src/android/server/wm/app/HostActivity.java"
        "src/android/server/wm/app/InheritShowWhenLockedAddActivity.java"
        "src/android/server/wm/app/InheritShowWhenLockedAttrActivity.java"
        "src/android/server/wm/app/InheritShowWhenLockedRemoveActivity.java"
        "src/android/server/wm/app/InputMethodTestActivity.java"
        "src/android/server/wm/app/KeyguardDismissLoggerCallback.java"
        "src/android/server/wm/app/KeyguardLockActivity.java"
        "src/android/server/wm/app/LandscapeOrientationActivity.java"
        "src/android/server/wm/app/LaunchAssistantActivityFromSession.java"
        "src/android/server/wm/app/LaunchAssistantActivityIntoAssistantStack.java"
        "src/android/server/wm/app/LaunchBroadcastReceiver.java"
        "src/android/server/wm/app/LaunchEnterPipActivity.java"
        "src/android/server/wm/app/LaunchIntoPinnedStackPipActivity.java"
        "src/android/server/wm/app/LaunchPipOnPipActivity.java"
        "src/android/server/wm/app/LaunchTestOnDestroyActivity.java"
        "src/android/server/wm/app/LifecycleLogView.java"
        "src/android/server/wm/app/LiveWallpaper.java"
        "src/android/server/wm/app/LogConfigurationActivity.java"
        "src/android/server/wm/app/MinimalPostProcessingActivity.java"
        "src/android/server/wm/app/MinimalPostProcessingActivity2.java"
        "src/android/server/wm/app/MinimalPostProcessingManifestActivity.java"
        "src/android/server/wm/app/MoveTaskToBackActivity.java"
        "src/android/server/wm/app/NightModeActivity.java"
        "src/android/server/wm/app/NoDisplayActivity.java"
        "src/android/server/wm/app/NoHistoryActivity.java"
        "src/android/server/wm/app/NoInheritShowWhenLockedAttrActivity.java"
        "src/android/server/wm/app/NoRelaunchActivity.java"
        "src/android/server/wm/app/NonResizeableActivity.java"
        "src/android/server/wm/app/PipActivity.java"
        "src/android/server/wm/app/PipActivity2.java"
        "src/android/server/wm/app/PipActivityWithMinimalSize.java"
        "src/android/server/wm/app/PipActivityWithSameAffinity.java"
        "src/android/server/wm/app/PipOnStopActivity.java"
        "src/android/server/wm/app/PopupMinimalPostProcessingActivity.java"
        "src/android/server/wm/app/PortraitOrientationActivity.java"
        "src/android/server/wm/app/PresentationActivity.java"
        "src/android/server/wm/app/RecursiveActivity.java"
        "src/android/server/wm/app/RenderService.java"
        "src/android/server/wm/app/ReportFullyDrawnActivity.java"
        "src/android/server/wm/app/ResizeableActivity.java"
        "src/android/server/wm/app/ResumeWhilePausingActivity.java"
        "src/android/server/wm/app/ShowWhenLockedActivity.java"
        "src/android/server/wm/app/ShowWhenLockedAttrActivity.java"
        "src/android/server/wm/app/ShowWhenLockedAttrImeActivity.java"
        "src/android/server/wm/app/ShowWhenLockedAttrRemoveAttrActivity.java"
        "src/android/server/wm/app/ShowWhenLockedAttrRotationActivity.java"
        "src/android/server/wm/app/ShowWhenLockedAttrWithDialogActivity.java"
        "src/android/server/wm/app/ShowWhenLockedDialogActivity.java"
        "src/android/server/wm/app/ShowWhenLockedTranslucentActivity.java"
        "src/android/server/wm/app/ShowWhenLockedWithDialogActivity.java"
        "src/android/server/wm/app/SingleInstanceActivity.java"
        "src/android/server/wm/app/SingleTaskActivity.java"
        "src/android/server/wm/app/SingleTaskInstanceDisplayActivity.java"
        "src/android/server/wm/app/SingleTaskInstanceDisplayActivity2.java"
        "src/android/server/wm/app/SingleTaskInstanceDisplayActivity3.java"
        "src/android/server/wm/app/SlowCreateActivity.java"
        "src/android/server/wm/app/SplashscreenActivity.java"
        "src/android/server/wm/app/TestActivityWithSameAffinity.java"
        "src/android/server/wm/app/TestDream.java"
        "src/android/server/wm/app/TestStubbornDream.java"
        "src/android/server/wm/app/ToastActivity.java"
        "src/android/server/wm/app/TopActivity.java"
        "src/android/server/wm/app/TopLeftLayoutActivity.java"
        "src/android/server/wm/app/TopRightLayoutActivity.java"
        "src/android/server/wm/app/TrampolineActivity.java"
        "src/android/server/wm/app/TranslucentActivity.java"
        "src/android/server/wm/app/TranslucentAssistantActivity.java"
        "src/android/server/wm/app/TranslucentTestActivity.java"
        "src/android/server/wm/app/TranslucentTopActivity.java"
        "src/android/server/wm/app/TurnScreenOnActivity.java"
        "src/android/server/wm/app/TurnScreenOnAttrActivity.java"
        "src/android/server/wm/app/TurnScreenOnAttrDismissKeyguardActivity.java"
        "src/android/server/wm/app/TurnScreenOnAttrRemoveAttrActivity.java"
        "src/android/server/wm/app/TurnScreenOnDismissKeyguardActivity.java"
        "src/android/server/wm/app/TurnScreenOnShowOnLockActivity.java"
        "src/android/server/wm/app/TurnScreenOnSingleTaskActivity.java"
        "src/android/server/wm/app/TurnScreenOnWithRelayoutActivity.java"
        "src/android/server/wm/app/UnresponsiveActivity.java"
        "src/android/server/wm/app/VirtualDisplayActivity.java"
        "src/android/server/wm/app/VrTestActivity.java"
        "src/android/server/wm/app/WallpaperActivity.java"
        ":CtsVerifierMockVrListenerServiceFiles"
    ];

    sdk_version = "test_current";

    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

in { inherit CtsDeviceServicesTestApp; }
