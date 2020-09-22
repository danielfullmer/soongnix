{ android_app, cc_library_shared, genrule, java_library }:
let

#  MAP API module

"bluetooth.mapsapi" = java_library {
    name = "bluetooth.mapsapi";

    srcs = [
        "lib/mapapi/com/android/bluetooth/mapapi/BluetoothMapContract.java"
        "lib/mapapi/com/android/bluetooth/mapapi/BluetoothMapEmailProvider.java"
        "lib/mapapi/com/android/bluetooth/mapapi/BluetoothMapIMProvider.java"
    ];
};

#  Bluetooth JNI

libbluetooth_jni = cc_library_shared {
    name = "libbluetooth_jni";
    srcs = [
        "jni/com_android_bluetooth_a2dp.cpp"
        "jni/com_android_bluetooth_a2dp_sink.cpp"
        "jni/com_android_bluetooth_avrcp_controller.cpp"
        "jni/com_android_bluetooth_avrcp_target.cpp"
        "jni/com_android_bluetooth_btservice_AdapterService.cpp"
        "jni/com_android_bluetooth_btservice_BluetoothKeystore.cpp"
        "jni/com_android_bluetooth_gatt.cpp"
        "jni/com_android_bluetooth_hearing_aid.cpp"
        "jni/com_android_bluetooth_hfp.cpp"
        "jni/com_android_bluetooth_hfpclient.cpp"
        "jni/com_android_bluetooth_hid_device.cpp"
        "jni/com_android_bluetooth_hid_host.cpp"
        "jni/com_android_bluetooth_pan.cpp"
        "jni/com_android_bluetooth_sdp.cpp"
    ];
    header_libs = ["libbluetooth_headers"];
    include_dirs = [
        "system/bt/types"
    ];
    shared_libs = [
        "libbase"
        "libchrome"
        "liblog"
    ];
    static_libs = [
        "libbluetooth-types"
        #  TODO(b/148645937) move this back to shared_libs
        "libnativehelper"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
        "-Wno-unused-parameter"
    ];
    sanitize = {
        scs = true;
    };
};

#  Bluetooth APK

Bluetooth = android_app {
    name = "Bluetooth";

    srcs = [
        "src/com/android/bluetooth/AlertActivity.java"
        "src/com/android/bluetooth/BluetoothObexTransport.java"
        "src/com/android/bluetooth/BluetoothPrefs.java"
        "src/com/android/bluetooth/DeviceWorkArounds.java"
        "src/com/android/bluetooth/IObexConnectionHandler.java"
        "src/com/android/bluetooth/ObexRejectServer.java"
        "src/com/android/bluetooth/ObexServerSockets.java"
        "src/com/android/bluetooth/SignedLongLong.java"
        "src/com/android/bluetooth/Utils.java"
        "src/com/android/bluetooth/a2dp/A2dpCodecConfig.java"
        "src/com/android/bluetooth/a2dp/A2dpNativeInterface.java"
        "src/com/android/bluetooth/a2dp/A2dpService.java"
        "src/com/android/bluetooth/a2dp/A2dpStackEvent.java"
        "src/com/android/bluetooth/a2dp/A2dpStateMachine.java"
        "src/com/android/bluetooth/a2dpsink/A2dpSinkService.java"
        "src/com/android/bluetooth/a2dpsink/A2dpSinkStateMachine.java"
        "src/com/android/bluetooth/a2dpsink/A2dpSinkStreamHandler.java"
        "src/com/android/bluetooth/a2dpsink/StackEvent.java"
        "src/com/android/bluetooth/avrcp/AvrcpEventLogger.java"
        "src/com/android/bluetooth/avrcp/AvrcpNativeInterface.java"
        "src/com/android/bluetooth/avrcp/AvrcpTargetService.java"
        "src/com/android/bluetooth/avrcp/AvrcpVolumeManager.java"
        "src/com/android/bluetooth/avrcp/BrowsablePlayerConnector.java"
        "src/com/android/bluetooth/avrcp/BrowsedPlayerWrapper.java"
        "src/com/android/bluetooth/avrcp/GPMWrapper.java"
        "src/com/android/bluetooth/avrcp/MediaPlayerList.java"
        "src/com/android/bluetooth/avrcp/MediaPlayerWrapper.java"
        "src/com/android/bluetooth/avrcp/helpers/AvrcpPassthrough.java"
        "src/com/android/bluetooth/avrcp/helpers/Folder.java"
        "src/com/android/bluetooth/avrcp/helpers/ListItem.java"
        "src/com/android/bluetooth/avrcp/helpers/MediaData.java"
        "src/com/android/bluetooth/avrcp/helpers/Metadata.java"
        "src/com/android/bluetooth/avrcp/helpers/PlayStatus.java"
        "src/com/android/bluetooth/avrcp/helpers/PlayerInfo.java"
        "src/com/android/bluetooth/avrcp/helpers/Util.java"
        "src/com/android/bluetooth/avrcp/mockable/MediaBrowser.java"
        "src/com/android/bluetooth/avrcp/mockable/MediaBrowserFactory.java"
        "src/com/android/bluetooth/avrcp/mockable/MediaController.java"
        "src/com/android/bluetooth/avrcp/mockable/MediaControllerFactory.java"
        "src/com/android/bluetooth/avrcp/mockable/MediaPlayerWrapperFactory.java"
        "src/com/android/bluetooth/avrcpcontroller/AvrcpBipClient.java"
        "src/com/android/bluetooth/avrcpcontroller/AvrcpControllerService.java"
        "src/com/android/bluetooth/avrcpcontroller/AvrcpControllerStateMachine.java"
        "src/com/android/bluetooth/avrcpcontroller/AvrcpCoverArtManager.java"
        "src/com/android/bluetooth/avrcpcontroller/AvrcpCoverArtProvider.java"
        "src/com/android/bluetooth/avrcpcontroller/AvrcpCoverArtStorage.java"
        "src/com/android/bluetooth/avrcpcontroller/AvrcpItem.java"
        "src/com/android/bluetooth/avrcpcontroller/AvrcpPlayer.java"
        "src/com/android/bluetooth/avrcpcontroller/BluetoothMediaBrowserService.java"
        "src/com/android/bluetooth/avrcpcontroller/BrowseTree.java"
        "src/com/android/bluetooth/avrcpcontroller/PlayerApplicationSettings.java"
        "src/com/android/bluetooth/avrcpcontroller/StackEvent.java"
        "src/com/android/bluetooth/avrcpcontroller/bip/BipAttachmentFormat.java"
        "src/com/android/bluetooth/avrcpcontroller/bip/BipDateTime.java"
        "src/com/android/bluetooth/avrcpcontroller/bip/BipEncoding.java"
        "src/com/android/bluetooth/avrcpcontroller/bip/BipImage.java"
        "src/com/android/bluetooth/avrcpcontroller/bip/BipImageDescriptor.java"
        "src/com/android/bluetooth/avrcpcontroller/bip/BipImageFormat.java"
        "src/com/android/bluetooth/avrcpcontroller/bip/BipImageProperties.java"
        "src/com/android/bluetooth/avrcpcontroller/bip/BipPixel.java"
        "src/com/android/bluetooth/avrcpcontroller/bip/BipRequest.java"
        "src/com/android/bluetooth/avrcpcontroller/bip/BipTransformation.java"
        "src/com/android/bluetooth/avrcpcontroller/bip/ParseException.java"
        "src/com/android/bluetooth/avrcpcontroller/bip/RequestGetImage.java"
        "src/com/android/bluetooth/avrcpcontroller/bip/RequestGetImageProperties.java"
        "src/com/android/bluetooth/btservice/AbstractionLayer.java"
        "src/com/android/bluetooth/btservice/ActiveDeviceManager.java"
        "src/com/android/bluetooth/btservice/AdapterApp.java"
        "src/com/android/bluetooth/btservice/AdapterProperties.java"
        "src/com/android/bluetooth/btservice/AdapterService.java"
        "src/com/android/bluetooth/btservice/AdapterState.java"
        "src/com/android/bluetooth/btservice/BluetoothSocketManagerBinder.java"
        "src/com/android/bluetooth/btservice/BondStateMachine.java"
        "src/com/android/bluetooth/btservice/Config.java"
        "src/com/android/bluetooth/btservice/DiscoveringPackage.java"
        "src/com/android/bluetooth/btservice/JniCallbacks.java"
        "src/com/android/bluetooth/btservice/MetricsLogger.java"
        "src/com/android/bluetooth/btservice/PhonePolicy.java"
        "src/com/android/bluetooth/btservice/ProfileService.java"
        "src/com/android/bluetooth/btservice/RemoteDevices.java"
        "src/com/android/bluetooth/btservice/ServiceFactory.java"
        "src/com/android/bluetooth/btservice/SilenceDeviceManager.java"
        "src/com/android/bluetooth/btservice/bluetoothKeystore/BluetoothKeystoreNativeInterface.java"
        "src/com/android/bluetooth/btservice/bluetoothKeystore/BluetoothKeystoreService.java"
        "src/com/android/bluetooth/btservice/storage/CustomizedMetadataEntity.java"
        "src/com/android/bluetooth/btservice/storage/DatabaseManager.java"
        "src/com/android/bluetooth/btservice/storage/Metadata.java"
        "src/com/android/bluetooth/btservice/storage/MetadataDao.java"
        "src/com/android/bluetooth/btservice/storage/MetadataDatabase.java"
        "src/com/android/bluetooth/btservice/storage/ProfilePrioritiesEntity.java"
        "src/com/android/bluetooth/gatt/AdvertiseHelper.java"
        "src/com/android/bluetooth/gatt/AdvertiseManager.java"
        "src/com/android/bluetooth/gatt/AdvtFilterOnFoundOnLostInfo.java"
        "src/com/android/bluetooth/gatt/AppScanStats.java"
        "src/com/android/bluetooth/gatt/CallbackInfo.java"
        "src/com/android/bluetooth/gatt/ContextMap.java"
        "src/com/android/bluetooth/gatt/FilterParams.java"
        "src/com/android/bluetooth/gatt/GattDbElement.java"
        "src/com/android/bluetooth/gatt/GattDebugUtils.java"
        "src/com/android/bluetooth/gatt/GattService.java"
        "src/com/android/bluetooth/gatt/GattServiceConfig.java"
        "src/com/android/bluetooth/gatt/HandleMap.java"
        "src/com/android/bluetooth/gatt/PeriodicScanManager.java"
        "src/com/android/bluetooth/gatt/ScanClient.java"
        "src/com/android/bluetooth/gatt/ScanFilterQueue.java"
        "src/com/android/bluetooth/gatt/ScanManager.java"
        "src/com/android/bluetooth/hearingaid/HearingAidNativeInterface.java"
        "src/com/android/bluetooth/hearingaid/HearingAidService.java"
        "src/com/android/bluetooth/hearingaid/HearingAidStackEvent.java"
        "src/com/android/bluetooth/hearingaid/HearingAidStateMachine.java"
        "src/com/android/bluetooth/hfp/AtPhonebook.java"
        "src/com/android/bluetooth/hfp/BluetoothCmeError.java"
        "src/com/android/bluetooth/hfp/HeadsetAgIndicatorEnableState.java"
        "src/com/android/bluetooth/hfp/HeadsetCallState.java"
        "src/com/android/bluetooth/hfp/HeadsetClccResponse.java"
        "src/com/android/bluetooth/hfp/HeadsetDeviceState.java"
        "src/com/android/bluetooth/hfp/HeadsetHalConstants.java"
        "src/com/android/bluetooth/hfp/HeadsetMessageObject.java"
        "src/com/android/bluetooth/hfp/HeadsetNativeInterface.java"
        "src/com/android/bluetooth/hfp/HeadsetObjectsFactory.java"
        "src/com/android/bluetooth/hfp/HeadsetPhoneState.java"
        "src/com/android/bluetooth/hfp/HeadsetService.java"
        "src/com/android/bluetooth/hfp/HeadsetStackEvent.java"
        "src/com/android/bluetooth/hfp/HeadsetStateMachine.java"
        "src/com/android/bluetooth/hfp/HeadsetSystemInterface.java"
        "src/com/android/bluetooth/hfp/HeadsetVendorSpecificResultCode.java"
        "src/com/android/bluetooth/hfpclient/HeadsetClientHalConstants.java"
        "src/com/android/bluetooth/hfpclient/HeadsetClientService.java"
        "src/com/android/bluetooth/hfpclient/HeadsetClientStateMachine.java"
        "src/com/android/bluetooth/hfpclient/HeadsetClientStateMachineFactory.java"
        "src/com/android/bluetooth/hfpclient/NativeInterface.java"
        "src/com/android/bluetooth/hfpclient/StackEvent.java"
        "src/com/android/bluetooth/hfpclient/VendorCommandResponseProcessor.java"
        "src/com/android/bluetooth/hfpclient/connserv/HfpClientConference.java"
        "src/com/android/bluetooth/hfpclient/connserv/HfpClientConnection.java"
        "src/com/android/bluetooth/hfpclient/connserv/HfpClientConnectionService.java"
        "src/com/android/bluetooth/hfpclient/connserv/HfpClientDeviceBlock.java"
        "src/com/android/bluetooth/hid/HidDeviceNativeInterface.java"
        "src/com/android/bluetooth/hid/HidDeviceService.java"
        "src/com/android/bluetooth/hid/HidHostService.java"
        "src/com/android/bluetooth/map/BluetoothMapAccountItem.java"
        "src/com/android/bluetooth/map/BluetoothMapAccountLoader.java"
        "src/com/android/bluetooth/map/BluetoothMapAppObserver.java"
        "src/com/android/bluetooth/map/BluetoothMapAppParams.java"
        "src/com/android/bluetooth/map/BluetoothMapContent.java"
        "src/com/android/bluetooth/map/BluetoothMapContentObserver.java"
        "src/com/android/bluetooth/map/BluetoothMapConvoContactElement.java"
        "src/com/android/bluetooth/map/BluetoothMapConvoListing.java"
        "src/com/android/bluetooth/map/BluetoothMapConvoListingElement.java"
        "src/com/android/bluetooth/map/BluetoothMapFolderElement.java"
        "src/com/android/bluetooth/map/BluetoothMapMasInstance.java"
        "src/com/android/bluetooth/map/BluetoothMapMessageListing.java"
        "src/com/android/bluetooth/map/BluetoothMapMessageListingElement.java"
        "src/com/android/bluetooth/map/BluetoothMapObexServer.java"
        "src/com/android/bluetooth/map/BluetoothMapService.java"
        "src/com/android/bluetooth/map/BluetoothMapSettings.java"
        "src/com/android/bluetooth/map/BluetoothMapSettingsAdapter.java"
        "src/com/android/bluetooth/map/BluetoothMapSettingsDataHolder.java"
        "src/com/android/bluetooth/map/BluetoothMapSmsPdu.java"
        "src/com/android/bluetooth/map/BluetoothMapUtils.java"
        "src/com/android/bluetooth/map/BluetoothMapbMessage.java"
        "src/com/android/bluetooth/map/BluetoothMapbMessageEmail.java"
        "src/com/android/bluetooth/map/BluetoothMapbMessageMime.java"
        "src/com/android/bluetooth/map/BluetoothMapbMessageSms.java"
        "src/com/android/bluetooth/map/BluetoothMnsObexClient.java"
        "src/com/android/bluetooth/map/MapContact.java"
        "src/com/android/bluetooth/map/MmsFileProvider.java"
        "src/com/android/bluetooth/map/SmsMmsContacts.java"
        "src/com/android/bluetooth/mapclient/MapClientService.java"
        "src/com/android/bluetooth/mapclient/MapUtils.java"
        "src/com/android/bluetooth/mapclient/MasClient.java"
        "src/com/android/bluetooth/mapclient/MceStateMachine.java"
        "src/com/android/bluetooth/mapclient/MnsObexServer.java"
        "src/com/android/bluetooth/mapclient/MnsService.java"
        "src/com/android/bluetooth/mapclient/obex/Bmessage.java"
        "src/com/android/bluetooth/mapclient/obex/BmessageBuilder.java"
        "src/com/android/bluetooth/mapclient/obex/BmessageParser.java"
        "src/com/android/bluetooth/mapclient/obex/BmsgTokenizer.java"
        "src/com/android/bluetooth/mapclient/obex/EventReport.java"
        "src/com/android/bluetooth/mapclient/obex/FolderListing.java"
        "src/com/android/bluetooth/mapclient/obex/Message.java"
        "src/com/android/bluetooth/mapclient/obex/MessagesFilter.java"
        "src/com/android/bluetooth/mapclient/obex/MessagesListing.java"
        "src/com/android/bluetooth/mapclient/obex/ObexAppParameters.java"
        "src/com/android/bluetooth/mapclient/obex/ObexTime.java"
        "src/com/android/bluetooth/mapclient/obex/Request.java"
        "src/com/android/bluetooth/mapclient/obex/RequestGetFolderListing.java"
        "src/com/android/bluetooth/mapclient/obex/RequestGetMessage.java"
        "src/com/android/bluetooth/mapclient/obex/RequestGetMessagesListing.java"
        "src/com/android/bluetooth/mapclient/obex/RequestPushMessage.java"
        "src/com/android/bluetooth/mapclient/obex/RequestSetMessageStatus.java"
        "src/com/android/bluetooth/mapclient/obex/RequestSetNotificationRegistration.java"
        "src/com/android/bluetooth/mapclient/obex/RequestSetPath.java"
        "src/com/android/bluetooth/opp/BluetoothOppBatch.java"
        "src/com/android/bluetooth/opp/BluetoothOppBtEnableActivity.java"
        "src/com/android/bluetooth/opp/BluetoothOppBtEnablingActivity.java"
        "src/com/android/bluetooth/opp/BluetoothOppBtErrorActivity.java"
        "src/com/android/bluetooth/opp/BluetoothOppFileProvider.java"
        "src/com/android/bluetooth/opp/BluetoothOppHandoverReceiver.java"
        "src/com/android/bluetooth/opp/BluetoothOppIncomingFileConfirmActivity.java"
        "src/com/android/bluetooth/opp/BluetoothOppLauncherActivity.java"
        "src/com/android/bluetooth/opp/BluetoothOppManager.java"
        "src/com/android/bluetooth/opp/BluetoothOppNotification.java"
        "src/com/android/bluetooth/opp/BluetoothOppObexClientSession.java"
        "src/com/android/bluetooth/opp/BluetoothOppObexServerSession.java"
        "src/com/android/bluetooth/opp/BluetoothOppObexSession.java"
        "src/com/android/bluetooth/opp/BluetoothOppPreference.java"
        "src/com/android/bluetooth/opp/BluetoothOppProvider.java"
        "src/com/android/bluetooth/opp/BluetoothOppReceiveFileInfo.java"
        "src/com/android/bluetooth/opp/BluetoothOppReceiver.java"
        "src/com/android/bluetooth/opp/BluetoothOppSendFileInfo.java"
        "src/com/android/bluetooth/opp/BluetoothOppService.java"
        "src/com/android/bluetooth/opp/BluetoothOppShareInfo.java"
        "src/com/android/bluetooth/opp/BluetoothOppTransfer.java"
        "src/com/android/bluetooth/opp/BluetoothOppTransferActivity.java"
        "src/com/android/bluetooth/opp/BluetoothOppTransferAdapter.java"
        "src/com/android/bluetooth/opp/BluetoothOppTransferHistory.java"
        "src/com/android/bluetooth/opp/BluetoothOppTransferInfo.java"
        "src/com/android/bluetooth/opp/BluetoothOppUtility.java"
        "src/com/android/bluetooth/opp/BluetoothShare.java"
        "src/com/android/bluetooth/opp/Constants.java"
        "src/com/android/bluetooth/opp/TestActivity.java"
        "src/com/android/bluetooth/pan/BluetoothTetheringNetworkFactory.java"
        "src/com/android/bluetooth/pan/PanService.java"
        "src/com/android/bluetooth/pbap/BluetoothPbapActivity.java"
        "src/com/android/bluetooth/pbap/BluetoothPbapAuthenticator.java"
        "src/com/android/bluetooth/pbap/BluetoothPbapCallLogComposer.java"
        "src/com/android/bluetooth/pbap/BluetoothPbapConfig.java"
        "src/com/android/bluetooth/pbap/BluetoothPbapObexServer.java"
        "src/com/android/bluetooth/pbap/BluetoothPbapService.java"
        "src/com/android/bluetooth/pbap/BluetoothPbapUtils.java"
        "src/com/android/bluetooth/pbap/BluetoothPbapVcardManager.java"
        "src/com/android/bluetooth/pbap/PbapStateMachine.java"
        "src/com/android/bluetooth/pbapclient/AuthenticationService.java"
        "src/com/android/bluetooth/pbapclient/Authenticator.java"
        "src/com/android/bluetooth/pbapclient/BluetoothPbapObexAuthenticator.java"
        "src/com/android/bluetooth/pbapclient/BluetoothPbapObexTransport.java"
        "src/com/android/bluetooth/pbapclient/BluetoothPbapRequest.java"
        "src/com/android/bluetooth/pbapclient/BluetoothPbapRequestPullPhoneBook.java"
        "src/com/android/bluetooth/pbapclient/BluetoothPbapRequestPullPhoneBookSize.java"
        "src/com/android/bluetooth/pbapclient/BluetoothPbapVcardList.java"
        "src/com/android/bluetooth/pbapclient/CallLogPullRequest.java"
        "src/com/android/bluetooth/pbapclient/ObexAppParameters.java"
        "src/com/android/bluetooth/pbapclient/PbapClientConnectionHandler.java"
        "src/com/android/bluetooth/pbapclient/PbapClientService.java"
        "src/com/android/bluetooth/pbapclient/PbapClientStateMachine.java"
        "src/com/android/bluetooth/pbapclient/PhonebookEntry.java"
        "src/com/android/bluetooth/pbapclient/PhonebookPullRequest.java"
        "src/com/android/bluetooth/pbapclient/PullRequest.java"
        "src/com/android/bluetooth/pbapclient/Utils.java"
        "src/com/android/bluetooth/sap/SapMessage.java"
        "src/com/android/bluetooth/sap/SapRilReceiver.java"
        "src/com/android/bluetooth/sap/SapServer.java"
        "src/com/android/bluetooth/sap/SapService.java"
        "src/com/android/bluetooth/sdp/SdpManager.java"
        "src/com/android/bluetooth/statemachine/IState.java"
        "src/com/android/bluetooth/statemachine/State.java"
        "src/com/android/bluetooth/statemachine/StateMachine.java"
        "src/com/android/bluetooth/util/DevicePolicyUtils.java"
        "src/com/android/bluetooth/util/GsmAlphabet.java"
        "src/com/android/bluetooth/util/Interop.java"
        "src/com/android/bluetooth/util/NumberUtils.java"
        ":statslog-bluetooth-java-gen"
    ];
    platform_apis = true;
    certificate = "platform";

    jni_libs = ["libbluetooth_jni"];
    libs = [
        "javax.obex"
        "services.net"
    ];
    static_libs = [
        "com.android.vcard"
        "bluetooth.mapsapi"
        "sap-api-java-static"
        "services.net"
        "libprotobuf-java-lite"
        "bluetooth-protos-lite"
        "androidx.core_core"
        "androidx.legacy_legacy-support-v4"
        "androidx.lifecycle_lifecycle-livedata"
        "androidx.room_room-runtime"
        "guava"
    ];

    plugins = [
        "androidx.room_room-compiler-plugin"
    ];

    #  Add in path to Bluetooth directory because local path does not exist
    javacflags = ["-Aroom.schemaLocation=packages/apps/Bluetooth/tests/unit/src/com/android/bluetooth/btservice/storage/schemas"];

    optimize = {
        enabled = false;
    };
    required = ["libbluetooth"];
    apex_available = [
        "//apex_available:platform"
        "com.android.bluetooth.updatable"
    ];
};

statslog-bluetooth-java-gen = genrule {
    name = "statslog-bluetooth-java-gen";
    tools = ["stats-log-api-gen"];
    cmd = "$(location stats-log-api-gen) --java $(out) --module bluetooth" +
        " --javaPackage com.android.bluetooth --javaClass BluetoothStatsLog --worksource";
    out = ["com/android/bluetooth/BluetoothStatsLog.java"];
};

in { inherit "bluetooth.mapsapi" Bluetooth libbluetooth_jni statslog-bluetooth-java-gen; }
