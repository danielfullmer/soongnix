{ android_library, genrule, java_library }:
let

#  Copyright (C) 2017 The Android Open Source Project
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

statslog-SystemUI-java-gen = genrule {
    name = "statslog-SystemUI-java-gen";
    tools = ["stats-log-api-gen"];
    cmd = "$(location stats-log-api-gen) --java $(out) --module sysui --javaPackage com.android.systemui.shared.system --javaClass SysUiStatsLog";
    out = ["com/android/systemui/shared/system/SysUiStatsLog.java"];
};

SystemUI-statsd = java_library {
    name = "SystemUI-statsd";

    srcs = [
        ":statslog-SystemUI-java-gen"
    ];
};

SystemUISharedLib = android_library {
    name = "SystemUISharedLib";
    srcs = [
        "src/com/android/systemui/shared/plugins/PluginEnabler.java"
        "src/com/android/systemui/shared/plugins/PluginInitializer.java"
        "src/com/android/systemui/shared/plugins/PluginInstanceManager.java"
        "src/com/android/systemui/shared/plugins/PluginManager.java"
        "src/com/android/systemui/shared/plugins/PluginManagerImpl.java"
        "src/com/android/systemui/shared/plugins/PluginPrefs.java"
        "src/com/android/systemui/shared/plugins/VersionInfo.java"
        "src/com/android/systemui/shared/recents/model/Task.java"
        "src/com/android/systemui/shared/recents/model/ThumbnailData.java"
        "src/com/android/systemui/shared/recents/utilities/AppTrace.java"
        "src/com/android/systemui/shared/recents/utilities/BitmapUtil.java"
        "src/com/android/systemui/shared/recents/utilities/RectFEvaluator.java"
        "src/com/android/systemui/shared/recents/utilities/Utilities.java"
        "src/com/android/systemui/shared/recents/view/AppTransitionAnimationSpecCompat.java"
        "src/com/android/systemui/shared/recents/view/AppTransitionAnimationSpecsFuture.java"
        "src/com/android/systemui/shared/recents/view/RecentsTransition.java"
        "src/com/android/systemui/shared/system/ActivityCompat.java"
        "src/com/android/systemui/shared/system/ActivityManagerWrapper.java"
        "src/com/android/systemui/shared/system/ActivityOptionsCompat.java"
        "src/com/android/systemui/shared/system/AssistDataReceiver.java"
        "src/com/android/systemui/shared/system/BackgroundExecutor.java"
        "src/com/android/systemui/shared/system/BlurUtils.java"
        "src/com/android/systemui/shared/system/ChoreographerCompat.java"
        "src/com/android/systemui/shared/system/ConfigurationCompat.java"
        "src/com/android/systemui/shared/system/ContextCompat.java"
        "src/com/android/systemui/shared/system/DevicePolicyManagerWrapper.java"
        "src/com/android/systemui/shared/system/DockedStackListenerCompat.java"
        "src/com/android/systemui/shared/system/InputChannelCompat.java"
        "src/com/android/systemui/shared/system/InputConsumerController.java"
        "src/com/android/systemui/shared/system/InputMonitorCompat.java"
        "src/com/android/systemui/shared/system/KeyguardManagerCompat.java"
        "src/com/android/systemui/shared/system/LatencyTrackerCompat.java"
        "src/com/android/systemui/shared/system/LauncherEventUtil.java"
        "src/com/android/systemui/shared/system/MetricsLoggerCompat.java"
        "src/com/android/systemui/shared/system/PackageManagerWrapper.java"
        "src/com/android/systemui/shared/system/PinnedStackListenerForwarder.java"
        "src/com/android/systemui/shared/system/QuickStepContract.java"
        "src/com/android/systemui/shared/system/RecentsAnimationControllerCompat.java"
        "src/com/android/systemui/shared/system/RecentsAnimationListener.java"
        "src/com/android/systemui/shared/system/RemoteAnimationAdapterCompat.java"
        "src/com/android/systemui/shared/system/RemoteAnimationDefinitionCompat.java"
        "src/com/android/systemui/shared/system/RemoteAnimationRunnerCompat.java"
        "src/com/android/systemui/shared/system/RemoteAnimationTargetCompat.java"
        "src/com/android/systemui/shared/system/RotationWatcher.java"
        "src/com/android/systemui/shared/system/SurfaceControlCompat.java"
        "src/com/android/systemui/shared/system/SurfaceViewRequestReceiver.java"
        "src/com/android/systemui/shared/system/SurfaceViewRequestUtils.java"
        "src/com/android/systemui/shared/system/SyncRtSurfaceTransactionApplierCompat.java"
        "src/com/android/systemui/shared/system/SystemGestureExclusionListenerCompat.java"
        "src/com/android/systemui/shared/system/TaskDescriptionCompat.java"
        "src/com/android/systemui/shared/system/TaskInfoCompat.java"
        "src/com/android/systemui/shared/system/TaskStackChangeListener.java"
        "src/com/android/systemui/shared/system/TaskStackChangeListeners.java"
        "src/com/android/systemui/shared/system/ThreadedRendererCompat.java"
        "src/com/android/systemui/shared/system/TonalCompat.java"
        "src/com/android/systemui/shared/system/TransactionCompat.java"
        "src/com/android/systemui/shared/system/UniversalSmartspaceUtils.java"
        "src/com/android/systemui/shared/system/ViewRootImplCompat.java"
        "src/com/android/systemui/shared/system/WallpaperManagerCompat.java"
        "src/com/android/systemui/shared/system/WindowCallbacksCompat.java"
        "src/com/android/systemui/shared/system/WindowManagerWrapper.java"
        "src/com/android/systemui/shared/tracing/FrameProtoTracer.java"
        "src/com/android/systemui/shared/tracing/ProtoTraceable.java"
        "src/com/android/systemui/shared/recents/IOverviewProxy.aidl"
        "src/com/android/systemui/shared/recents/IPinnedStackAnimationListener.aidl"
        "src/com/android/systemui/shared/recents/ISystemUiProxy.aidl"
    ];

    static_libs = [
        "PluginCoreLib"
    ];

    java_version = "1.8";
    min_sdk_version = "26";
};

in { inherit SystemUI-statsd SystemUISharedLib statslog-SystemUI-java-gen; }
