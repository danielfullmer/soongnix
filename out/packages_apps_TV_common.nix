{ android_library }:
let

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

tv-common = android_library {
    name = "tv-common";
    srcs = [
        "src/com/android/tv/common/BaseApplication.java"
        "src/com/android/tv/common/BaseSingletons.java"
        "src/com/android/tv/common/BooleanSystemProperty.java"
        "src/com/android/tv/common/BuildConfig.java"
        "src/com/android/tv/common/CommonConstants.java"
        "src/com/android/tv/common/CommonPreferenceProvider.java"
        "src/com/android/tv/common/CommonPreferences.java"
        "src/com/android/tv/common/SoftPreconditions.java"
        "src/com/android/tv/common/TvContentRatingCache.java"
        "src/com/android/tv/common/WeakHandler.java"
        "src/com/android/tv/common/actions/InputSetupActionUtils.java"
        "src/com/android/tv/common/annotation/UsedByNative.java"
        "src/com/android/tv/common/buildtype/AospBuildTypeProvider.java"
        "src/com/android/tv/common/buildtype/BuildTypeFactory.java"
        "src/com/android/tv/common/buildtype/BuildTypeModule.java"
        "src/com/android/tv/common/buildtype/EngBuildTypeProvider.java"
        "src/com/android/tv/common/buildtype/HasBuildType.java"
        "src/com/android/tv/common/buildtype/NoJniTestBuildTypeProvider.java"
        "src/com/android/tv/common/buildtype/ProdBuildTypeProvider.java"
        "src/com/android/tv/common/compat/RecordingSessionCompat.java"
        "src/com/android/tv/common/compat/TisSessionCompat.java"
        "src/com/android/tv/common/compat/TvInputConstantCompat.java"
        "src/com/android/tv/common/compat/TvInputInfoCompat.java"
        "src/com/android/tv/common/compat/TvRecordingClientCompat.java"
        "src/com/android/tv/common/compat/TvViewCompat.java"
        "src/com/android/tv/common/compat/api/PrivateCommandSender.java"
        "src/com/android/tv/common/compat/api/RecordingClientCallbackCompatEvents.java"
        "src/com/android/tv/common/compat/api/RecordingSessionCompatCommands.java"
        "src/com/android/tv/common/compat/api/RecordingSessionCompatEvents.java"
        "src/com/android/tv/common/compat/api/SessionCompatCommands.java"
        "src/com/android/tv/common/compat/api/SessionCompatEvents.java"
        "src/com/android/tv/common/compat/api/SessionEventNotifier.java"
        "src/com/android/tv/common/compat/api/TvInputCallbackCompatEvents.java"
        "src/com/android/tv/common/compat/api/TvRecordingClientCompatCommands.java"
        "src/com/android/tv/common/compat/api/TvViewCompatCommands.java"
        "src/com/android/tv/common/compat/internal/Constants.java"
        "src/com/android/tv/common/compat/internal/RecordingClientCompatProcessor.java"
        "src/com/android/tv/common/compat/internal/RecordingSessionCompatProcessor.java"
        "src/com/android/tv/common/compat/internal/SessionCompatProcessor.java"
        "src/com/android/tv/common/compat/internal/TifSessionCompatProcessor.java"
        "src/com/android/tv/common/compat/internal/TvViewCompatProcessor.java"
        "src/com/android/tv/common/compat/internal/ViewCompatProcessor.java"
        "src/com/android/tv/common/concurrent/NamedThreadFactory.java"
        "src/com/android/tv/common/customization/CustomAction.java"
        "src/com/android/tv/common/customization/CustomizationManager.java"
        "src/com/android/tv/common/dagger/ApplicationModule.java"
        "src/com/android/tv/common/dagger/annotations/ApplicationContext.java"
        "src/com/android/tv/common/dagger/annotations/MainLooper.java"
        "src/com/android/tv/common/dagger/init/SafePreDaggerInitializer.java"
        "src/com/android/tv/common/data/RecordedProgramState.java"
        "src/com/android/tv/common/dev/DeveloperPreference.java"
        "src/com/android/tv/common/dev/DeveloperPreferences.java"
        "src/com/android/tv/common/feature/BuildTypeFeature.java"
        "src/com/android/tv/common/feature/CommonFeatures.java"
        "src/com/android/tv/common/feature/DeveloperPreferenceFeature.java"
        "src/com/android/tv/common/feature/Feature.java"
        "src/com/android/tv/common/feature/FeatureUtils.java"
        "src/com/android/tv/common/feature/FlagFeature.java"
        "src/com/android/tv/common/feature/Model.java"
        "src/com/android/tv/common/feature/PackageVersionFeature.java"
        "src/com/android/tv/common/feature/PermissionFeature.java"
        "src/com/android/tv/common/feature/PropertyFeature.java"
        "src/com/android/tv/common/feature/Sdk.java"
        "src/com/android/tv/common/feature/SharedPreferencesFeature.java"
        "src/com/android/tv/common/feature/SystemAppFeature.java"
        "src/com/android/tv/common/feature/TestableFeature.java"
        "src/com/android/tv/common/flags/BackendKnobsFlags.java"
        "src/com/android/tv/common/flags/CloudEpgFlags.java"
        "src/com/android/tv/common/flags/DvrFlags.java"
        "src/com/android/tv/common/flags/LegacyFlags.java"
        "src/com/android/tv/common/flags/MessagesFlags.java"
        "src/com/android/tv/common/flags/SetupFlags.java"
        "src/com/android/tv/common/flags/StartupFlags.java"
        "src/com/android/tv/common/flags/TunerFlags.java"
        "src/com/android/tv/common/flags/UiFlags.java"
        "src/com/android/tv/common/flags/has/HasCloudEpgFlags.java"
        "src/com/android/tv/common/flags/has/HasUiFlags.java"
        "src/com/android/tv/common/flags/has/HasUtils.java"
        "src/com/android/tv/common/flags/impl/DefaultBackendKnobsFlags.java"
        "src/com/android/tv/common/flags/impl/DefaultCloudEpgFlags.java"
        "src/com/android/tv/common/flags/impl/DefaultDvrFlags.java"
        "src/com/android/tv/common/flags/impl/DefaultFlagsModule.java"
        "src/com/android/tv/common/flags/impl/DefaultLegacyFlags.java"
        "src/com/android/tv/common/flags/impl/DefaultMessagesFlags.java"
        "src/com/android/tv/common/flags/impl/DefaultSetupFlags.java"
        "src/com/android/tv/common/flags/impl/DefaultStartupFlags.java"
        "src/com/android/tv/common/flags/impl/DefaultTunerFlags.java"
        "src/com/android/tv/common/flags/impl/DefaultUiFlags.java"
        "src/com/android/tv/common/flags/impl/SettableFlagsModule.java"
        "src/com/android/tv/common/memory/MemoryManageable.java"
        "src/com/android/tv/common/recording/RecordingCapability.java"
        "src/com/android/tv/common/recording/RecordingStorageStatusManager.java"
        "src/com/android/tv/common/singletons/HasSingletons.java"
        "src/com/android/tv/common/singletons/HasTvInputId.java"
        "src/com/android/tv/common/support/tis/BaseTvInputService.java"
        "src/com/android/tv/common/support/tis/SessionManager.java"
        "src/com/android/tv/common/support/tis/SimpleSessionManager.java"
        "src/com/android/tv/common/support/tis/TifSession.java"
        "src/com/android/tv/common/support/tis/WrappedSession.java"
        "src/com/android/tv/common/support/tvprovider/TvContractCompatX.java"
        "src/com/android/tv/common/ui/setup/OnActionClickListener.java"
        "src/com/android/tv/common/ui/setup/SetupActionHelper.java"
        "src/com/android/tv/common/ui/setup/SetupActivity.java"
        "src/com/android/tv/common/ui/setup/SetupFragment.java"
        "src/com/android/tv/common/ui/setup/SetupGuidedStepFragment.java"
        "src/com/android/tv/common/ui/setup/SetupMultiPaneFragment.java"
        "src/com/android/tv/common/ui/setup/animation/FadeAndShortSlide.java"
        "src/com/android/tv/common/ui/setup/animation/SetupAnimationHelper.java"
        "src/com/android/tv/common/ui/setup/animation/TranslationAnimationCreator.java"
        "src/com/android/tv/common/util/AutoCloseableUtils.java"
        "src/com/android/tv/common/util/Clock.java"
        "src/com/android/tv/common/util/CollectionUtils.java"
        "src/com/android/tv/common/util/CommonUtils.java"
        "src/com/android/tv/common/util/ContentUriUtils.java"
        "src/com/android/tv/common/util/Debug.java"
        "src/com/android/tv/common/util/DurationTimer.java"
        "src/com/android/tv/common/util/LocationUtils.java"
        "src/com/android/tv/common/util/NetworkTrafficTags.java"
        "src/com/android/tv/common/util/PermissionUtils.java"
        "src/com/android/tv/common/util/PostalCodeUtils.java"
        "src/com/android/tv/common/util/SharedPreferencesUtils.java"
        "src/com/android/tv/common/util/StringUtils.java"
        "src/com/android/tv/common/util/SystemProperties.java"
        "src/com/android/tv/common/util/SystemPropertiesProxy.java"
        "src/com/android/tv/common/util/sql/SqlParams.java"
        "src/com/android/tv/common/compat/internal/recording_commands.proto"
        "src/com/android/tv/common/compat/internal/recording_events.proto"
        "src/com/android/tv/common/compat/internal/tif_commands.proto"
        "src/com/android/tv/common/compat/internal/tif_events.proto"
        "src/com/android/tv/common/flags/proto/typed-features.proto"
    ];

    sdk_version = "system_current";

    proto = {
        type = "lite";
    };

    resource_dirs = ["res"];

    libs = [
        "android-support-annotations"
        "tv-auto-value-jar"
        "tv-auto-factory-jar"
        "tv-error-prone-annotations-jar"
        "tv-javax-annotations-jar"

    ];

    static_libs = [
        "androidx.legacy_legacy-support-core-ui"
        "androidx.appcompat_appcompat"
        "androidx.preference_preference"
        "androidx.leanback_leanback"
        "androidx.tvprovider_tvprovider"
        "tv-guava-android-jar"
        "tv-guava-failureaccess-jar"
        "jsr330"
        "tv-lib-dagger"
        "tv-lib-exoplayer"
        "tv-lib-exoplayer-v2-core"
        "tv-lib-dagger-android"
    ];

    plugins = [
        "tv-auto-value"
        "tv-auto-factory"
        "tv-lib-dagger-android-processor"
        "tv-lib-dagger-compiler"
    ];

    min_sdk_version = "23";

    #  TODO(b/77284273): generate build config after dagger supports libraries
    # include $(LOCAL_PATH)/buildconfig.mk

};

in { inherit tv-common; }
