{ android_app, android_test, filegroup, genrule }:
let

statslog-telecom-java-gen = genrule {
    name = "statslog-telecom-java-gen";
    tools = ["stats-log-api-gen"];
    cmd = "$(location stats-log-api-gen) --java $(out) --module telecom" +
        " --javaPackage com.android.server.telecom --javaClass TelecomStatsLog";
    out = ["com/android/server/telecom/TelecomStatsLog.java"];
};

Telecom-srcs = filegroup {
    name = "Telecom-srcs";
    srcs = [
        "src/com/android/server/telecom/Analytics.java"
        "src/com/android/server/telecom/AppLabelProxy.java"
        "src/com/android/server/telecom/AsyncRingtonePlayer.java"
        "src/com/android/server/telecom/BluetoothAdapterProxy.java"
        "src/com/android/server/telecom/BluetoothHeadsetProxy.java"
        "src/com/android/server/telecom/BluetoothPhoneServiceImpl.java"
        "src/com/android/server/telecom/Call.java"
        "src/com/android/server/telecom/CallAudioManager.java"
        "src/com/android/server/telecom/CallAudioModeStateMachine.java"
        "src/com/android/server/telecom/CallAudioRoutePeripheralAdapter.java"
        "src/com/android/server/telecom/CallAudioRouteStateMachine.java"
        "src/com/android/server/telecom/CallIdMapper.java"
        "src/com/android/server/telecom/CallIntentProcessor.java"
        "src/com/android/server/telecom/CallLogManager.java"
        "src/com/android/server/telecom/CallRecordingTonePlayer.java"
        "src/com/android/server/telecom/CallScreeningServiceHelper.java"
        "src/com/android/server/telecom/CallState.java"
        "src/com/android/server/telecom/CallerInfoAsyncQueryFactory.java"
        "src/com/android/server/telecom/CallerInfoLookupHelper.java"
        "src/com/android/server/telecom/CallsManager.java"
        "src/com/android/server/telecom/CallsManagerListenerBase.java"
        "src/com/android/server/telecom/CarModeTracker.java"
        "src/com/android/server/telecom/ClockProxy.java"
        "src/com/android/server/telecom/ConnectionServiceFocusManager.java"
        "src/com/android/server/telecom/ConnectionServiceRepository.java"
        "src/com/android/server/telecom/ConnectionServiceWrapper.java"
        "src/com/android/server/telecom/Constants.java"
        "src/com/android/server/telecom/ContactsAsyncHelper.java"
        "src/com/android/server/telecom/CreateConnectionProcessor.java"
        "src/com/android/server/telecom/CreateConnectionResponse.java"
        "src/com/android/server/telecom/CreateConnectionTimeout.java"
        "src/com/android/server/telecom/CurrentUserProxy.java"
        "src/com/android/server/telecom/DefaultDialerCache.java"
        "src/com/android/server/telecom/DialerCodeReceiver.java"
        "src/com/android/server/telecom/DockManager.java"
        "src/com/android/server/telecom/DtmfLocalTonePlayer.java"
        "src/com/android/server/telecom/EmergencyCallHelper.java"
        "src/com/android/server/telecom/HandoverState.java"
        "src/com/android/server/telecom/HeadsetMediaButton.java"
        "src/com/android/server/telecom/HeadsetMediaButtonFactory.java"
        "src/com/android/server/telecom/InCallAdapter.java"
        "src/com/android/server/telecom/InCallController.java"
        "src/com/android/server/telecom/InCallControllerFactory.java"
        "src/com/android/server/telecom/InCallTonePlayer.java"
        "src/com/android/server/telecom/InCallWakeLockController.java"
        "src/com/android/server/telecom/InCallWakeLockControllerFactory.java"
        "src/com/android/server/telecom/InterruptionFilterProxy.java"
        "src/com/android/server/telecom/LogUtils.java"
        "src/com/android/server/telecom/LoggedHandlerExecutor.java"
        "src/com/android/server/telecom/MissedCallNotifier.java"
        "src/com/android/server/telecom/MultiLineTitleEditTextPreference.java"
        "src/com/android/server/telecom/NewOutgoingCallIntentBroadcaster.java"
        "src/com/android/server/telecom/ParcelableCallUtils.java"
        "src/com/android/server/telecom/PhoneAccountRegistrar.java"
        "src/com/android/server/telecom/PhoneAccountSuggestionHelper.java"
        "src/com/android/server/telecom/PhoneNumberUtilsAdapter.java"
        "src/com/android/server/telecom/PhoneNumberUtilsAdapterImpl.java"
        "src/com/android/server/telecom/PhoneStateBroadcaster.java"
        "src/com/android/server/telecom/ProximitySensorManager.java"
        "src/com/android/server/telecom/ProximitySensorManagerFactory.java"
        "src/com/android/server/telecom/QuickResponseUtils.java"
        "src/com/android/server/telecom/RespondViaSmsManager.java"
        "src/com/android/server/telecom/RespondViaSmsSettings.java"
        "src/com/android/server/telecom/RingbackPlayer.java"
        "src/com/android/server/telecom/Ringer.java"
        "src/com/android/server/telecom/RingtoneFactory.java"
        "src/com/android/server/telecom/RoleManagerAdapter.java"
        "src/com/android/server/telecom/RoleManagerAdapterImpl.java"
        "src/com/android/server/telecom/ServiceBinder.java"
        "src/com/android/server/telecom/StatusBarNotifier.java"
        "src/com/android/server/telecom/SystemLoggingContainer.java"
        "src/com/android/server/telecom/SystemSettingsUtil.java"
        "src/com/android/server/telecom/SystemStateHelper.java"
        "src/com/android/server/telecom/TelecomBroadcastIntentProcessor.java"
        "src/com/android/server/telecom/TelecomServiceImpl.java"
        "src/com/android/server/telecom/TelecomSystem.java"
        "src/com/android/server/telecom/TelecomWakeLock.java"
        "src/com/android/server/telecom/TelephonyUtil.java"
        "src/com/android/server/telecom/ThreadUtil.java"
        "src/com/android/server/telecom/Timeouts.java"
        "src/com/android/server/telecom/TtyManager.java"
        "src/com/android/server/telecom/UserUtil.java"
        "src/com/android/server/telecom/VideoProviderProxy.java"
        "src/com/android/server/telecom/WiredHeadsetManager.java"
        "src/com/android/server/telecom/bluetooth/BluetoothDeviceManager.java"
        "src/com/android/server/telecom/bluetooth/BluetoothRouteManager.java"
        "src/com/android/server/telecom/bluetooth/BluetoothStateReceiver.java"
        "src/com/android/server/telecom/callfiltering/BlockCheckerAdapter.java"
        "src/com/android/server/telecom/callfiltering/BlockCheckerFilter.java"
        "src/com/android/server/telecom/callfiltering/CallBlockListener.java"
        "src/com/android/server/telecom/callfiltering/CallFilter.java"
        "src/com/android/server/telecom/callfiltering/CallFilterResultCallback.java"
        "src/com/android/server/telecom/callfiltering/CallFilteringResult.java"
        "src/com/android/server/telecom/callfiltering/CallScreeningServiceFilter.java"
        "src/com/android/server/telecom/callfiltering/DirectToVoicemailFilter.java"
        "src/com/android/server/telecom/callfiltering/IncomingCallFilter.java"
        "src/com/android/server/telecom/callfiltering/IncomingCallFilterGraph.java"
        "src/com/android/server/telecom/callredirection/CallRedirectionCallback.java"
        "src/com/android/server/telecom/callredirection/CallRedirectionProcessor.java"
        "src/com/android/server/telecom/callredirection/CallRedirectionProcessorHelper.java"
        "src/com/android/server/telecom/components/AppUninstallBroadcastReceiver.java"
        "src/com/android/server/telecom/components/BluetoothPhoneService.java"
        "src/com/android/server/telecom/components/ErrorDialogActivity.java"
        "src/com/android/server/telecom/components/NonScrollListView.java"
        "src/com/android/server/telecom/components/TelecomBroadcastReceiver.java"
        "src/com/android/server/telecom/components/TelecomService.java"
        "src/com/android/server/telecom/components/UserCallActivity.java"
        "src/com/android/server/telecom/components/UserCallIntentProcessor.java"
        "src/com/android/server/telecom/components/UserCallIntentProcessorFactory.java"
        "src/com/android/server/telecom/settings/BlockNumberTaskFragment.java"
        "src/com/android/server/telecom/settings/BlockedNumbersActivity.java"
        "src/com/android/server/telecom/settings/BlockedNumbersAdapter.java"
        "src/com/android/server/telecom/settings/BlockedNumbersUtil.java"
        "src/com/android/server/telecom/settings/CallBlockDisabledActivity.java"
        "src/com/android/server/telecom/settings/EnableAccountPreferenceActivity.java"
        "src/com/android/server/telecom/settings/EnableAccountPreferenceFragment.java"
        "src/com/android/server/telecom/settings/EnhancedCallBlockingFragment.java"
        "src/com/android/server/telecom/ui/AudioProcessingNotification.java"
        "src/com/android/server/telecom/ui/CallRedirectionTimeoutDialogActivity.java"
        "src/com/android/server/telecom/ui/ConfirmCallDialogActivity.java"
        "src/com/android/server/telecom/ui/DisconnectedCallNotifier.java"
        "src/com/android/server/telecom/ui/IncomingCallNotifier.java"
        "src/com/android/server/telecom/ui/MissedCallNotifierImpl.java"
        "src/com/android/server/telecom/ui/NotificationChannelManager.java"
        "src/com/android/server/telecom/ui/TelecomDeveloperMenu.java"
        "src/com/android/server/telecom/ui/ToastFactory.java"
        ":statslog-telecom-java-gen"
    ];
};

#  Build the Telecom service.
Telecom = android_app {
    name = "Telecom";
    srcs = [
        ":Telecom-srcs"
        "proto/telecom.proto"
    ];
    resource_dirs = ["res"];
    proto = {
        type = "nano";
        local_include_dirs = ["proto/"];
        output_params = ["optional_field_style=accessors"];
    };
    platform_apis = true;
    certificate = "platform";
    privileged = true;
    optimize = {
        proguard_flags_files = ["proguard.flags"];
    };
    defaults = ["SettingsLibDefaults"];
};

TelecomUnitTests = android_test {
    name = "TelecomUnitTests";
    static_libs = [
        "android-ex-camera2"
        "guava"
        "mockito-target-extended"
        "androidx.test.rules"
        "platform-test-annotations"
        "androidx.legacy_legacy-support-core-ui"
        "androidx.legacy_legacy-support-core-utils"
        "androidx.core_core"
        "androidx.fragment_fragment"
        "androidx.test.ext.junit"
    ];
    srcs = [
        "tests/src/com/android/server/telecom/tests/AnalyticsTests.java"
        "tests/src/com/android/server/telecom/tests/BasicCallTests.java"
        "tests/src/com/android/server/telecom/tests/BlockCheckerFilterTest.java"
        "tests/src/com/android/server/telecom/tests/BluetoothDeviceManagerTest.java"
        "tests/src/com/android/server/telecom/tests/BluetoothPhoneServiceTest.java"
        "tests/src/com/android/server/telecom/tests/BluetoothRouteManagerTest.java"
        "tests/src/com/android/server/telecom/tests/BluetoothRouteTransitionTests.java"
        "tests/src/com/android/server/telecom/tests/CallAudioManagerTest.java"
        "tests/src/com/android/server/telecom/tests/CallAudioModeStateMachineTest.java"
        "tests/src/com/android/server/telecom/tests/CallAudioModeTransitionTests.java"
        "tests/src/com/android/server/telecom/tests/CallAudioRouteStateMachineTest.java"
        "tests/src/com/android/server/telecom/tests/CallAudioRouteTransitionTests.java"
        "tests/src/com/android/server/telecom/tests/CallExtrasTest.java"
        "tests/src/com/android/server/telecom/tests/CallLogManagerTest.java"
        "tests/src/com/android/server/telecom/tests/CallRecordingTonePlayerTest.java"
        "tests/src/com/android/server/telecom/tests/CallRedirectionProcessorTest.java"
        "tests/src/com/android/server/telecom/tests/CallScreeningServiceFilterTest.java"
        "tests/src/com/android/server/telecom/tests/CallTest.java"
        "tests/src/com/android/server/telecom/tests/CallerInfoAsyncQueryFactoryFixture.java"
        "tests/src/com/android/server/telecom/tests/CallerInfoLookupHelperTest.java"
        "tests/src/com/android/server/telecom/tests/CallsManagerTest.java"
        "tests/src/com/android/server/telecom/tests/CarModeTrackerTest.java"
        "tests/src/com/android/server/telecom/tests/ComponentContextFixture.java"
        "tests/src/com/android/server/telecom/tests/ConnectionServiceFixture.java"
        "tests/src/com/android/server/telecom/tests/ConnectionServiceFocusManagerTest.java"
        "tests/src/com/android/server/telecom/tests/ContactsAsyncHelperTest.java"
        "tests/src/com/android/server/telecom/tests/CreateConnectionProcessorTest.java"
        "tests/src/com/android/server/telecom/tests/DefaultDialerCacheTest.java"
        "tests/src/com/android/server/telecom/tests/DirectToVoicemailFilterTest.java"
        "tests/src/com/android/server/telecom/tests/DisconnectedCallNotifierTest.java"
        "tests/src/com/android/server/telecom/tests/DtmfLocalTonePlayerTest.java"
        "tests/src/com/android/server/telecom/tests/EventManagerTest.java"
        "tests/src/com/android/server/telecom/tests/InCallControllerTests.java"
        "tests/src/com/android/server/telecom/tests/InCallServiceFixture.java"
        "tests/src/com/android/server/telecom/tests/InCallTonePlayerTest.java"
        "tests/src/com/android/server/telecom/tests/InCallWakeLockControllerTest.java"
        "tests/src/com/android/server/telecom/tests/IncomingCallFilterGraphTest.java"
        "tests/src/com/android/server/telecom/tests/IncomingCallFilterTest.java"
        "tests/src/com/android/server/telecom/tests/IncomingCallNotifierTest.java"
        "tests/src/com/android/server/telecom/tests/MissedCallNotifierImplTest.java"
        "tests/src/com/android/server/telecom/tests/MockVideoProvider.java"
        "tests/src/com/android/server/telecom/tests/MockitoHelper.java"
        "tests/src/com/android/server/telecom/tests/NewOutgoingCallIntentBroadcasterTest.java"
        "tests/src/com/android/server/telecom/tests/ParcelableCallUtilsTest.java"
        "tests/src/com/android/server/telecom/tests/PhoneAccountRegistrarTest.java"
        "tests/src/com/android/server/telecom/tests/ProximitySensorManagerTest.java"
        "tests/src/com/android/server/telecom/tests/RingerTest.java"
        "tests/src/com/android/server/telecom/tests/SessionManagerTest.java"
        "tests/src/com/android/server/telecom/tests/SessionTest.java"
        "tests/src/com/android/server/telecom/tests/SystemStateHelperTest.java"
        "tests/src/com/android/server/telecom/tests/TelecomServiceImplTest.java"
        "tests/src/com/android/server/telecom/tests/TelecomSystemTest.java"
        "tests/src/com/android/server/telecom/tests/TelecomTestCase.java"
        "tests/src/com/android/server/telecom/tests/TestFixture.java"
        "tests/src/com/android/server/telecom/tests/VideoCallTests.java"
        "tests/src/com/android/server/telecom/tests/VideoProfileTest.java"
        "tests/src/com/android/server/telecom/tests/VideoProviderProxyTest.java"
        "tests/src/com/android/server/telecom/tests/VideoProviderTest.java"
        ":Telecom-srcs"
        "proto/telecom.proto"
    ];
    proto = {
        type = "nano";
        local_include_dirs = ["proto/"];
        output_params = ["optional_field_style=accessors"];
    };
    resource_dirs = [
        "tests/res"
        "res"
    ];
    libs = [
        "android.test.mock"
        "android.test.base"
        "android.test.runner"
    ];

    jni_libs = [
        "libdexmakerjvmtiagent"
        "libstaticjvmtiagent"
    ];

    aaptflags = [
        "--auto-add-overlay"
        "--extra-packages"
        "com.android.server.telecom"
    ];
    manifest = "tests/AndroidManifest.xml";
    optimize = {
        enabled = false;
    };
    platform_apis = true;
    certificate = "platform";
    jacoco = {
        include_filter = ["com.android.server.telecom.*"];
        exclude_filter = ["com.android.server.telecom.tests.*"];
    };
    test_suites = ["device-tests"];
    defaults = ["SettingsLibDefaults"];
};

in { inherit Telecom Telecom-srcs TelecomUnitTests statslog-telecom-java-gen; }
