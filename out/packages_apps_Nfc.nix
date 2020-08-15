{ android_app }:
let

#  NCI Configuration
NfcNci = android_app {
    name = "NfcNci";
    srcs = [
        "src/com/android/nfc/BeamShareActivity.java"
        "src/com/android/nfc/ConfirmConnectToWifiNetworkActivity.java"
        "src/com/android/nfc/DeviceHost.java"
        "src/com/android/nfc/DtaServiceConnector.java"
        "src/com/android/nfc/ForegroundUtils.java"
        "src/com/android/nfc/LlcpException.java"
        "src/com/android/nfc/LlcpPacket.java"
        "src/com/android/nfc/NfcApplication.java"
        "src/com/android/nfc/NfcBackupAgent.java"
        "src/com/android/nfc/NfcBootCompletedReceiver.java"
        "src/com/android/nfc/NfcDiscoveryParameters.java"
        "src/com/android/nfc/NfcDispatcher.java"
        "src/com/android/nfc/NfcPermissions.java"
        "src/com/android/nfc/NfcRootActivity.java"
        "src/com/android/nfc/NfcService.java"
        "src/com/android/nfc/NfcUnlockManager.java"
        "src/com/android/nfc/NfcWifiProtectedSetup.java"
        "src/com/android/nfc/P2pEventManager.java"
        "src/com/android/nfc/P2pLinkManager.java"
        "src/com/android/nfc/RegisteredComponentCache.java"
        "src/com/android/nfc/ScreenStateHelper.java"
        "src/com/android/nfc/TechListChooserActivity.java"
        "src/com/android/nfc/beam/BeamManager.java"
        "src/com/android/nfc/beam/BeamReceiveService.java"
        "src/com/android/nfc/beam/BeamSendService.java"
        "src/com/android/nfc/beam/BeamStatusReceiver.java"
        "src/com/android/nfc/beam/BeamTransferManager.java"
        "src/com/android/nfc/beam/BeamTransferRecord.java"
        "src/com/android/nfc/beam/BluetoothOppHandover.java"
        "src/com/android/nfc/beam/FireflyRenderer.java"
        "src/com/android/nfc/beam/MimeTypeUtil.java"
        "src/com/android/nfc/beam/SendUi.java"
        "src/com/android/nfc/cardemulation/AidRoutingManager.java"
        "src/com/android/nfc/cardemulation/AppChooserActivity.java"
        "src/com/android/nfc/cardemulation/CardEmulationManager.java"
        "src/com/android/nfc/cardemulation/EnabledNfcFServices.java"
        "src/com/android/nfc/cardemulation/HostEmulationManager.java"
        "src/com/android/nfc/cardemulation/HostNfcFEmulationManager.java"
        "src/com/android/nfc/cardemulation/PreferredServices.java"
        "src/com/android/nfc/cardemulation/RegisteredAidCache.java"
        "src/com/android/nfc/cardemulation/RegisteredNfcFServicesCache.java"
        "src/com/android/nfc/cardemulation/RegisteredServicesCache.java"
        "src/com/android/nfc/cardemulation/RegisteredT3tIdentifiersCache.java"
        "src/com/android/nfc/cardemulation/SystemCodeRoutingManager.java"
        "src/com/android/nfc/cardemulation/TapAgainDialog.java"
        "src/com/android/nfc/echoserver/EchoServer.java"
        "src/com/android/nfc/handover/BluetoothPeripheralHandover.java"
        "src/com/android/nfc/handover/ConfirmConnectActivity.java"
        "src/com/android/nfc/handover/HandoverClient.java"
        "src/com/android/nfc/handover/HandoverDataParser.java"
        "src/com/android/nfc/handover/HandoverServer.java"
        "src/com/android/nfc/handover/PeripheralHandoverService.java"
        "src/com/android/nfc/ndefpush/NdefPushClient.java"
        "src/com/android/nfc/ndefpush/NdefPushProtocol.java"
        "src/com/android/nfc/ndefpush/NdefPushServer.java"
        "src/com/android/nfc/snep/SnepClient.java"
        "src/com/android/nfc/snep/SnepException.java"
        "src/com/android/nfc/snep/SnepMessage.java"
        "src/com/android/nfc/snep/SnepMessenger.java"
        "src/com/android/nfc/snep/SnepServer.java"
        "src/com/android/nfc/sneptest/DtaSnepClient.java"
        "src/com/android/nfc/sneptest/ExtDtaSnepServer.java"
        "nci/src/com/android/nfc/dhimpl/NativeLlcpConnectionlessSocket.java"
        "nci/src/com/android/nfc/dhimpl/NativeLlcpServiceSocket.java"
        "nci/src/com/android/nfc/dhimpl/NativeLlcpSocket.java"
        "nci/src/com/android/nfc/dhimpl/NativeNfcManager.java"
        "nci/src/com/android/nfc/dhimpl/NativeNfcTag.java"
        "nci/src/com/android/nfc/dhimpl/NativeP2pDevice.java"
    ];
    platform_apis = true;
    certificate = "platform";
    jni_libs = ["libnfc_nci_jni"];
    static_libs = ["androidx.legacy_legacy-support-v4"];
    optimize = {
        enabled = false;
    };
};

in { inherit NfcNci; }
