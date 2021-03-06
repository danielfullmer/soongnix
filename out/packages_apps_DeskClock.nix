{ android_app }:
let

DeskClock = android_app {
    name = "DeskClock";
    resource_dirs = ["res"];
    sdk_version = "current";
    overrides = ["AlarmClock"];
    srcs = [
        "src/com/android/alarmclock/AnalogAppWidgetProvider.java"
        "src/com/android/alarmclock/DigitalAppWidgetCityService.java"
        "src/com/android/alarmclock/DigitalAppWidgetCityViewsFactory.java"
        "src/com/android/alarmclock/DigitalAppWidgetProvider.java"
        "src/com/android/alarmclock/WidgetUtils.java"
        "src/com/android/deskclock/AlarmAlertWakeLock.java"
        "src/com/android/deskclock/AlarmClockFragment.java"
        "src/com/android/deskclock/AlarmInitReceiver.java"
        "src/com/android/deskclock/AlarmRecyclerView.java"
        "src/com/android/deskclock/AlarmSelectionActivity.java"
        "src/com/android/deskclock/AlarmUtils.java"
        "src/com/android/deskclock/AnalogClock.java"
        "src/com/android/deskclock/AnimatorUtils.java"
        "src/com/android/deskclock/AsyncHandler.java"
        "src/com/android/deskclock/AsyncRingtonePlayer.java"
        "src/com/android/deskclock/BaseActivity.java"
        "src/com/android/deskclock/CircleButtonsLayout.java"
        "src/com/android/deskclock/ClockFragment.java"
        "src/com/android/deskclock/DeskClock.java"
        "src/com/android/deskclock/DeskClockApplication.java"
        "src/com/android/deskclock/DeskClockBackupAgent.java"
        "src/com/android/deskclock/DeskClockFragment.java"
        "src/com/android/deskclock/DropShadowController.java"
        "src/com/android/deskclock/FabContainer.java"
        "src/com/android/deskclock/FabController.java"
        "src/com/android/deskclock/FetchMatchingAlarmsAction.java"
        "src/com/android/deskclock/FormattedTextUtils.java"
        "src/com/android/deskclock/FragmentTabPagerAdapter.java"
        "src/com/android/deskclock/HandleApiCalls.java"
        "src/com/android/deskclock/HandleShortcuts.java"
        "src/com/android/deskclock/ItemAdapter.java"
        "src/com/android/deskclock/ItemAnimator.java"
        "src/com/android/deskclock/LabelDialogFragment.java"
        "src/com/android/deskclock/LogUtils.java"
        "src/com/android/deskclock/MoveScreensaverRunnable.java"
        "src/com/android/deskclock/Predicate.java"
        "src/com/android/deskclock/RingtonePreviewKlaxon.java"
        "src/com/android/deskclock/Screensaver.java"
        "src/com/android/deskclock/ScreensaverActivity.java"
        "src/com/android/deskclock/StopwatchTextController.java"
        "src/com/android/deskclock/ThemeUtils.java"
        "src/com/android/deskclock/TimerCircleFrameLayout.java"
        "src/com/android/deskclock/TimerTextController.java"
        "src/com/android/deskclock/Utils.java"
        "src/com/android/deskclock/VerticalViewPager.java"
        "src/com/android/deskclock/actionbarmenu/MenuItemController.java"
        "src/com/android/deskclock/actionbarmenu/MenuItemControllerFactory.java"
        "src/com/android/deskclock/actionbarmenu/MenuItemProvider.java"
        "src/com/android/deskclock/actionbarmenu/NavUpMenuItemController.java"
        "src/com/android/deskclock/actionbarmenu/NightModeMenuItemController.java"
        "src/com/android/deskclock/actionbarmenu/OptionsMenuManager.java"
        "src/com/android/deskclock/actionbarmenu/SearchMenuItemController.java"
        "src/com/android/deskclock/actionbarmenu/SettingsMenuItemController.java"
        "src/com/android/deskclock/alarms/AlarmActivity.java"
        "src/com/android/deskclock/alarms/AlarmKlaxon.java"
        "src/com/android/deskclock/alarms/AlarmNotifications.java"
        "src/com/android/deskclock/alarms/AlarmService.java"
        "src/com/android/deskclock/alarms/AlarmStateManager.java"
        "src/com/android/deskclock/alarms/AlarmTimeClickHandler.java"
        "src/com/android/deskclock/alarms/AlarmUpdateHandler.java"
        "src/com/android/deskclock/alarms/ScrollHandler.java"
        "src/com/android/deskclock/alarms/TimePickerDialogFragment.java"
        "src/com/android/deskclock/alarms/dataadapter/AlarmItemHolder.java"
        "src/com/android/deskclock/alarms/dataadapter/AlarmItemViewHolder.java"
        "src/com/android/deskclock/alarms/dataadapter/CollapsedAlarmViewHolder.java"
        "src/com/android/deskclock/alarms/dataadapter/ExpandedAlarmViewHolder.java"
        "src/com/android/deskclock/controller/Controller.java"
        "src/com/android/deskclock/controller/EventController.java"
        "src/com/android/deskclock/controller/ShortcutController.java"
        "src/com/android/deskclock/controller/VoiceController.java"
        "src/com/android/deskclock/data/AlarmModel.java"
        "src/com/android/deskclock/data/City.java"
        "src/com/android/deskclock/data/CityDAO.java"
        "src/com/android/deskclock/data/CityListener.java"
        "src/com/android/deskclock/data/CityModel.java"
        "src/com/android/deskclock/data/CustomRingtone.java"
        "src/com/android/deskclock/data/CustomRingtoneDAO.java"
        "src/com/android/deskclock/data/DataModel.java"
        "src/com/android/deskclock/data/Lap.java"
        "src/com/android/deskclock/data/NotificationModel.java"
        "src/com/android/deskclock/data/OnSilentSettingsListener.java"
        "src/com/android/deskclock/data/RingtoneModel.java"
        "src/com/android/deskclock/data/SettingsDAO.java"
        "src/com/android/deskclock/data/SettingsModel.java"
        "src/com/android/deskclock/data/SilentSettingsModel.java"
        "src/com/android/deskclock/data/Stopwatch.java"
        "src/com/android/deskclock/data/StopwatchDAO.java"
        "src/com/android/deskclock/data/StopwatchListener.java"
        "src/com/android/deskclock/data/StopwatchModel.java"
        "src/com/android/deskclock/data/StopwatchNotificationBuilder.java"
        "src/com/android/deskclock/data/TimeModel.java"
        "src/com/android/deskclock/data/TimeZones.java"
        "src/com/android/deskclock/data/Timer.java"
        "src/com/android/deskclock/data/TimerDAO.java"
        "src/com/android/deskclock/data/TimerListener.java"
        "src/com/android/deskclock/data/TimerModel.java"
        "src/com/android/deskclock/data/TimerNotificationBuilder.java"
        "src/com/android/deskclock/data/TimerStringFormatter.java"
        "src/com/android/deskclock/data/Weekdays.java"
        "src/com/android/deskclock/data/WidgetDAO.java"
        "src/com/android/deskclock/data/WidgetModel.java"
        "src/com/android/deskclock/events/EventTracker.java"
        "src/com/android/deskclock/events/Events.java"
        "src/com/android/deskclock/events/LogEventTracker.java"
        "src/com/android/deskclock/events/ShortcutEventTracker.java"
        "src/com/android/deskclock/provider/Alarm.java"
        "src/com/android/deskclock/provider/AlarmInstance.java"
        "src/com/android/deskclock/provider/ClockContract.java"
        "src/com/android/deskclock/provider/ClockDatabaseHelper.java"
        "src/com/android/deskclock/provider/ClockProvider.java"
        "src/com/android/deskclock/ringtone/AddCustomRingtoneHolder.java"
        "src/com/android/deskclock/ringtone/AddCustomRingtoneViewHolder.java"
        "src/com/android/deskclock/ringtone/CustomRingtoneHolder.java"
        "src/com/android/deskclock/ringtone/HeaderHolder.java"
        "src/com/android/deskclock/ringtone/HeaderViewHolder.java"
        "src/com/android/deskclock/ringtone/RingtoneHolder.java"
        "src/com/android/deskclock/ringtone/RingtoneLoader.java"
        "src/com/android/deskclock/ringtone/RingtonePickerActivity.java"
        "src/com/android/deskclock/ringtone/RingtoneViewHolder.java"
        "src/com/android/deskclock/ringtone/SystemRingtoneHolder.java"
        "src/com/android/deskclock/settings/AlarmVolumePreference.java"
        "src/com/android/deskclock/settings/ScreensaverSettingsActivity.java"
        "src/com/android/deskclock/settings/SettingsActivity.java"
        "src/com/android/deskclock/settings/SimpleMenuPreference.java"
        "src/com/android/deskclock/stopwatch/LapsAdapter.java"
        "src/com/android/deskclock/stopwatch/StopwatchCircleView.java"
        "src/com/android/deskclock/stopwatch/StopwatchFragment.java"
        "src/com/android/deskclock/stopwatch/StopwatchLandscapeLayout.java"
        "src/com/android/deskclock/stopwatch/StopwatchService.java"
        "src/com/android/deskclock/timer/ExpiredTimersActivity.java"
        "src/com/android/deskclock/timer/TimerCircleView.java"
        "src/com/android/deskclock/timer/TimerFragment.java"
        "src/com/android/deskclock/timer/TimerItem.java"
        "src/com/android/deskclock/timer/TimerItemFragment.java"
        "src/com/android/deskclock/timer/TimerKlaxon.java"
        "src/com/android/deskclock/timer/TimerPagerAdapter.java"
        "src/com/android/deskclock/timer/TimerReceiver.java"
        "src/com/android/deskclock/timer/TimerService.java"
        "src/com/android/deskclock/timer/TimerSetupView.java"
        "src/com/android/deskclock/uidata/FormattedStringModel.java"
        "src/com/android/deskclock/uidata/PeriodicCallbackModel.java"
        "src/com/android/deskclock/uidata/TabDAO.java"
        "src/com/android/deskclock/uidata/TabListener.java"
        "src/com/android/deskclock/uidata/TabModel.java"
        "src/com/android/deskclock/uidata/TabScrollListener.java"
        "src/com/android/deskclock/uidata/UiDataModel.java"
        "src/com/android/deskclock/widget/AutoSizingTextClock.java"
        "src/com/android/deskclock/widget/AutoSizingTextView.java"
        "src/com/android/deskclock/widget/CircleView.java"
        "src/com/android/deskclock/widget/EllipsizeLayout.java"
        "src/com/android/deskclock/widget/EmptyViewController.java"
        "src/com/android/deskclock/widget/TextSizeHelper.java"
        "src/com/android/deskclock/widget/TextTime.java"
        "src/com/android/deskclock/widget/selector/AlarmSelection.java"
        "src/com/android/deskclock/widget/selector/AlarmSelectionAdapter.java"
        "src/com/android/deskclock/widget/toast/SnackbarManager.java"
        "src/com/android/deskclock/widget/toast/SnackbarSlidingBehavior.java"
        "src/com/android/deskclock/widget/toast/ToastManager.java"
        "src/com/android/deskclock/worldclock/CitySelectionActivity.java"
        "gen/com/android/deskclock/BuildConfig.java"
    ];
    product_specific = true;
    static_libs = [
        "androidx.annotation_annotation"
        "androidx.collection_collection"
        "androidx.arch.core_core-common"
        "androidx.lifecycle_lifecycle-common"
        "com.google.android.material_material"
        "androidx.lifecycle_lifecycle-runtime"
        "androidx.percentlayout_percentlayout"
        "androidx.transition_transition"
        "androidx.core_core"
        "androidx.legacy_legacy-support-core-ui"
        "androidx.media_media"
        "androidx.legacy_legacy-support-v13"
        "androidx.preference_preference"
        "androidx.appcompat_appcompat"
        "androidx.gridlayout_gridlayout"
        "androidx.recyclerview_recyclerview"
    ];
};

in { inherit DeskClock; }
