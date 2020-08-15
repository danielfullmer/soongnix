{ java_library }:
let

#
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
#

app-helpers-common-interfaces = java_library {
    name = "app-helpers-common-interfaces";
    libs = ["ub-uiautomator"];
    static_libs = ["app-helpers-core"];
    srcs = [
        "common/src/android/platform/helpers/IAlarmHelper.java"
        "common/src/android/platform/helpers/IContactsHelper.java"
        "common/src/android/platform/helpers/IGoogleFitHelper.java"
        "common/src/android/platform/helpers/IGoogleKeyboardHelper.java"
        "common/src/android/platform/helpers/IMapsHelper.java"
        "common/src/android/platform/helpers/INewsHelper.java"
        "common/src/android/platform/helpers/IPhoneHelper.java"
        "common/src/android/platform/helpers/IPlayMoviesHelper.java"
        "common/src/android/platform/helpers/IPlayMusicHelper.java"
        "common/src/android/platform/helpers/IPlayStoreHelper.java"
        "common/src/android/platform/helpers/IRecentsHelper.java"
        "common/src/android/platform/helpers/ISettingsIntelligenceHelper.java"
        "common/src/android/platform/helpers/IStopwatchHelper.java"
        "common/src/android/platform/helpers/ITimerHelper.java"
        "common/src/android/platform/helpers/IWazeHelper.java"
        "common/src/android/platform/helpers/IYouTubeGoHelper.java"
        "common/src/android/platform/helpers/IYouTubeHelper.java"
    ];
    sdk_version = "test_current";
};

# #####################################

app-helpers-auto-interfaces = java_library {
    name = "app-helpers-auto-interfaces";
    libs = [
        "ub-uiautomator"
        "app-helpers-core"
        "androidx.test.runner"
    ];
    static_libs = ["app-helpers-common-interfaces"];
    srcs = [
        "auto/src/android/platform/helpers/IAutoAccountsHelper.java"
        "auto/src/android/platform/helpers/IAutoAppGridHelper.java"
        "auto/src/android/platform/helpers/IAutoAppInfoSettingsHelper.java"
        "auto/src/android/platform/helpers/IAutoBluetoothHelper.java"
        "auto/src/android/platform/helpers/IAutoDateTimeSettingsHelper.java"
        "auto/src/android/platform/helpers/IAutoDialHelper.java"
        "auto/src/android/platform/helpers/IAutoGenericAppHelper.java"
        "auto/src/android/platform/helpers/IAutoGooglePlayHelper.java"
        "auto/src/android/platform/helpers/IAutoHomeHelper.java"
        "auto/src/android/platform/helpers/IAutoMapsHelper.java"
        "auto/src/android/platform/helpers/IAutoMediaCenterHelper.java"
        "auto/src/android/platform/helpers/IAutoMediaCenterMinimizeControlBarHelper.java"
        "auto/src/android/platform/helpers/IAutoMediaCenterNowPlayingHelper.java"
        "auto/src/android/platform/helpers/IAutoMediaHelper.java"
        "auto/src/android/platform/helpers/IAutoNotificationHelper.java"
        "auto/src/android/platform/helpers/IAutoNotificationMockingHelper.java"
        "auto/src/android/platform/helpers/IAutoOverviewHelper.java"
        "auto/src/android/platform/helpers/IAutoRadioHelper.java"
        "auto/src/android/platform/helpers/IAutoSUWHelper.java"
        "auto/src/android/platform/helpers/IAutoSettingHelper.java"
        "auto/src/android/platform/helpers/IAutoSystemSettingsHelper.java"
        "auto/src/android/platform/helpers/IAutoUiProviderHelper.java"
        "auto/src/android/platform/helpers/IAutoVehicleHardKeysHelper.java"
        "auto/src/android/platform/helpers/IAutoWifiHelper.java"
        "auto/src/android/platform/helpers/utility/Scrollable.java"
        "handheld/src/android/platform/helpers/INotificationHelper.java"
    ];
    sdk_version = "test_current";
};

# #####################################

app-helpers-clockwork-interfaces = java_library {
    name = "app-helpers-clockwork-interfaces";
    libs = [
        "ub-uiautomator"
        "app-helpers-core"
    ];
    static_libs = ["app-helpers-common-interfaces"];
    srcs = [
        "clockwork/src/android/platform/helpers/IAgendaHelper.java"
        "clockwork/src/android/platform/helpers/IMapsClockworkHelper.java"
        "clockwork/src/android/platform/helpers/IRemindersHelper.java"
        "clockwork/src/android/platform/helpers/ITranslateHelper.java"
        "clockwork/src/android/platform/helpers/IVoiceHelper.java"
        "clockwork/src/android/platform/helpers/IWatchFacePickerHelper.java"
        "clockwork/src/android/platform/helpers/IWeatherHelper.java"
        "clockwork/src/android/platform/helpers/IYourFeedHelper.java"
    ];
    sdk_version = "test_current";
};

# #####################################

app-helpers-handheld-interfaces = java_library {
    name = "app-helpers-handheld-interfaces";
    libs = [
        "ub-uiautomator"
        "app-helpers-core"
    ];
    static_libs = ["app-helpers-common-interfaces"];
    srcs = [
        "handheld/src/android/platform/helpers/HandheldHelperTest.java"
        "handheld/src/android/platform/helpers/IBusinessCardHelper.java"
        "handheld/src/android/platform/helpers/ICalculatorHelper.java"
        "handheld/src/android/platform/helpers/ICalendarHelper.java"
        "handheld/src/android/platform/helpers/IChromeHelper.java"
        "handheld/src/android/platform/helpers/IClockHelper.java"
        "handheld/src/android/platform/helpers/IDownloadsHelper.java"
        "handheld/src/android/platform/helpers/IDriveHelper.java"
        "handheld/src/android/platform/helpers/IGmailHelper.java"
        "handheld/src/android/platform/helpers/IGoogleCameraHelper.java"
        "handheld/src/android/platform/helpers/IGoogleDocsHelper.java"
        "handheld/src/android/platform/helpers/IGoogleHelper.java"
        "handheld/src/android/platform/helpers/IGoogleMessengerHelper.java"
        "handheld/src/android/platform/helpers/INotificationHelper.java"
        "handheld/src/android/platform/helpers/IPerformanceLaunchHelper.java"
        "handheld/src/android/platform/helpers/IPhotosHelper.java"
        "handheld/src/android/platform/helpers/IPlayBooksHelper.java"
        "handheld/src/android/platform/helpers/IQuickSearchBoxHelper.java"
        "handheld/src/android/platform/helpers/IQuickSettingsHelper.java"
        "handheld/src/android/platform/helpers/IYTMusicHelper.java"
    ];
    sdk_version = "test_current";
};

# #####################################

app-helpers-tv-interfaces = java_library {
    name = "app-helpers-tv-interfaces";
    libs = [
        "ub-uiautomator"
        "app-helpers-core"
        "launcher-helper-lib"
    ];
    static_libs = [
        "app-helpers-common-interfaces"
        "dpad-util"
    ];
    srcs = ["tv/src/android/platform/helpers/AbstractLeanbackAppHelper.java"];
    sdk_version = "test_current";
};

in { inherit app-helpers-auto-interfaces app-helpers-clockwork-interfaces app-helpers-common-interfaces app-helpers-handheld-interfaces app-helpers-tv-interfaces; }
