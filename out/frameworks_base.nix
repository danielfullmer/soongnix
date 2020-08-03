{ aidl_mapping, cc_defaults, cc_library, doc_defaults, droiddoc, droidstubs, filegroup, genrule, gensrcs, java_defaults, java_library, java_library_host, java_library_static, python_binary_host, python_defaults, stubs_defaults }:
let

#  Copyright (C) 2016 The Android Open Source Project
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

#  Build the master framework library.

#  READ ME: ########################################################
#
#  When updating this list of aidl files, consider if that aidl is
#  part of the SDK API.  If it is, also add it to the list in Android.mk
#  that is preprocessed and distributed with the SDK.  This list should
#  not contain any aidl files for parcelables, but the one below should
#  if you intend for 3rd parties to be able to send those objects
#  across process boundaries.
#
#  READ ME: ########################################################

framework-defaults = java_defaults {
    name = "framework-defaults";
    installable = true;

    srcs = [
        #  From build/make/core/pathmap.mk FRAMEWORK_BASE_SUBDIRS
        "core/java/**/*.java"
        "graphics/java/**/*.java"
        "location/java/**/*.java"
        "lowpan/java/**/*.java"
        "media/java/**/*.java"
        "media/mca/effect/java/**/*.java"
        "media/mca/filterfw/java/**/*.java"
        "media/mca/filterpacks/java/**/*.java"
        "drm/java/**/*.java"
        "opengl/java/**/*.java"
        "sax/java/**/*.java"
        "telecomm/java/**/*.java"
        "telephony/java/**/*.java"
        "wifi/java/**/*.java"
        "keystore/java/**/*.java"
        "rs/java/**/*.java"

        ":framework-javastream-protos"

        "core/java/android/accessibilityservice/IAccessibilityServiceConnection.aidl"
        "core/java/android/accessibilityservice/IAccessibilityServiceClient.aidl"
        "core/java/android/accounts/IAccountManager.aidl"
        "core/java/android/accounts/IAccountManagerResponse.aidl"
        "core/java/android/accounts/IAccountAuthenticator.aidl"
        "core/java/android/accounts/IAccountAuthenticatorResponse.aidl"
        "core/java/android/app/IActivityController.aidl"
        "core/java/android/app/IActivityManager.aidl"
        "core/java/android/app/IActivityPendingResult.aidl"
        "core/java/android/app/IActivityTaskManager.aidl"
        "core/java/android/app/IAlarmCompleteListener.aidl"
        "core/java/android/app/IAlarmListener.aidl"
        "core/java/android/app/IAlarmManager.aidl"
        "core/java/android/app/IAppTask.aidl"
        "core/java/android/app/IApplicationThread.aidl"
        "core/java/android/app/IAssistDataReceiver.aidl"
        "core/java/android/app/ITaskStackListener.aidl"
        "core/java/android/app/IBackupAgent.aidl"
        "core/java/android/app/IEphemeralResolver.aidl"
        "core/java/android/app/IInstantAppResolver.aidl"
        "core/java/android/app/IInstrumentationWatcher.aidl"
        "core/java/android/app/INotificationManager.aidl"
        "core/java/android/app/IProcessObserver.aidl"
        "core/java/android/app/IRequestFinishCallback.aidl"
        "core/java/android/app/ISearchManager.aidl"
        "core/java/android/app/ISearchManagerCallback.aidl"
        "core/java/android/app/IServiceConnection.aidl"
        "core/java/android/app/IStopUserCallback.aidl"
        "core/java/android/app/job/IJobCallback.aidl"
        "core/java/android/app/job/IJobScheduler.aidl"
        "core/java/android/app/job/IJobService.aidl"
        "core/java/android/app/ITransientNotification.aidl"
        "core/java/android/app/IUidObserver.aidl"
        "core/java/android/app/IUiAutomationConnection.aidl"
        "core/java/android/app/IUiModeManager.aidl"
        "core/java/android/app/IUriGrantsManager.aidl"
        "core/java/android/app/IUserSwitchObserver.aidl"
        "core/java/android/app/IWallpaperManager.aidl"
        "core/java/android/app/IWallpaperManagerCallback.aidl"
        "core/java/android/app/admin/IDeviceAdminService.aidl"
        "core/java/android/app/admin/IDevicePolicyManager.aidl"
        "core/java/android/app/admin/StartInstallingUpdateCallback.aidl"
        "core/java/android/app/trust/IStrongAuthTracker.aidl"
        "core/java/android/app/trust/ITrustManager.aidl"
        "core/java/android/app/trust/ITrustListener.aidl"
        "core/java/android/app/backup/IBackupCallback.aidl"
        "core/java/android/app/backup/IBackupManager.aidl"
        "core/java/android/app/backup/IBackupObserver.aidl"
        "core/java/android/app/backup/IBackupManagerMonitor.aidl"
        "core/java/android/app/backup/IFullBackupRestoreObserver.aidl"
        "core/java/android/app/backup/IRestoreObserver.aidl"
        "core/java/android/app/backup/IRestoreSession.aidl"
        "core/java/android/app/backup/ISelectBackupTransportCallback.aidl"
        "core/java/android/app/contentsuggestions/IClassificationsCallback.aidl"
        "core/java/android/app/contentsuggestions/IContentSuggestionsManager.aidl"
        "core/java/android/app/contentsuggestions/ISelectionsCallback.aidl"
        "core/java/android/app/prediction/IPredictionCallback.aidl"
        "core/java/android/app/prediction/IPredictionManager.aidl"
        "core/java/android/app/role/IOnRoleHoldersChangedListener.aidl"
        "core/java/android/app/role/IRoleController.aidl"
        "core/java/android/app/role/IRoleManager.aidl"
        "core/java/android/app/slice/ISliceManager.aidl"
        "core/java/android/app/slice/ISliceListener.aidl"
        "core/java/android/app/timedetector/ITimeDetectorService.aidl"
        "core/java/android/app/timezone/ICallback.aidl"
        "core/java/android/app/timezone/IRulesManager.aidl"
        "core/java/android/app/usage/ICacheQuotaService.aidl"
        "core/java/android/app/usage/IStorageStatsManager.aidl"
        "core/java/android/app/usage/IUsageStatsManager.aidl"
        ":libbluetooth-binder-aidl"
        "core/java/android/content/IClipboard.aidl"
        "core/java/android/content/IContentService.aidl"
        "core/java/android/content/IIntentReceiver.aidl"
        "core/java/android/content/IIntentSender.aidl"
        "core/java/android/content/IOnPrimaryClipChangedListener.aidl"
        "core/java/android/content/IRestrictionsManager.aidl"
        "core/java/android/content/ISyncAdapter.aidl"
        "core/java/android/content/ISyncAdapterUnsyncableAccountCallback.aidl"
        "core/java/android/content/ISyncContext.aidl"
        "core/java/android/content/ISyncServiceAdapter.aidl"
        "core/java/android/content/ISyncStatusObserver.aidl"
        "core/java/android/content/om/IOverlayManager.aidl"
        "core/java/android/content/pm/ICrossProfileApps.aidl"
        "core/java/android/content/pm/IDexModuleRegisterCallback.aidl"
        "core/java/android/content/pm/ILauncherApps.aidl"
        "core/java/android/content/pm/IOnAppsChangedListener.aidl"
        "core/java/android/content/pm/IOnPermissionsChangeListener.aidl"
        "core/java/android/content/pm/IOtaDexopt.aidl"
        "core/java/android/content/pm/IPackageDataObserver.aidl"
        "core/java/android/content/pm/IPackageDeleteObserver.aidl"
        "core/java/android/content/pm/IPackageDeleteObserver2.aidl"
        "core/java/android/content/pm/IPackageInstallObserver2.aidl"
        "core/java/android/content/pm/IPackageInstaller.aidl"
        "core/java/android/content/pm/IPackageInstallerCallback.aidl"
        "core/java/android/content/pm/IPackageInstallerSession.aidl"
        "core/java/android/content/pm/IPackageManager.aidl"
        ":libbinder_aidl"
        "core/java/android/content/pm/IPackageMoveObserver.aidl"
        "core/java/android/content/pm/IPackageStatsObserver.aidl"
        "core/java/android/content/pm/IPinItemRequest.aidl"
        "core/java/android/content/pm/IShortcutService.aidl"
        "core/java/android/content/pm/dex/IArtManager.aidl"
        "core/java/android/content/pm/dex/ISnapshotRuntimeProfileCallback.aidl"
        "core/java/android/content/pm/permission/IRuntimePermissionPresenter.aidl"
        "core/java/android/content/rollback/IRollbackManager.aidl"
        "core/java/android/database/IContentObserver.aidl"
        "core/java/android/debug/IAdbManager.aidl"
        "core/java/android/debug/IAdbTransport.aidl"
        ":libcamera_client_aidl"
        ":libcamera_client_framework_aidl"
        "core/java/android/hardware/IConsumerIrService.aidl"
        "core/java/android/hardware/ISerialManager.aidl"
        "core/java/android/hardware/biometrics/IBiometricConfirmDeviceCredentialCallback.aidl"
        "core/java/android/hardware/biometrics/IBiometricEnabledOnKeyguardCallback.aidl"
        "core/java/android/hardware/biometrics/IBiometricService.aidl"
        "core/java/android/hardware/biometrics/IBiometricServiceReceiver.aidl"
        "core/java/android/hardware/biometrics/IBiometricServiceReceiverInternal.aidl"
        "core/java/android/hardware/biometrics/IBiometricServiceLockoutResetCallback.aidl"
        "core/java/android/hardware/display/IColorDisplayManager.aidl"
        "core/java/android/hardware/display/IDisplayManager.aidl"
        "core/java/android/hardware/display/IDisplayManagerCallback.aidl"
        "core/java/android/hardware/display/IVirtualDisplayCallback.aidl"
        "core/java/android/hardware/fingerprint/IFingerprintClientActiveCallback.aidl"
        "core/java/android/hardware/face/IFaceService.aidl"
        "core/java/android/hardware/face/IFaceServiceReceiver.aidl"
        "core/java/android/hardware/fingerprint/IFingerprintService.aidl"
        "core/java/android/hardware/fingerprint/IFingerprintServiceReceiver.aidl"
        "core/java/android/hardware/hdmi/IHdmiControlCallback.aidl"
        "core/java/android/hardware/hdmi/IHdmiControlService.aidl"
        "core/java/android/hardware/hdmi/IHdmiDeviceEventListener.aidl"
        "core/java/android/hardware/hdmi/IHdmiHotplugEventListener.aidl"
        "core/java/android/hardware/hdmi/IHdmiInputChangeListener.aidl"
        "core/java/android/hardware/hdmi/IHdmiMhlVendorCommandListener.aidl"
        "core/java/android/hardware/hdmi/IHdmiRecordListener.aidl"
        "core/java/android/hardware/hdmi/IHdmiSystemAudioModeChangeListener.aidl"
        "core/java/android/hardware/hdmi/IHdmiVendorCommandListener.aidl"
        "core/java/android/hardware/input/IInputManager.aidl"
        "core/java/android/hardware/input/IInputDevicesChangedListener.aidl"
        "core/java/android/hardware/input/ITabletModeChangedListener.aidl"
        "core/java/android/hardware/iris/IIrisService.aidl"
        "core/java/android/hardware/location/IActivityRecognitionHardware.aidl"
        "core/java/android/hardware/location/IActivityRecognitionHardwareClient.aidl"
        "core/java/android/hardware/location/IActivityRecognitionHardwareSink.aidl"
        "core/java/android/hardware/location/IActivityRecognitionHardwareWatcher.aidl"
        "core/java/android/hardware/location/IGeofenceHardware.aidl"
        "core/java/android/hardware/location/IGeofenceHardwareCallback.aidl"
        "core/java/android/hardware/location/IGeofenceHardwareMonitorCallback.aidl"
        "core/java/android/hardware/location/IContextHubCallback.aidl"
        "core/java/android/hardware/location/IContextHubClient.aidl"
        "core/java/android/hardware/location/IContextHubClientCallback.aidl"
        "core/java/android/hardware/location/IContextHubService.aidl"
        "core/java/android/hardware/location/IContextHubTransactionCallback.aidl"
        "core/java/android/hardware/radio/IAnnouncementListener.aidl"
        "core/java/android/hardware/radio/ICloseHandle.aidl"
        "core/java/android/hardware/radio/IRadioService.aidl"
        "core/java/android/hardware/radio/ITuner.aidl"
        "core/java/android/hardware/radio/ITunerCallback.aidl"
        "core/java/android/hardware/soundtrigger/IRecognitionStatusCallback.aidl"
        "core/java/android/hardware/usb/IUsbManager.aidl"
        "core/java/android/hardware/usb/IUsbSerialReader.aidl"
        "core/java/android/net/ICaptivePortal.aidl"
        "core/java/android/net/IConnectivityManager.aidl"
        "core/java/android/hardware/ISensorPrivacyListener.aidl"
        "core/java/android/hardware/ISensorPrivacyManager.aidl"
        "core/java/android/net/IIpConnectivityMetrics.aidl"
        "core/java/android/net/IEthernetManager.aidl"
        "core/java/android/net/IEthernetServiceListener.aidl"
        "core/java/android/net/INetdEventCallback.aidl"
        "core/java/android/net/IIpSecService.aidl"
        "core/java/android/net/INetworkManagementEventObserver.aidl"
        "core/java/android/net/INetworkPolicyListener.aidl"
        "core/java/android/net/INetworkPolicyManager.aidl"
        "core/java/android/net/INetworkRecommendationProvider.aidl"
        "core/java/android/net/INetworkScoreCache.aidl"
        "core/java/android/net/INetworkScoreService.aidl"
        "core/java/android/net/INetworkStatsService.aidl"
        "core/java/android/net/INetworkStatsSession.aidl"
        "core/java/android/net/ISocketKeepaliveCallback.aidl"
        "core/java/android/net/ITestNetworkManager.aidl"
        "core/java/android/net/ITetheringEventCallback.aidl"
        "core/java/android/net/ITetheringStatsProvider.aidl"
        "core/java/android/net/nsd/INsdManager.aidl"
        "core/java/android/nfc/IAppCallback.aidl"
        "core/java/android/nfc/INfcAdapter.aidl"
        "core/java/android/nfc/INfcAdapterExtras.aidl"
        "core/java/android/nfc/INfcTag.aidl"
        "core/java/android/nfc/INfcCardEmulation.aidl"
        "core/java/android/nfc/INfcFCardEmulation.aidl"
        "core/java/android/nfc/INfcUnlockHandler.aidl"
        "core/java/android/nfc/INfcDta.aidl"
        "core/java/android/nfc/ITagRemovedCallback.aidl"
        "core/java/android/se/omapi/ISecureElementService.aidl"
        "core/java/android/se/omapi/ISecureElementListener.aidl"
        "core/java/android/se/omapi/ISecureElementChannel.aidl"
        "core/java/android/se/omapi/ISecureElementReader.aidl"
        "core/java/android/se/omapi/ISecureElementSession.aidl"
        "core/java/android/os/IBatteryPropertiesRegistrar.aidl"
        "core/java/android/os/ICancellationSignal.aidl"
        "core/java/android/os/IDeviceIdentifiersPolicyService.aidl"
        "core/java/android/os/IDeviceIdleController.aidl"
        "core/java/android/os/IHardwarePropertiesManager.aidl"
        ":libincident_aidl"
        "core/java/android/os/IMaintenanceActivityListener.aidl"
        "core/java/android/os/IMessenger.aidl"
        "core/java/android/os/INetworkActivityListener.aidl"
        "core/java/android/os/INetworkManagementService.aidl"
        "core/java/android/os/IPermissionController.aidl"
        "core/java/android/os/IProcessInfoService.aidl"
        "core/java/android/os/IProgressListener.aidl"
        "core/java/android/os/IPowerManager.aidl"
        "core/java/android/os/IRecoverySystem.aidl"
        "core/java/android/os/IRecoverySystemProgressListener.aidl"
        "core/java/android/os/IRemoteCallback.aidl"
        "core/java/android/os/ISchedulingPolicyService.aidl"
        ":statsd_aidl"
        "core/java/android/os/ISystemUpdateManager.aidl"
        "core/java/android/os/IThermalEventListener.aidl"
        "core/java/android/os/IThermalStatusListener.aidl"
        "core/java/android/os/IThermalService.aidl"
        "core/java/android/os/IUpdateLock.aidl"
        "core/java/android/os/IUserManager.aidl"
        ":libvibrator_aidl"
        "core/java/android/os/IVibratorService.aidl"
        "core/java/android/os/image/IDynamicSystemService.aidl"
        "core/java/android/os/storage/IStorageManager.aidl"
        "core/java/android/os/storage/IStorageEventListener.aidl"
        "core/java/android/os/storage/IStorageShutdownObserver.aidl"
        "core/java/android/os/storage/IObbActionListener.aidl"
        "core/java/android/permission/IPermissionController.aidl"
        ":keystore_aidl"
        "core/java/android/security/keymaster/IKeyAttestationApplicationIdProvider.aidl"
        "core/java/android/service/appprediction/IPredictionService.aidl"
        "core/java/android/service/autofill/augmented/IAugmentedAutofillService.aidl"
        "core/java/android/service/autofill/augmented/IFillCallback.aidl"
        "core/java/android/service/autofill/IAutoFillService.aidl"
        "core/java/android/service/autofill/IAutofillFieldClassificationService.aidl"
        "core/java/android/service/autofill/IFillCallback.aidl"
        "core/java/android/service/autofill/ISaveCallback.aidl"
        "core/java/android/service/carrier/ICarrierService.aidl"
        "core/java/android/service/carrier/ICarrierMessagingCallback.aidl"
        "core/java/android/service/carrier/ICarrierMessagingService.aidl"
        "core/java/android/service/carrier/ICarrierMessagingClientService.aidl"
        "core/java/android/service/contentsuggestions/IContentSuggestionsService.aidl"
        "core/java/android/service/euicc/IDeleteSubscriptionCallback.aidl"
        "core/java/android/service/euicc/IDownloadSubscriptionCallback.aidl"
        "core/java/android/service/euicc/IEraseSubscriptionsCallback.aidl"
        "core/java/android/service/euicc/IEuiccService.aidl"
        "core/java/android/service/euicc/IGetDefaultDownloadableSubscriptionListCallback.aidl"
        "core/java/android/service/euicc/IGetDownloadableSubscriptionMetadataCallback.aidl"
        "core/java/android/service/euicc/IGetEidCallback.aidl"
        "core/java/android/service/euicc/IGetEuiccInfoCallback.aidl"
        "core/java/android/service/euicc/IGetEuiccProfileInfoListCallback.aidl"
        "core/java/android/service/euicc/IGetOtaStatusCallback.aidl"
        "core/java/android/service/euicc/IOtaStatusChangedCallback.aidl"
        "core/java/android/service/euicc/IRetainSubscriptionsForFactoryResetCallback.aidl"
        "core/java/android/service/euicc/ISwitchToSubscriptionCallback.aidl"
        "core/java/android/service/euicc/IUpdateSubscriptionNicknameCallback.aidl"
        "core/java/android/service/gatekeeper/IGateKeeperService.aidl"
        "core/java/android/service/contentcapture/IContentCaptureService.aidl"
        "core/java/android/service/contentcapture/IContentCaptureServiceCallback.aidl"
        "core/java/android/service/notification/INotificationListener.aidl"
        "core/java/android/service/notification/IStatusBarNotificationHolder.aidl"
        "core/java/android/service/notification/IConditionListener.aidl"
        "core/java/android/service/notification/IConditionProvider.aidl"
        "core/java/android/service/settings/suggestions/ISuggestionService.aidl"
        "core/java/android/service/sms/IFinancialSmsService.aidl"
        "core/java/android/service/vr/IPersistentVrStateCallbacks.aidl"
        "core/java/android/service/vr/IVrListener.aidl"
        "core/java/android/service/vr/IVrManager.aidl"
        "core/java/android/service/vr/IVrStateCallbacks.aidl"
        "core/java/android/service/watchdog/IExplicitHealthCheckService.aidl"
        "core/java/android/print/ILayoutResultCallback.aidl"
        "core/java/android/print/IPrinterDiscoveryObserver.aidl"
        "core/java/android/print/IPrintDocumentAdapter.aidl"
        "core/java/android/print/IPrintDocumentAdapterObserver.aidl"
        "core/java/android/print/IPrintJobStateChangeListener.aidl"
        "core/java/android/print/IPrintServicesChangeListener.aidl"
        "core/java/android/printservice/recommendation/IRecommendationsChangeListener.aidl"
        "core/java/android/print/IPrintManager.aidl"
        "core/java/android/print/IPrintSpooler.aidl"
        "core/java/android/print/IPrintSpoolerCallbacks.aidl"
        "core/java/android/print/IPrintSpoolerClient.aidl"
        "core/java/android/printservice/recommendation/IRecommendationServiceCallbacks.aidl"
        "core/java/android/printservice/recommendation/IRecommendationService.aidl"
        "core/java/android/print/IWriteResultCallback.aidl"
        "core/java/android/printservice/IPrintService.aidl"
        "core/java/android/printservice/IPrintServiceClient.aidl"
        "core/java/android/companion/ICompanionDeviceManager.aidl"
        "core/java/android/companion/ICompanionDeviceDiscoveryService.aidl"
        "core/java/android/companion/ICompanionDeviceDiscoveryServiceCallback.aidl"
        "core/java/android/companion/IFindDeviceCallback.aidl"
        "core/java/android/service/dreams/IDreamManager.aidl"
        "core/java/android/service/dreams/IDreamService.aidl"
        "core/java/android/service/oemlock/IOemLockService.aidl"
        "core/java/android/service/persistentdata/IPersistentDataBlockService.aidl"
        "core/java/android/service/trust/ITrustAgentService.aidl"
        "core/java/android/service/trust/ITrustAgentServiceCallback.aidl"
        "core/java/android/service/voice/IVoiceInteractionService.aidl"
        "core/java/android/service/voice/IVoiceInteractionSession.aidl"
        "core/java/android/service/voice/IVoiceInteractionSessionService.aidl"
        "core/java/android/service/wallpaper/IWallpaperConnection.aidl"
        "core/java/android/service/wallpaper/IWallpaperEngine.aidl"
        "core/java/android/service/wallpaper/IWallpaperService.aidl"
        "core/java/android/service/chooser/IChooserTargetService.aidl"
        "core/java/android/service/chooser/IChooserTargetResult.aidl"
        "core/java/android/service/resolver/IResolverRankerService.aidl"
        "core/java/android/service/resolver/IResolverRankerResult.aidl"
        "core/java/android/service/textclassifier/ITextClassifierCallback.aidl"
        "core/java/android/service/textclassifier/ITextClassifierService.aidl"
        "core/java/android/service/attention/IAttentionService.aidl"
        "core/java/android/service/attention/IAttentionCallback.aidl"
        "core/java/android/view/accessibility/IAccessibilityInteractionConnection.aidl"
        "core/java/android/view/accessibility/IAccessibilityInteractionConnectionCallback.aidl"
        "core/java/android/view/accessibility/IAccessibilityManager.aidl"
        "core/java/android/view/accessibility/IAccessibilityManagerClient.aidl"
        "core/java/android/view/autofill/IAutoFillManager.aidl"
        "core/java/android/view/autofill/IAutoFillManagerClient.aidl"
        "core/java/android/view/autofill/IAugmentedAutofillManagerClient.aidl"
        "core/java/android/view/autofill/IAutofillWindowPresenter.aidl"
        "core/java/android/view/contentcapture/IContentCaptureDirectManager.aidl"
        "core/java/android/view/contentcapture/IContentCaptureManager.aidl"
        "core/java/android/view/IApplicationToken.aidl"
        "core/java/android/view/IAppTransitionAnimationSpecsFuture.aidl"
        "core/java/android/view/IDockedStackListener.aidl"
        "core/java/android/view/IDisplayFoldListener.aidl"
        "core/java/android/view/IGraphicsStats.aidl"
        "core/java/android/view/IGraphicsStatsCallback.aidl"
        "core/java/android/view/IInputMonitorHost.aidl"
        "core/java/android/view/IInputFilter.aidl"
        "core/java/android/view/IInputFilterHost.aidl"
        "core/java/android/view/IOnKeyguardExitResult.aidl"
        "core/java/android/view/IPinnedStackController.aidl"
        "core/java/android/view/IPinnedStackListener.aidl"
        "core/java/android/view/IRemoteAnimationRunner.aidl"
        "core/java/android/view/IRecentsAnimationController.aidl"
        "core/java/android/view/IRecentsAnimationRunner.aidl"
        "core/java/android/view/IRemoteAnimationFinishedCallback.aidl"
        "core/java/android/view/IRotationWatcher.aidl"
        "core/java/android/view/ISystemGestureExclusionListener.aidl"
        "core/java/android/view/IWallpaperVisibilityListener.aidl"
        "core/java/android/view/IWindow.aidl"
        "core/java/android/view/IWindowFocusObserver.aidl"
        "core/java/android/view/IWindowId.aidl"
        "core/java/android/view/IWindowManager.aidl"
        "core/java/android/view/IWindowSession.aidl"
        "core/java/android/view/IWindowSessionCallback.aidl"
        "core/java/android/webkit/IWebViewUpdateService.aidl"
        "core/java/android/speech/IRecognitionListener.aidl"
        "core/java/android/speech/IRecognitionService.aidl"
        "core/java/android/speech/tts/ITextToSpeechCallback.aidl"
        "core/java/android/speech/tts/ITextToSpeechService.aidl"
        "core/java/com/android/internal/app/IAppOpsActiveCallback.aidl"
        "core/java/com/android/internal/app/IAppOpsCallback.aidl"
        "core/java/com/android/internal/app/IAppOpsNotedCallback.aidl"
        "core/java/com/android/internal/app/IAppOpsService.aidl"
        "core/java/com/android/internal/app/IBatteryStats.aidl"
        "core/java/com/android/internal/app/ISoundTriggerService.aidl"
        "core/java/com/android/internal/app/IVoiceActionCheckCallback.aidl"
        "core/java/com/android/internal/app/IVoiceInteractionManagerService.aidl"
        "core/java/com/android/internal/app/IVoiceInteractionSessionListener.aidl"
        "core/java/com/android/internal/app/IVoiceInteractionSessionShowCallback.aidl"
        "core/java/com/android/internal/app/IVoiceInteractor.aidl"
        "core/java/com/android/internal/app/IVoiceInteractorCallback.aidl"
        "core/java/com/android/internal/app/IVoiceInteractorRequest.aidl"
        "core/java/com/android/internal/app/IMediaContainerService.aidl"
        "core/java/com/android/internal/app/procstats/IProcessStats.aidl"
        "core/java/com/android/internal/appwidget/IAppWidgetService.aidl"
        "core/java/com/android/internal/appwidget/IAppWidgetHost.aidl"
        "core/java/com/android/internal/backup/IBackupTransport.aidl"
        "core/java/com/android/internal/backup/IObbBackupService.aidl"
        "core/java/com/android/internal/car/ICarStatsService.aidl"
        "core/java/com/android/internal/inputmethod/IInputContentUriToken.aidl"
        "core/java/com/android/internal/inputmethod/IInputMethodPrivilegedOperations.aidl"
        "core/java/com/android/internal/inputmethod/IMultiClientInputMethod.aidl"
        "core/java/com/android/internal/inputmethod/IMultiClientInputMethodPrivilegedOperations.aidl"
        "core/java/com/android/internal/inputmethod/IMultiClientInputMethodSession.aidl"
        "core/java/com/android/internal/net/INetworkWatchlistManager.aidl"
        "core/java/com/android/internal/policy/IKeyguardDrawnCallback.aidl"
        "core/java/com/android/internal/policy/IKeyguardDismissCallback.aidl"
        "core/java/com/android/internal/policy/IKeyguardExitCallback.aidl"
        "core/java/com/android/internal/policy/IKeyguardService.aidl"
        "core/java/com/android/internal/policy/IKeyguardStateCallback.aidl"
        "core/java/com/android/internal/policy/IShortcutService.aidl"
        "core/java/com/android/internal/os/IDropBoxManagerService.aidl"
        "core/java/com/android/internal/os/IParcelFileDescriptorFactory.aidl"
        "core/java/com/android/internal/os/IResultReceiver.aidl"
        "core/java/com/android/internal/os/IShellCallback.aidl"
        "core/java/com/android/internal/statusbar/IStatusBar.aidl"
        "core/java/com/android/internal/statusbar/IStatusBarService.aidl"
        "core/java/com/android/internal/textservice/ISpellCheckerService.aidl"
        "core/java/com/android/internal/textservice/ISpellCheckerServiceCallback.aidl"
        "core/java/com/android/internal/textservice/ISpellCheckerSession.aidl"
        "core/java/com/android/internal/textservice/ISpellCheckerSessionListener.aidl"
        "core/java/com/android/internal/textservice/ITextServicesManager.aidl"
        "core/java/com/android/internal/textservice/ITextServicesSessionListener.aidl"
        "core/java/com/android/internal/view/IDragAndDropPermissions.aidl"
        "core/java/com/android/internal/view/IInputContext.aidl"
        "core/java/com/android/internal/view/IInputContextCallback.aidl"
        "core/java/com/android/internal/view/IInputMethod.aidl"
        "core/java/com/android/internal/view/IInputMethodClient.aidl"
        "core/java/com/android/internal/view/IInputMethodManager.aidl"
        "core/java/com/android/internal/view/IInputMethodSession.aidl"
        "core/java/com/android/internal/view/IInputSessionCallback.aidl"
        "core/java/com/android/internal/widget/ICheckCredentialProgressCallback.aidl"
        "core/java/com/android/internal/widget/ILockSettings.aidl"
        "core/java/com/android/internal/widget/IRemoteViewsFactory.aidl"
        "keystore/java/android/security/IKeyChainAliasCallback.aidl"
        "keystore/java/android/security/IKeyChainService.aidl"
        "location/java/android/location/IBatchedLocationCallback.aidl"
        "location/java/android/location/ICountryDetector.aidl"
        "location/java/android/location/ICountryListener.aidl"
        "location/java/android/location/IGeocodeProvider.aidl"
        "location/java/android/location/IGeofenceProvider.aidl"
        "location/java/android/location/IGnssStatusListener.aidl"
        "location/java/android/location/IGnssMeasurementsListener.aidl"
        "location/java/android/location/IGnssNavigationMessageListener.aidl"
        "location/java/android/location/ILocationListener.aidl"
        "location/java/android/location/ILocationManager.aidl"
        "location/java/android/location/IFusedGeofenceHardware.aidl"
        "location/java/android/location/IGpsGeofenceHardware.aidl"
        "location/java/android/location/INetInitiatedListener.aidl"
        "location/java/com/android/internal/location/ILocationProvider.aidl"
        "location/java/com/android/internal/location/ILocationProviderManager.aidl"
        "media/java/android/media/IAudioFocusDispatcher.aidl"
        "media/java/android/media/IAudioRoutesObserver.aidl"
        "media/java/android/media/IAudioService.aidl"
        "media/java/android/media/IAudioServerStateDispatcher.aidl"
        "media/java/android/media/IMediaHTTPConnection.aidl"
        "media/java/android/media/IMediaHTTPService.aidl"
        "media/java/android/media/IMediaResourceMonitor.aidl"
        "media/java/android/media/IMediaRouterClient.aidl"
        "media/java/android/media/IMediaRouterService.aidl"
        "media/java/android/media/IMediaScannerListener.aidl"
        "media/java/android/media/IMediaScannerService.aidl"
        "media/java/android/media/IPlaybackConfigDispatcher.aidl"
        ":libaudioclient_aidl"
        "media/java/android/media/IRecordingConfigDispatcher.aidl"
        "media/java/android/media/IRemoteDisplayCallback.aidl"
        "media/java/android/media/IRemoteDisplayProvider.aidl"
        "media/java/android/media/IRemoteVolumeController.aidl"
        "media/java/android/media/IRemoteVolumeObserver.aidl"
        "media/java/android/media/IRingtonePlayer.aidl"
        "media/java/android/media/IVolumeController.aidl"
        "media/java/android/media/audiopolicy/IAudioPolicyCallback.aidl"
        "media/java/android/media/midi/IBluetoothMidiService.aidl"
        "media/java/android/media/midi/IMidiDeviceListener.aidl"
        "media/java/android/media/midi/IMidiDeviceOpenCallback.aidl"
        "media/java/android/media/midi/IMidiDeviceServer.aidl"
        "media/java/android/media/midi/IMidiManager.aidl"
        "media/java/android/media/projection/IMediaProjection.aidl"
        "media/java/android/media/projection/IMediaProjectionCallback.aidl"
        "media/java/android/media/projection/IMediaProjectionManager.aidl"
        "media/java/android/media/projection/IMediaProjectionWatcherCallback.aidl"
        "media/java/android/media/session/IActiveSessionsListener.aidl"
        "media/java/android/media/session/ICallback.aidl"
        "media/java/android/media/session/IOnMediaKeyListener.aidl"
        "media/java/android/media/session/IOnVolumeKeyLongPressListener.aidl"
        "media/java/android/media/session/ISession.aidl"
        "media/java/android/media/session/ISession2TokensListener.aidl"
        "media/java/android/media/session/ISessionCallback.aidl"
        "media/java/android/media/session/ISessionController.aidl"
        "media/java/android/media/session/ISessionControllerCallback.aidl"
        "media/java/android/media/session/ISessionManager.aidl"
        "media/java/android/media/soundtrigger/ISoundTriggerDetectionService.aidl"
        "media/java/android/media/soundtrigger/ISoundTriggerDetectionServiceClient.aidl"
        "media/java/android/media/tv/ITvInputClient.aidl"
        "media/java/android/media/tv/ITvInputHardware.aidl"
        "media/java/android/media/tv/ITvInputHardwareCallback.aidl"
        "media/java/android/media/tv/ITvInputManager.aidl"
        "media/java/android/media/tv/ITvInputManagerCallback.aidl"
        "media/java/android/media/tv/ITvInputService.aidl"
        "media/java/android/media/tv/ITvInputServiceCallback.aidl"
        "media/java/android/media/tv/ITvInputSession.aidl"
        "media/java/android/media/tv/ITvInputSessionCallback.aidl"
        "media/java/android/media/tv/ITvRemoteProvider.aidl"
        "media/java/android/media/tv/ITvRemoteServiceInput.aidl"
        "media/java/android/service/media/IMediaBrowserService.aidl"
        "media/java/android/service/media/IMediaBrowserServiceCallbacks.aidl"
        "telecomm/java/com/android/internal/telecom/ICallRedirectionAdapter.aidl"
        "telecomm/java/com/android/internal/telecom/ICallRedirectionService.aidl"
        "telecomm/java/com/android/internal/telecom/ICallScreeningAdapter.aidl"
        "telecomm/java/com/android/internal/telecom/ICallScreeningService.aidl"
        "telecomm/java/com/android/internal/telecom/IVideoCallback.aidl"
        "telecomm/java/com/android/internal/telecom/IVideoProvider.aidl"
        "telecomm/java/com/android/internal/telecom/IConnectionService.aidl"
        "telecomm/java/com/android/internal/telecom/IConnectionServiceAdapter.aidl"
        "telecomm/java/com/android/internal/telecom/IInCallAdapter.aidl"
        "telecomm/java/com/android/internal/telecom/IInCallService.aidl"
        "telecomm/java/com/android/internal/telecom/IPhoneAccountSuggestionCallback.aidl"
        "telecomm/java/com/android/internal/telecom/IPhoneAccountSuggestionService.aidl"
        "telecomm/java/com/android/internal/telecom/ITelecomService.aidl"
        "telecomm/java/com/android/internal/telecom/RemoteServiceCallback.aidl"
        "telephony/java/android/telephony/data/IDataService.aidl"
        "telephony/java/android/telephony/data/IDataServiceCallback.aidl"
        "telephony/java/android/telephony/data/IQualifiedNetworksService.aidl"
        "telephony/java/android/telephony/data/IQualifiedNetworksServiceCallback.aidl"
        "telephony/java/android/telephony/ims/aidl/IImsCallSessionListener.aidl"
        "telephony/java/android/telephony/ims/aidl/IImsCapabilityCallback.aidl"
        "telephony/java/android/telephony/ims/aidl/IImsConfig.aidl"
        "telephony/java/android/telephony/ims/aidl/IImsConfigCallback.aidl"
        "telephony/java/android/telephony/ims/aidl/IImsMmTelFeature.aidl"
        "telephony/java/android/telephony/ims/aidl/IImsMmTelListener.aidl"
        "telephony/java/android/telephony/ims/aidl/IImsRegistration.aidl"
        "telephony/java/android/telephony/ims/aidl/IImsRegistrationCallback.aidl"
        "telephony/java/android/telephony/ims/aidl/IImsRcsFeature.aidl"
        "telephony/java/android/telephony/ims/aidl/IImsServiceController.aidl"
        "telephony/java/android/telephony/ims/aidl/IImsServiceControllerListener.aidl"
        "telephony/java/android/telephony/ims/aidl/IImsSmsListener.aidl"
        "telephony/java/android/telephony/ims/aidl/IRcs.aidl"
        "telephony/java/android/telephony/mbms/IMbmsDownloadSessionCallback.aidl"
        "telephony/java/android/telephony/mbms/IMbmsStreamingSessionCallback.aidl"
        "telephony/java/android/telephony/mbms/IMbmsGroupCallSessionCallback.aidl"
        "telephony/java/android/telephony/mbms/IDownloadStatusListener.aidl"
        "telephony/java/android/telephony/mbms/IDownloadProgressListener.aidl"
        "telephony/java/android/telephony/mbms/IStreamingServiceCallback.aidl"
        "telephony/java/android/telephony/mbms/IGroupCallCallback.aidl"
        "telephony/java/android/telephony/mbms/vendor/IMbmsDownloadService.aidl"
        "telephony/java/android/telephony/mbms/vendor/IMbmsStreamingService.aidl"
        "telephony/java/android/telephony/mbms/vendor/IMbmsGroupCallService.aidl"
        "telephony/java/android/telephony/ICellInfoCallback.aidl"
        "telephony/java/android/telephony/IFinancialSmsCallback.aidl"
        "telephony/java/android/telephony/INetworkService.aidl"
        "telephony/java/android/telephony/INetworkServiceCallback.aidl"
        "telephony/java/com/android/ims/internal/IImsCallSession.aidl"
        "telephony/java/com/android/ims/internal/IImsCallSessionListener.aidl"
        "telephony/java/com/android/ims/internal/IImsConfig.aidl"
        "telephony/java/com/android/ims/internal/IImsRegistrationListener.aidl"
        "telephony/java/com/android/ims/internal/IImsEcbm.aidl"
        "telephony/java/com/android/ims/internal/IImsEcbmListener.aidl"
        "telephony/java/com/android/ims/internal/IImsExternalCallStateListener.aidl"
        "telephony/java/com/android/ims/internal/IImsFeatureStatusCallback.aidl"
        "telephony/java/com/android/ims/internal/IImsMMTelFeature.aidl"
        "telephony/java/com/android/ims/internal/IImsMultiEndpoint.aidl"
        "telephony/java/com/android/ims/internal/IImsRcsFeature.aidl"
        "telephony/java/com/android/ims/internal/IImsService.aidl"
        "telephony/java/com/android/ims/internal/IImsServiceController.aidl"
        "telephony/java/com/android/ims/internal/IImsServiceFeatureCallback.aidl"
        "telephony/java/com/android/ims/internal/IImsStreamMediaSession.aidl"
        "telephony/java/com/android/ims/internal/IImsUt.aidl"
        "telephony/java/com/android/ims/internal/IImsUtListener.aidl"
        "telephony/java/com/android/ims/internal/IImsVideoCallCallback.aidl"
        "telephony/java/com/android/ims/internal/IImsVideoCallProvider.aidl"
        "telephony/java/com/android/ims/internal/uce/uceservice/IUceService.aidl"
        "telephony/java/com/android/ims/internal/uce/uceservice/IUceListener.aidl"
        "telephony/java/com/android/ims/internal/uce/options/IOptionsService.aidl"
        "telephony/java/com/android/ims/internal/uce/options/IOptionsListener.aidl"
        "telephony/java/com/android/ims/internal/uce/presence/IPresenceService.aidl"
        "telephony/java/com/android/ims/internal/uce/presence/IPresenceListener.aidl"
        "telephony/java/com/android/ims/ImsConfigListener.aidl"
        "telephony/java/com/android/internal/telephony/IApnSourceService.aidl"
        "telephony/java/com/android/internal/telephony/ICarrierConfigLoader.aidl"
        "telephony/java/com/android/internal/telephony/IIntegerConsumer.aidl"
        "telephony/java/com/android/internal/telephony/IMms.aidl"
        "telephony/java/com/android/internal/telephony/INumberVerificationCallback.aidl"
        "telephony/java/com/android/internal/telephony/IOnSubscriptionsChangedListener.aidl"
        "telephony/java/com/android/internal/telephony/IPhoneStateListener.aidl"
        "telephony/java/com/android/internal/telephony/IPhoneSubInfo.aidl"
        "telephony/java/com/android/internal/telephony/ISetOpportunisticDataCallback.aidl"
        "telephony/java/com/android/internal/telephony/ISms.aidl"
        "telephony/java/com/android/internal/telephony/ISub.aidl"
        "telephony/java/com/android/internal/telephony/IOns.aidl"
        "telephony/java/com/android/internal/telephony/ITelephony.aidl"
        "telephony/java/com/android/internal/telephony/ITelephonyRegistry.aidl"
        "telephony/java/com/android/internal/telephony/IUpdateAvailableNetworksCallback.aidl"
        "telephony/java/com/android/internal/telephony/IWapPushManager.aidl"
        "telephony/java/com/android/internal/telephony/euicc/IAuthenticateServerCallback.aidl"
        "telephony/java/com/android/internal/telephony/euicc/ICancelSessionCallback.aidl"
        "telephony/java/com/android/internal/telephony/euicc/IDeleteProfileCallback.aidl"
        "telephony/java/com/android/internal/telephony/euicc/IDisableProfileCallback.aidl"
        "telephony/java/com/android/internal/telephony/euicc/IEuiccCardController.aidl"
        "telephony/java/com/android/internal/telephony/euicc/IEuiccController.aidl"
        "telephony/java/com/android/internal/telephony/euicc/IGetAllProfilesCallback.aidl"
        "telephony/java/com/android/internal/telephony/euicc/IGetDefaultSmdpAddressCallback.aidl"
        "telephony/java/com/android/internal/telephony/euicc/IGetEuiccChallengeCallback.aidl"
        "telephony/java/com/android/internal/telephony/euicc/IGetEuiccInfo1Callback.aidl"
        "telephony/java/com/android/internal/telephony/euicc/IGetEuiccInfo2Callback.aidl"
        "telephony/java/com/android/internal/telephony/euicc/IGetProfileCallback.aidl"
        "telephony/java/com/android/internal/telephony/euicc/IGetRulesAuthTableCallback.aidl"
        "telephony/java/com/android/internal/telephony/euicc/IGetSmdsAddressCallback.aidl"
        "telephony/java/com/android/internal/telephony/euicc/IListNotificationsCallback.aidl"
        "telephony/java/com/android/internal/telephony/euicc/ILoadBoundProfilePackageCallback.aidl"
        "telephony/java/com/android/internal/telephony/euicc/IPrepareDownloadCallback.aidl"
        "telephony/java/com/android/internal/telephony/euicc/IRemoveNotificationFromListCallback.aidl"
        "telephony/java/com/android/internal/telephony/euicc/IResetMemoryCallback.aidl"
        "telephony/java/com/android/internal/telephony/euicc/IRetrieveNotificationCallback.aidl"
        "telephony/java/com/android/internal/telephony/euicc/IRetrieveNotificationListCallback.aidl"
        "telephony/java/com/android/internal/telephony/euicc/ISetDefaultSmdpAddressCallback.aidl"
        "telephony/java/com/android/internal/telephony/euicc/ISetNicknameCallback.aidl"
        "telephony/java/com/android/internal/telephony/euicc/ISwitchToProfileCallback.aidl"
        "wifi/java/android/net/wifi/INetworkRequestMatchCallback.aidl"
        "wifi/java/android/net/wifi/INetworkRequestUserSelectionCallback.aidl"
        "wifi/java/android/net/wifi/ISoftApCallback.aidl"
        "wifi/java/android/net/wifi/ITrafficStateCallback.aidl"
        "wifi/java/android/net/wifi/IWifiManager.aidl"
        "wifi/java/android/net/wifi/IOnWifiUsabilityStatsListener.aidl"
        "wifi/java/android/net/wifi/aware/IWifiAwareDiscoverySessionCallback.aidl"
        "wifi/java/android/net/wifi/aware/IWifiAwareEventCallback.aidl"
        "wifi/java/android/net/wifi/aware/IWifiAwareMacAddressProvider.aidl"
        "wifi/java/android/net/wifi/aware/IWifiAwareManager.aidl"
        "wifi/java/android/net/wifi/p2p/IWifiP2pManager.aidl"
        "wifi/java/android/net/wifi/rtt/IRttCallback.aidl"
        "wifi/java/android/net/wifi/rtt/IWifiRttManager.aidl"
        "wifi/java/android/net/wifi/hotspot2/IProvisioningCallback.aidl"
        "wifi/java/android/net/wifi/IDppCallback.aidl"
        "wifi/java/android/net/wifi/IWifiScanner.aidl"
        "packages/services/PacProcessor/com/android/net/IProxyService.aidl"
        "packages/services/Proxy/com/android/net/IProxyCallback.aidl"
        "packages/services/Proxy/com/android/net/IProxyPortListener.aidl"
        "core/java/android/service/quicksettings/IQSService.aidl"
        "core/java/android/service/quicksettings/IQSTileService.aidl"

        ":libupdate_engine_aidl"

        ":storaged_aidl"
        ":vold_aidl"
        ":gsiservice_aidl"
        ":installd_aidl"
        ":dumpstate_aidl"
        ":incidentcompanion_aidl"

        "lowpan/java/android/net/lowpan/ILowpanEnergyScanCallback.aidl"
        "lowpan/java/android/net/lowpan/ILowpanNetScanCallback.aidl"
        "lowpan/java/android/net/lowpan/ILowpanInterfaceListener.aidl"
        "lowpan/java/android/net/lowpan/ILowpanInterface.aidl"
        "lowpan/java/android/net/lowpan/ILowpanManagerListener.aidl"
        "lowpan/java/android/net/lowpan/ILowpanManager.aidl"

        "core/java/android/app/admin/SecurityLogTags.logtags"
        "core/java/android/content/EventLogTags.logtags"
        "core/java/android/speech/tts/EventLogTags.logtags"
        "core/java/android/net/EventLogTags.logtags"
        "core/java/android/os/EventLogTags.logtags"
        "core/java/android/webkit/EventLogTags.logtags"
        "core/java/com/android/internal/app/EventLogTags.logtags"
        "core/java/com/android/internal/logging/EventLogTags.logtags"
        "core/java/com/android/server/DropboxLogTags.logtags"
        "core/java/org/chromium/arc/EventLogTags.logtags"

        ":apex-properties"
        ":platform-properties"

        ":framework-statslog-gen"
    ];

    aidl = {
        export_include_dirs = [
            #  From build/make/core/pathmap.mk FRAMEWORK_BASE_SUBDIRS
            "core/java"
            "graphics/java"
            "location/java"
            "lowpan/java"
            "media/java"
            "media/apex/java"
            "media/mca/effect/java"
            "media/mca/filterfw/java"
            "media/mca/filterpacks/java"
            "drm/java"
            "opengl/java"
            "sax/java"
            "telecomm/java"
            "telephony/java"
            "wifi/java"
            "keystore/java"
            "rs/java"
        ];

        include_dirs = [
            "system/update_engine/binder_bindings"
            "frameworks/native/aidl/binder"
            "frameworks/native/cmds/dumpstate/binder"
            "frameworks/native/libs/incidentcompanion/binder"
            "frameworks/av/camera/aidl"
            "frameworks/av/media/libaudioclient/aidl"
            "frameworks/native/aidl/gui"
            "frameworks/native/libs/incidentcompanion/binder"
            "system/core/storaged/binder"
            "system/vold/binder"
            "system/gsid/aidl"
            "system/bt/binder"
            "system/security/keystore/binder"
        ];

        generate_get_transaction_name = true;
    };

    exclude_srcs = [
        #  See comment on framework-atb-backward-compatibility module below
        "core/java/android/content/pm/AndroidTestBaseUpdater.java"
    ];

    no_framework_libs = true;
    libs = [
        "ext"
        "updatable_media_stubs"
    ];

    jarjar_rules = ":framework-jarjar-rules";

    static_libs = [
        "apex_aidl_interface-java"
        "framework-protos"
        "game-driver-protos"
        "android.hidl.base-V1.0-java"
        "android.hardware.cas-V1.1-java"
        "android.hardware.cas-V1.0-java"
        "android.hardware.contexthub-V1.0-java"
        "android.hardware.health-V1.0-java-constants"
        "android.hardware.radio-V1.0-java"
        "android.hardware.radio-V1.1-java"
        "android.hardware.radio-V1.2-java"
        "android.hardware.radio-V1.3-java"
        "android.hardware.radio-V1.4-java"
        "android.hardware.thermal-V1.0-java-constants"
        "android.hardware.thermal-V1.0-java"
        "android.hardware.thermal-V1.1-java"
        "android.hardware.thermal-V2.0-java"
        "android.hardware.tv.input-V1.0-java-constants"
        "android.hardware.usb-V1.0-java-constants"
        "android.hardware.usb-V1.1-java-constants"
        "android.hardware.usb-V1.2-java-constants"
        "android.hardware.usb.gadget-V1.0-java"
        "android.hardware.vibrator-V1.0-java"
        "android.hardware.vibrator-V1.1-java"
        "android.hardware.vibrator-V1.2-java"
        "android.hardware.vibrator-V1.3-java"
        "android.hardware.wifi-V1.0-java-constants"
        "devicepolicyprotosnano"
    ];

    required = [
        #  TODO: remove gps_debug when the build system propagates "required" properly.
        "gps_debug.conf"
    ];

    dxflags = [
        "--core-library"
        "--multi-dex"
    ];

    plugins = ["view-inspector-annotation-processor"];
};

framework-jarjar-rules = filegroup {
    name = "framework-jarjar-rules";
    srcs = ["jarjar_rules_hidl.txt"];
};

libincident_aidl = filegroup {
    name = "libincident_aidl";
    srcs = [
        "core/java/android/os/IIncidentManager.aidl"
        "core/java/android/os/IIncidentReportStatusListener.aidl"
    ];
};

statsd_aidl = filegroup {
    name = "statsd_aidl";
    srcs = [
        "core/java/android/os/IStatsCompanionService.aidl"
        "core/java/android/os/IStatsManager.aidl"
        "core/java/android/os/IStatsPullerCallback.aidl"
    ];
};

libvibrator_aidl = filegroup {
    name = "libvibrator_aidl";
    srcs = [
        "core/java/android/os/IExternalVibrationController.aidl"
        "core/java/android/os/IExternalVibratorService.aidl"
    ];
};

framework = java_library {
    name = "framework";
    defaults = ["framework-defaults"];
    javac_shard_size = 150;
};

framework-annotation-proc = java_library {
    name = "framework-annotation-proc";
    defaults = ["framework-defaults"];
    #  Use UsedByApps annotation processor
    plugins = ["unsupportedappusage-annotation-processor"];
};

#  A host library including just UnsupportedAppUsage.java so that the annotation
#  processor can also use this annotation.
unsupportedappusage-annotation = java_library_host {
    name = "unsupportedappusage-annotation";
    srcs = [
        "core/java/android/annotation/IntDef.java"
        "core/java/android/annotation/UnsupportedAppUsage.java"
    ];
};

#  A temporary build target that is conditionally included on the bootclasspath if
#  android.test.base library has been removed and which provides support for
#  maintaining backwards compatibility for APKs that target pre-P and depend on
#  android.test.base classes. This is used iff REMOVE_ATB_FROM_BCP=true is
#  specified on the build command line.
framework-atb-backward-compatibility = java_library {
    name = "framework-atb-backward-compatibility";
    installable = true;
    srcs = [
        "core/java/android/content/pm/AndroidTestBaseUpdater.java"
    ];
};

framework-statslog-gen = genrule {
    name = "framework-statslog-gen";
    tools = ["stats-log-api-gen"];
    cmd = "$(location stats-log-api-gen) --java $(out)";
    out = ["android/util/StatsLogInternal.java"];
};

framework-javastream-protos = gensrcs {
    name = "framework-javastream-protos";
    depfile = true;

    tool_files = ["tools/genprotos.sh"];
    tools = [
        "aprotoc"
        "protoc-gen-javastream"
        "soong_zip"
    ];

    #  TODO This should not be needed. If you set a custom OUT_DIR or OUT_DIR_COMMON_BASE you can
    #  end up with a command that is extremely long, potentially going passed MAX_ARG_STRLEN due to
    #  the way sbox rewrites the command. See b/70221552.
    cmd = "$(location tools/genprotos.sh) " +
        " $(location aprotoc) " +
        " $(location protoc-gen-javastream) " +
        " $(location soong_zip) " +
        " $(genDir) " +
        " $(depfile) " +
        " $(in) " +
        " $(out)";
    srcs = [
        "core/proto/**/*.proto"
        "libs/incident/**/*.proto"
    ];
    output_extension = "srcjar";
};

framework-annotations = filegroup {
    name = "framework-annotations";
    srcs = [
        "core/java/android/annotation/NonNull.java"
        "core/java/android/annotation/Nullable.java"
        "core/java/android/annotation/IntDef.java"
        "core/java/android/annotation/IntRange.java"
        "core/java/android/annotation/UnsupportedAppUsage.java"
        "core/java/com/android/internal/annotations/GuardedBy.java"
        "core/java/com/android/internal/annotations/VisibleForTesting.java"
    ];
};

framework-networkstack-shared-srcs = filegroup {
    name = "framework-networkstack-shared-srcs";
    srcs = [
        #  TODO: remove these annotations as soon as we can use andoid.support.annotations.*
        ":framework-annotations"
        "core/java/android/net/DhcpResults.java"
        "core/java/android/util/LocalLog.java"
        "core/java/com/android/internal/util/HexDump.java"
        "core/java/com/android/internal/util/IndentingPrintWriter.java"
        "core/java/com/android/internal/util/IState.java"
        "core/java/com/android/internal/util/MessageUtils.java"
        "core/java/com/android/internal/util/Preconditions.java"
        "core/java/com/android/internal/util/RingBufferIndices.java"
        "core/java/com/android/internal/util/State.java"
        "core/java/com/android/internal/util/StateMachine.java"
        "core/java/com/android/internal/util/TrafficStatsConstants.java"
        "core/java/com/android/internal/util/WakeupMessage.java"
        "core/java/android/net/shared/*.java"
    ];
};

#  Build ext.jar
#  ============================================================
ext = java_library {
    name = "ext";
    installable = true;
    no_framework_libs = true;
    static_libs = [
        "libphonenumber-platform"
        "nist-sip"
        "tagsoup"
        "rappor"
        "libtextclassifier-java"
    ];
    required = [
        "libtextclassifier"
    ];
    dxflags = ["--core-library"];
};

#  ====  java proto host library  ==============================
platformprotos = java_library_host {
    name = "platformprotos";
    srcs = [
        "cmds/am/proto/instrumentation_data.proto"
        "cmds/statsd/src/**/*.proto"
        "core/proto/**/*.proto"
        "libs/incident/proto/**/*.proto"
    ];
    proto = {
        include_dirs = ["external/protobuf/src"];
        type = "full";
    };
    errorprone = {
        javacflags = ["-Xep:MissingOverride:OFF"]; #  b/72714520
    };
};

#  ====  java proto device library (for test only)  ==============================
platformprotosnano = java_library {
    name = "platformprotosnano";
    proto = {
        type = "nano";
        output_params = ["store_unknown_fields=true"];
        include_dirs = ["external/protobuf/src"];
    };
    exclude_srcs = [
        "core/proto/android/privacy.proto"
        "core/proto/android/section.proto"
    ];
    sdk_version = "current";
    srcs = [
        "core/proto/**/*.proto"
        "libs/incident/proto/android/os/**/*.proto"
    ];
};

#  ====  java proto device library (for test only)  ==============================
platformprotoslite = java_library {
    name = "platformprotoslite";
    proto = {
        type = "lite";
        include_dirs = ["external/protobuf/src"];
    };

    srcs = [
        "core/proto/**/*.proto"
        "libs/incident/proto/android/os/**/*.proto"
    ];
    exclude_srcs = [
        "core/proto/android/privacy.proto"
        "core/proto/android/section.proto"
    ];
    #  Protos have lots of MissingOverride and similar.
    errorprone = {
        javacflags = ["-XepDisableAllChecks"];
    };
};

#  ====  c++ proto device library  ==============================
libplatformprotos-defaults = cc_defaults {
    name = "libplatformprotos-defaults";

    proto = {
        export_proto_headers = true;
        include_dirs = ["external/protobuf/src"];
    };

    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
    ];

    srcs = [
        "core/proto/**/*.proto"
    ];
};

libplatformprotos = cc_library {
    name = "libplatformprotos";
    defaults = ["libplatformprotos-defaults"];
    host_supported = true;

    target = {
        host = {
            proto = {
                type = "full";
            };
        };
        android = {
            proto = {
                type = "lite";
            };
            shared_libs = [
                "libprotobuf-cpp-lite"
            ];
            shared = {
                enabled = false;
            };
        };
    };
};

#  This library is meant for vendor code that needs to output protobuf. It links
#  against the static version of libprotobuf-cpp-lite, for which we can not guarantee
#  binary compatibility.
libplatformprotos-static = cc_library {
    name = "libplatformprotos-static";
    defaults = ["libplatformprotos-defaults"];
    host_supported = false;

    #  This is okay because this library is only built as a static library.  The C++
    #  API is not guaranteed. The proto API is guaranteed to be stable via Metrics Council,
    #  but is not authorized to be used outside of debugging.
    vendor_available = true;

    target = {
        android = {
            proto = {
                type = "lite";
            };
            static_libs = [
                "libprotobuf-cpp-lite"
            ];
            shared = {
                enabled = false;
            };
        };
    };
};

#  This is the full proto version of libplatformprotos. It may only
#  be used by test code that is not shipped on the device.
libplatformprotos-test = cc_library {
    name = "libplatformprotos-test";
    defaults = ["libplatformprotos-defaults"];
    host_supported = false;

    target = {
        android = {
            proto = {
                type = "full";
            };
            shared = {
                enabled = false;
            };
        };
    };
};

gen-platform-proto-constants = gensrcs {
    name = "gen-platform-proto-constants";
    depfile = true;

    tools = [
        "aprotoc"
        "protoc-gen-cppstream"
    ];

    srcs = [
        "core/proto/android/os/backtrace.proto"
        "core/proto/android/os/batterytype.proto"
        "core/proto/android/os/cpufreq.proto"
        "core/proto/android/os/cpuinfo.proto"
        "core/proto/android/os/data.proto"
        "core/proto/android/os/kernelwake.proto"
        "core/proto/android/os/pagetypeinfo.proto"
        "core/proto/android/os/procrank.proto"
        "core/proto/android/os/ps.proto"
        "core/proto/android/os/system_properties.proto"
        "core/proto/android/util/event_log_tags.proto"
        "core/proto/android/util/log.proto"
    ];

    #  Append protoc-gen-cppstream tool's PATH otherwise aprotoc can't find the plugin tool
    cmd = "mkdir -p $(genDir) " +
        "&& $(location aprotoc) " +
        "  --plugin=$(location protoc-gen-cppstream) " +
        "  --dependency_out=$(depfile) " +
        "  --cppstream_out=$(genDir) " +
        "  -Iexternal/protobuf/src " +
        "  -I . " +
        "  $(in)";

    output_extension = "proto.h";
};

subdirs = [
    "cmds/*"
    "core/*"
    "libs/*"
    "media/*"
    "proto"
    "tools/*"
    "native/android"
    "native/graphics/jni"
];

optional_subdirs = [
    "core/tests/utiltests/jni"
];

#  TODO(b/77285514): remove this once the last few hidl interfaces have been
#  updated to use hwbinder.stubs.
hwbinder = java_library {
    name = "hwbinder";
    no_framework_libs = true;

    srcs = [
        "core/java/android/os/HidlSupport.java"
        "core/java/android/annotation/IntDef.java"
        "core/java/android/annotation/NonNull.java"
        "core/java/android/annotation/Nullable.java"
        "core/java/android/annotation/SystemApi.java"
        "core/java/android/annotation/TestApi.java"
        "core/java/android/annotation/UnsupportedAppUsage.java"
        "core/java/android/os/HwBinder.java"
        "core/java/android/os/HwBlob.java"
        "core/java/android/os/HwParcel.java"
        "core/java/android/os/IHwBinder.java"
        "core/java/android/os/IHwInterface.java"
        "core/java/android/os/DeadObjectException.java"
        "core/java/android/os/DeadSystemException.java"
        "core/java/android/os/NativeHandle.java"
        "core/java/android/os/RemoteException.java"
        "core/java/android/util/AndroidException.java"
    ];

    dxflags = ["--core-library"];
    installable = false;
};

base_default = python_defaults {
    name = "base_default";
    version = {
        py2 = {
            enabled = true;
            embedded_launcher = true;
        };
        py3 = {
            enabled = false;
            embedded_launcher = false;
        };
    };
};

fontchain_linter = python_binary_host {
    name = "fontchain_linter";
    defaults = ["base_default"];
    main = "tools/fonts/fontchain_linter.py";
    srcs = [
        "tools/fonts/fontchain_linter.py"
    ];
    libs = [
        "fontTools"
    ];
};

#  TODO: Don't rely on this list once droiddoc can take a list of packages to document
frameworks_base_subdirs = [
    "core/java"
    "graphics/java"
    "location/java"
    "media/java"
    "media/mca/effect/java"
    "media/mca/filterfw/java"
    "media/mca/filterpacks/java"
    "drm/java"
    "opengl/java"
    "sax/java"
    "telecomm/java"
    "telephony/java"
    "wifi/java"
    "lowpan/java"
    "keystore/java"
    "rs/java"
];

packages_to_document = [
    "android"
    "javax/microedition/khronos"
    "org/apache/http/conn"
    "org/apache/http/params"
];

#  Make the api/current.txt file available for use by modules in other
#  directories.
"frameworks-base-api-current.txt" = filegroup {
    name = "frameworks-base-api-current.txt";
    srcs = [
        "api/current.txt"
    ];
};

framework_docs_only_args = " -android -manifest $(location core/res/AndroidManifest.xml) " +
    "-werror -lerror -hide 111 -hide 113 -hide 125 -hide 126 -hide 127 -hide 128 " +
    "-overview $(location core/java/overview.html) " +
    #  Federate Support Library references against local API file.
    "-federate SupportLib https://developer.android.com " +
    "-federationapi SupportLib $(location :current-support-api) ";

framework_docs_only_libs = [
    "voip-common"
    "android.test.mock"
    "android-support-annotations"
    "android-support-compat"
    "android-support-core-ui"
    "android-support-core-utils"
    "android-support-customtabs"
    "android-support-design"
    "android-support-dynamic-animation"
    "android-support-exifinterface"
    "android-support-fragment"
    "android-support-media-compat"
    "android-support-percent"
    "android-support-recommendation"
    "android-support-transition"
    "android-support-tv-provider"
    "android-support-v7-cardview"
    "android-support-v7-gridlayout"
    "android-support-v7-mediarouter"
    "android-support-v7-palette"
    "android-support-v7-preference"
    "android-support-v13"
    "android-support-v14-preference"
    "android-support-v17-leanback"
    "android-support-v17-preference-leanback"
    "android-support-wear"
    "android-support-vectordrawable"
    "android-support-animatedvectordrawable"
    "android-support-v7-appcompat"
    "android-support-v7-recyclerview"
    "android-support-emoji"
    "android-support-emoji-appcompat"
    "android-support-emoji-bundled"
    "android-support-v8-renderscript"
    "android-support-multidex"
    "android-support-multidex-instrumentation"
];

metalava_framework_docs_args = "--manifest $(location core/res/AndroidManifest.xml) " +
    "--hide-package com.android.okhttp " +
    "--hide-package com.android.org.conscrypt --hide-package com.android.server " +
    "--error UnhiddenSystemApi " +
    "--hide RequiresPermission " +
    "--hide MissingPermission --hide BroadcastBehavior " +
    "--hide HiddenSuperclass --hide DeprecationMismatch --hide UnavailableSymbol " +
    "--hide SdkConstant --hide HiddenTypeParameter --hide Todo --hide Typo";

framework-doc-stubs-default = stubs_defaults {
    name = "framework-doc-stubs-default";
    srcs = [
        "test-base/src/**/*.java"
        ":opt-telephony-srcs"
        ":opt-net-voip-srcs"
        ":core_public_api_files"
        ":updatable-media-srcs-without-aidls"
        "test-mock/src/**/*.java"
        "test-runner/src/**/*.java"
    ];
    srcs_lib = "framework";
    srcs_lib_whitelist_dirs = frameworks_base_subdirs;
    srcs_lib_whitelist_pkgs = packages_to_document;
    libs = framework_docs_only_libs;
    local_sourcepaths = frameworks_base_subdirs;
    create_doc_stubs = true;
    annotations_enabled = true;
    api_levels_annotations_enabled = true;
    api_levels_annotations_dirs = [
        "sdk-dir"
        "api-versions-jars-dir"
    ];
    previous_api = ":last-released-public-api";
    merge_annotations_dirs = [
        "metalava-manual"
        "ojluni-annotated-sdk-stubs"
    ];
};

framework-docs-default = doc_defaults {
    name = "framework-docs-default";
    libs = framework_docs_only_libs ++
        ["stub-annotations"];
    html_dirs = [
        "docs/html"
    ];
    knowntags = [
        "docs/knowntags.txt"
        ":known-oj-tags"
    ];
    custom_template = "droiddoc-templates-sdk";
    resourcesdir = "docs/html/reference/images/";
    resourcesoutdir = "reference/android/images/";
    hdf = [
        "dac true"
        "sdk.codename O"
        "sdk.preview.version 1"
        "sdk.version 7.0"
        "sdk.rel.id 1"
        "sdk.preview 0"
    ];
    arg_files = [
        "core/res/AndroidManifest.xml"
        "core/java/overview.html"
        ":current-support-api"
    ];
    create_stubs = false;
};

metalava-api-stubs-default = stubs_defaults {
    name = "metalava-api-stubs-default";
    srcs = [
        ":opt-telephony-srcs"
        ":opt-net-voip-srcs"
        ":core_public_api_files"
        ":updatable-media-srcs-without-aidls"
    ];
    srcs_lib = "framework";
    srcs_lib_whitelist_dirs = frameworks_base_subdirs;
    srcs_lib_whitelist_pkgs = packages_to_document;
    libs = [
        "ext"
        "framework"
        "voip-common"
    ];
    local_sourcepaths = frameworks_base_subdirs;
    installable = false;
    annotations_enabled = true;
    previous_api = ":last-released-public-api";
    merge_annotations_dirs = [
        "metalava-manual"
        "ojluni-annotated-sdk-stubs"
    ];
    api_levels_annotations_enabled = true;
    api_levels_annotations_dirs = [
        "sdk-dir"
        "api-versions-jars-dir"
    ];
};

framework-doc-stubs = droidstubs {
    name = "framework-doc-stubs";
    defaults = ["framework-doc-stubs-default"];
    arg_files = [
        "core/res/AndroidManifest.xml"
    ];
    args = metalava_framework_docs_args;
    write_sdk_values = true;
};

framework-doc-system-stubs = droidstubs {
    name = "framework-doc-system-stubs";
    defaults = ["framework-doc-stubs-default"];
    arg_files = [
        "core/res/AndroidManifest.xml"
    ];
    args = metalava_framework_docs_args + " --show-annotation android.annotation.SystemApi ";
    write_sdk_values = true;
};

doc-comment-check-docs = droiddoc {
    name = "doc-comment-check-docs";
    defaults = ["framework-docs-default"];
    srcs = [
        ":framework-doc-stubs"
    ];
    args = framework_docs_only_args + " -referenceonly -parsecomments";
    installable = false;
};

offline-sdk-docs = droiddoc {
    name = "offline-sdk-docs";
    defaults = ["framework-docs-default"];
    srcs = [
        ":framework-doc-stubs"
    ];
    hdf = [
        "android.whichdoc offline"
    ];
    proofread_file = "offline-sdk-docs-proofrerad.txt";
    args = framework_docs_only_args + " -offlinemode -title \"Android SDK\"";
    static_doc_index_redirect = "docs/docs-preview-index.html";
};

offline-sdk-referenceonly-docs = droiddoc {
    #  Please sync with android-api-council@ before making any changes for the name property below.
    #  Since there's cron jobs that fetch offline-sdk-referenceonly-docs-docs.zip periodically.
    #  See b/116221385 for reference.
    name = "offline-sdk-referenceonly-docs";
    defaults = ["framework-docs-default"];
    srcs = [
        ":framework-doc-stubs"
    ];
    hdf = [
        "android.whichdoc offline"
    ];
    proofread_file = "offline-sdk-referenceonly-docs-proofrerad.txt";
    args = framework_docs_only_args + " -offlinemode -title \"Android SDK\" -referenceonly";
    static_doc_index_redirect = "docs/docs-documentation-redirect.html";
    static_doc_properties = "docs/source.properties";
};

offline-system-sdk-referenceonly-docs = droiddoc {
    #  Please sync with android-api-council@ before making any changes for the name property below.
    #  Since there's cron jobs that fetch offline-system-sdk-referenceonly-docs-docs.zip periodically.
    #  See b/116221385 for reference.
    name = "offline-system-sdk-referenceonly-docs";
    defaults = ["framework-docs-default"];
    srcs = [
        ":framework-doc-system-stubs"
    ];
    hdf = [
        "android.whichdoc offline"
    ];
    proofread_file = "offline-system-sdk-referenceonly-docs-proofrerad.txt";
    args = framework_docs_only_args + " -hide 101 -hide 104 -hide 108" +
    " -offlinemode -title \"Android System SDK\" -referenceonly";
    static_doc_index_redirect = "docs/docs-documentation-redirect.html";
    static_doc_properties = "docs/source.properties";
};

online-sdk-docs = droiddoc {
    name = "online-sdk-docs";
    defaults = ["framework-docs-default"];
    srcs = [
        ":framework-doc-stubs"
    ];
    hdf = [
        "android.whichdoc online"
        "android.hasSamples true"
    ];
    proofread_file = "online-sdk-docs-proofrerad.txt";
    args = framework_docs_only_args +
        " -toroot / -samplegroup Admin " +
        " -samplegroup Background " +
        " -samplegroup Connectivity " +
        " -samplegroup Content " +
        " -samplegroup Input " +
        " -samplegroup Media " +
        " -samplegroup Notification " +
        " -samplegroup RenderScript " +
        " -samplegroup Security " +
        " -samplegroup Sensors " +
        " -samplegroup System " +
        " -samplegroup Testing " +
        " -samplegroup UI " +
        " -samplegroup Views " +
        " -samplegroup Wearable -samplesdir development/samples/browseable ";
};

online-system-api-sdk-docs = droiddoc {
    name = "online-system-api-sdk-docs";
    defaults = ["framework-docs-default"];
    srcs = [
        ":framework-doc-system-stubs"
    ];
    hdf = [
        "android.whichdoc online"
        "android.hasSamples true"
    ];
    proofread_file = "online-system-api-sdk-docs-proofrerad.txt";
    args = framework_docs_only_args +
        " -referenceonly " +
        " -title \"Android SDK - Including system APIs.\" " +
        " -hide 101 " +
        " -hide 104 " +
        " -hide 108 " +
        " -toroot / -samplegroup Admin " +
        " -samplegroup Background " +
        " -samplegroup Connectivity " +
        " -samplegroup Content " +
        " -samplegroup Input " +
        " -samplegroup Media " +
        " -samplegroup Notification " +
        " -samplegroup RenderScript " +
        " -samplegroup Security " +
        " -samplegroup Sensors " +
        " -samplegroup System " +
        " -samplegroup Testing " +
        " -samplegroup UI " +
        " -samplegroup Views " +
        " -samplegroup Wearable -samplesdir development/samples/browseable ";
    installable = false;
};

ds-docs = droiddoc {
    name = "ds-docs";
    defaults = ["framework-docs-default"];
    srcs = [
        ":framework-doc-stubs"
    ];
    hdf = [
        "android.whichdoc online"
        "android.hasSamples true"
    ];
    proofread_file = "ds-docs-proofrerad.txt";
    args = framework_docs_only_args +
        " -toroot / -yamlV2 -metalavaApiSince -samplegroup Admin " +
        " -samplegroup Background " +
        " -samplegroup Connectivity " +
        " -samplegroup Content " +
        " -samplegroup Input " +
        " -samplegroup Media " +
        " -samplegroup Notification " +
        " -samplegroup RenderScript " +
        " -samplegroup Security " +
        " -samplegroup Sensors " +
        " -samplegroup System " +
        " -samplegroup Testing " +
        " -samplegroup UI " +
        " -samplegroup Views " +
        " -samplegroup Wearable -devsite -samplesdir development/samples/browseable ";
};

ds-static-docs = droiddoc {
    name = "ds-static-docs";
    defaults = ["framework-docs-default"];
    srcs = [
        ":framework-doc-stubs"
    ];
    hdf = [
        "android.whichdoc online"
    ];
    proofread_file = "ds-static-docs-proofrerad.txt";
    args = framework_docs_only_args +
        " -staticonly " +
        " -toroot / " +
        " -devsite " +
        " -ignoreJdLinks ";
};

ds-ref-navtree-docs = droiddoc {
    name = "ds-ref-navtree-docs";
    defaults = ["framework-docs-default"];
    srcs = [
        ":framework-doc-stubs"
    ];
    hdf = [
        "android.whichdoc online"
    ];
    proofread_file = "ds-ref-navtree-docs-proofrerad.txt";
    args = framework_docs_only_args +
        " -toroot / " +
        " -atLinksNavtree " +
        " -navtreeonly ";
};

online-sdk-dev-docs = droiddoc {
    name = "online-sdk-dev-docs";
    defaults = ["framework-docs-default"];
    srcs = [
        ":framework-doc-stubs"
    ];
    hdf = [
        "android.whichdoc online"
        "android.hasSamples true"
    ];
    proofread_file = "online-sdk-dev-docs-proofrerad.txt";
    args = framework_docs_only_args +
        " -toroot / -samplegroup Admin " +
        " -samplegroup Background " +
        " -samplegroup Connectivity " +
        " -samplegroup Content " +
        " -samplegroup Input " +
        " -samplegroup Media " +
        " -samplegroup Notification " +
        " -samplegroup RenderScript " +
        " -samplegroup Security " +
        " -samplegroup Sensors " +
        " -samplegroup System " +
        " -samplegroup Testing " +
        " -samplegroup UI " +
        " -samplegroup Views " +
        " -samplegroup Wearable -samplesdir development/samples/browseable ";
};

hidden-docs = droiddoc {
    name = "hidden-docs";
    defaults = ["framework-docs-default"];
    srcs = [
        ":framework-doc-stubs"
    ];
    proofread_file = "hidden-docs-proofrerad.txt";
    args = framework_docs_only_args +
        " -referenceonly " +
        " -title \"Android SDK - Including hidden APIs.\"";
};

hwbinder-stubs-docs = droidstubs {
    name = "hwbinder-stubs-docs";
    srcs = [
        "core/java/android/os/HidlSupport.java"
        "core/java/android/annotation/IntDef.java"
        "core/java/android/annotation/NonNull.java"
        "core/java/android/annotation/SystemApi.java"
        "core/java/android/os/HwBinder.java"
        "core/java/android/os/HwBlob.java"
        "core/java/android/os/HwParcel.java"
        "core/java/android/os/IHwBinder.java"
        "core/java/android/os/IHwInterface.java"
        "core/java/android/os/DeadObjectException.java"
        "core/java/android/os/DeadSystemException.java"
        "core/java/android/os/NativeHandle.java"
        "core/java/android/os/RemoteException.java"
        "core/java/android/util/AndroidException.java"
    ];
    installable = false;
    no_framework_libs = true;
    annotations_enabled = true;
    previous_api = ":last-released-public-api";
    merge_annotations_dirs = [
        "metalava-manual"
        "ojluni-annotated-sdk-stubs"
    ];
    args = " --show-annotation android.annotation.SystemApi";
};

"hwbinder.stubs" = java_library_static {
    name = "hwbinder.stubs";
    sdk_version = "core_current";
    srcs = [
        ":hwbinder-stubs-docs"
    ];
};

hiddenapi-lists-docs = droidstubs {
    name = "hiddenapi-lists-docs";
    defaults = ["metalava-api-stubs-default"];
    arg_files = [
        "core/res/AndroidManifest.xml"
    ];
    dex_api_filename = "public-dex.txt";
    private_dex_api_filename = "private-dex.txt";
    removed_dex_api_filename = "removed-dex.txt";
    args = metalava_framework_docs_args +
        " --show-unannotated " +
        " --show-annotation android.annotation.SystemApi " +
        " --show-annotation android.annotation.TestApi ";
};

hiddenapi-mappings = droidstubs {
    name = "hiddenapi-mappings";
    defaults = ["metalava-api-stubs-default"];
    srcs = [
        ":openjdk_java_files"
        ":non_openjdk_java_files"
        ":opt-telephony-common-srcs"
        "core/java/**/*.java"
    ];
    arg_files = [
        "core/res/AndroidManifest.xml"
    ];
    dex_mapping_filename = "dex-mapping.txt";
    args = metalava_framework_docs_args +
        " --hide ReferencesHidden " +
        " --hide UnhiddenSystemApi " +
        " --show-unannotated " +
        " --show-annotation android.annotation.SystemApi " +
        " --show-annotation android.annotation.TestApi ";
};

apache-http-stubs-sources = filegroup {
    name = "apache-http-stubs-sources";
    srcs = [
        "core/java/org/apache/http/conn/ConnectTimeoutException.java"
        "core/java/org/apache/http/conn/scheme/HostNameResolver.java"
        "core/java/org/apache/http/conn/scheme/LayeredSocketFactory.java"
        "core/java/org/apache/http/conn/scheme/SocketFactory.java"
        "core/java/org/apache/http/conn/ssl/AbstractVerifier.java"
        "core/java/org/apache/http/conn/ssl/AllowAllHostnameVerifier.java"
        "core/java/org/apache/http/conn/ssl/AndroidDistinguishedNameParser.java"
        "core/java/org/apache/http/conn/ssl/BrowserCompatHostnameVerifier.java"
        "core/java/org/apache/http/conn/ssl/SSLSocketFactory.java"
        "core/java/org/apache/http/conn/ssl/StrictHostnameVerifier.java"
        "core/java/org/apache/http/conn/ssl/X509HostnameVerifier.java"
        "core/java/org/apache/http/params/CoreConnectionPNames.java"
        "core/java/org/apache/http/params/HttpConnectionParams.java"
        "core/java/org/apache/http/params/HttpParams.java"
        "core/java/android/net/http/SslCertificate.java"
        "core/java/android/net/http/SslError.java"
        "core/java/com/android/internal/util/HexDump.java"
    ];
};

api-stubs-docs = droidstubs {
    name = "api-stubs-docs";
    defaults = ["metalava-api-stubs-default"];
    api_filename = "public_api.txt";
    private_api_filename = "private.txt";
    removed_api_filename = "removed.txt";
    arg_files = [
        "core/res/AndroidManifest.xml"
    ];
    args = metalava_framework_docs_args;
    check_api = {
        current = {
            api_file = "api/current.txt";
            removed_api_file = "api/removed.txt";
        };
        last_released = {
            api_file = ":last-released-public-api";
            removed_api_file = "api/removed.txt";
            baseline_file = ":public-api-incompatibilities-with-last-released";
        };
    };
    jdiff_enabled = true;
};

system-api-stubs-docs = droidstubs {
    name = "system-api-stubs-docs";
    defaults = ["metalava-api-stubs-default"];
    api_tag_name = "SYSTEM";
    api_filename = "system-api.txt";
    private_api_filename = "system-private.txt";
    private_dex_api_filename = "system-private-dex.txt";
    removed_api_filename = "system-removed.txt";
    arg_files = [
        "core/res/AndroidManifest.xml"
    ];
    args = metalava_framework_docs_args + " --show-annotation android.annotation.SystemApi";
    check_api = {
        current = {
            api_file = "api/system-current.txt";
            removed_api_file = "api/system-removed.txt";
        };
        last_released = {
            api_file = ":last-released-system-api";
            removed_api_file = "api/system-removed.txt";
            baseline_file = ":system-api-incompatibilities-with-last-released";
        };
    };
    jdiff_enabled = true;
};

test-api-stubs-docs = droidstubs {
    name = "test-api-stubs-docs";
    defaults = ["metalava-api-stubs-default"];
    api_tag_name = "TEST";
    api_filename = "test-api.txt";
    removed_api_filename = "test-removed.txt";
    arg_files = [
        "core/res/AndroidManifest.xml"
    ];
    args = metalava_framework_docs_args + " --show-annotation android.annotation.TestApi";
    check_api = {
        current = {
            api_file = "api/test-current.txt";
            removed_api_file = "api/test-removed.txt";
        };
    };
};

framework-annotation-nonnull-srcs = filegroup {
    name = "framework-annotation-nonnull-srcs";
    srcs = [
        "core/java/android/annotation/NonNull.java"
    ];
};

framework-media-annotation-srcs = filegroup {
    name = "framework-media-annotation-srcs";
    srcs = [
        "core/java/android/annotation/CallbackExecutor.java"
        "core/java/android/annotation/CallSuper.java"
        "core/java/android/annotation/DrawableRes.java"
        "core/java/android/annotation/IntDef.java"
        "core/java/android/annotation/LongDef.java"
        "core/java/android/annotation/NonNull.java"
        "core/java/android/annotation/Nullable.java"
        "core/java/android/annotation/RequiresPermission.java"
        "core/java/android/annotation/SdkConstant.java"
        "core/java/android/annotation/StringDef.java"
        "core/java/android/annotation/SystemApi.java"
        "core/java/android/annotation/TestApi.java"
        "core/java/android/annotation/UnsupportedAppUsage.java"
        "core/java/com/android/internal/annotations/GuardedBy.java"
    ];
};

#  Creates an index of AIDL methods; used for adding UnsupportedAppUsage
#  annotations to private apis
framework-aidl-mappings = aidl_mapping {
    name = "framework-aidl-mappings";
    srcs = [":framework-defaults"];
    output = "framework-aidl-mappings.txt";
};

in { inherit "frameworks-base-api-current.txt" "hwbinder.stubs" apache-http-stubs-sources api-stubs-docs base_default doc-comment-check-docs ds-docs ds-ref-navtree-docs ds-static-docs ext fontchain_linter framework framework-aidl-mappings framework-annotation-nonnull-srcs framework-annotation-proc framework-annotations framework-atb-backward-compatibility framework-defaults framework-doc-stubs framework-doc-stubs-default framework-doc-system-stubs framework-docs-default framework-jarjar-rules framework-javastream-protos framework-media-annotation-srcs framework-networkstack-shared-srcs framework-statslog-gen gen-platform-proto-constants hidden-docs hiddenapi-lists-docs hiddenapi-mappings hwbinder hwbinder-stubs-docs libincident_aidl libplatformprotos libplatformprotos-defaults libplatformprotos-static libplatformprotos-test libvibrator_aidl metalava-api-stubs-default offline-sdk-docs offline-sdk-referenceonly-docs offline-system-sdk-referenceonly-docs online-sdk-dev-docs online-sdk-docs online-system-api-sdk-docs platformprotos platformprotoslite platformprotosnano statsd_aidl system-api-stubs-docs test-api-stubs-docs unsupportedappusage-annotation; }
