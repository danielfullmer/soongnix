{ filegroup, java_library_static }:
let

"services.usb-sources" = filegroup {
    name = "services.usb-sources";
    srcs = [
        "java/com/android/server/usb/MtpNotificationManager.java"
        "java/com/android/server/usb/UsbAlsaDevice.java"
        "java/com/android/server/usb/UsbAlsaJackDetector.java"
        "java/com/android/server/usb/UsbAlsaManager.java"
        "java/com/android/server/usb/UsbDeviceManager.java"
        "java/com/android/server/usb/UsbHandlerManager.java"
        "java/com/android/server/usb/UsbHostManager.java"
        "java/com/android/server/usb/UsbMidiDevice.java"
        "java/com/android/server/usb/UsbPermissionManager.java"
        "java/com/android/server/usb/UsbPortManager.java"
        "java/com/android/server/usb/UsbProfileGroupSettingsManager.java"
        "java/com/android/server/usb/UsbSerialReader.java"
        "java/com/android/server/usb/UsbService.java"
        "java/com/android/server/usb/UsbSettingsManager.java"
        "java/com/android/server/usb/UsbUserPermissionManager.java"
        "java/com/android/server/usb/UsbUserSettingsManager.java"
        "java/com/android/server/usb/descriptors/ByteStream.java"
        "java/com/android/server/usb/descriptors/Usb10ACHeader.java"
        "java/com/android/server/usb/descriptors/Usb10ACInputTerminal.java"
        "java/com/android/server/usb/descriptors/Usb10ACMixerUnit.java"
        "java/com/android/server/usb/descriptors/Usb10ACOutputTerminal.java"
        "java/com/android/server/usb/descriptors/Usb10ASFormatI.java"
        "java/com/android/server/usb/descriptors/Usb10ASFormatII.java"
        "java/com/android/server/usb/descriptors/Usb10ASGeneral.java"
        "java/com/android/server/usb/descriptors/Usb20ACHeader.java"
        "java/com/android/server/usb/descriptors/Usb20ACInputTerminal.java"
        "java/com/android/server/usb/descriptors/Usb20ACMixerUnit.java"
        "java/com/android/server/usb/descriptors/Usb20ACOutputTerminal.java"
        "java/com/android/server/usb/descriptors/Usb20ASFormatI.java"
        "java/com/android/server/usb/descriptors/Usb20ASFormatII.java"
        "java/com/android/server/usb/descriptors/Usb20ASFormatIIEx.java"
        "java/com/android/server/usb/descriptors/Usb20ASFormatIII.java"
        "java/com/android/server/usb/descriptors/Usb20ASGeneral.java"
        "java/com/android/server/usb/descriptors/UsbACAudioControlEndpoint.java"
        "java/com/android/server/usb/descriptors/UsbACAudioStreamEndpoint.java"
        "java/com/android/server/usb/descriptors/UsbACEndpoint.java"
        "java/com/android/server/usb/descriptors/UsbACFeatureUnit.java"
        "java/com/android/server/usb/descriptors/UsbACHeaderInterface.java"
        "java/com/android/server/usb/descriptors/UsbACInterface.java"
        "java/com/android/server/usb/descriptors/UsbACInterfaceUnparsed.java"
        "java/com/android/server/usb/descriptors/UsbACMidiEndpoint.java"
        "java/com/android/server/usb/descriptors/UsbACMixerUnit.java"
        "java/com/android/server/usb/descriptors/UsbACSelectorUnit.java"
        "java/com/android/server/usb/descriptors/UsbACTerminal.java"
        "java/com/android/server/usb/descriptors/UsbASFormat.java"
        "java/com/android/server/usb/descriptors/UsbBinaryParser.java"
        "java/com/android/server/usb/descriptors/UsbConfigDescriptor.java"
        "java/com/android/server/usb/descriptors/UsbDescriptor.java"
        "java/com/android/server/usb/descriptors/UsbDescriptorParser.java"
        "java/com/android/server/usb/descriptors/UsbDeviceDescriptor.java"
        "java/com/android/server/usb/descriptors/UsbEndpointDescriptor.java"
        "java/com/android/server/usb/descriptors/UsbHIDDescriptor.java"
        "java/com/android/server/usb/descriptors/UsbInterfaceAssoc.java"
        "java/com/android/server/usb/descriptors/UsbInterfaceDescriptor.java"
        "java/com/android/server/usb/descriptors/UsbMSMidiHeader.java"
        "java/com/android/server/usb/descriptors/UsbMSMidiInputJack.java"
        "java/com/android/server/usb/descriptors/UsbMSMidiOutputJack.java"
        "java/com/android/server/usb/descriptors/UsbTerminalTypes.java"
        "java/com/android/server/usb/descriptors/UsbUnknown.java"
        "java/com/android/server/usb/descriptors/UsbVCEndpoint.java"
        "java/com/android/server/usb/descriptors/UsbVCHeader.java"
        "java/com/android/server/usb/descriptors/UsbVCHeaderInterface.java"
        "java/com/android/server/usb/descriptors/UsbVCInputTerminal.java"
        "java/com/android/server/usb/descriptors/UsbVCInterface.java"
        "java/com/android/server/usb/descriptors/UsbVCOutputTerminal.java"
        "java/com/android/server/usb/descriptors/UsbVCProcessingUnit.java"
        "java/com/android/server/usb/descriptors/UsbVCSelectorUnit.java"
        "java/com/android/server/usb/descriptors/report/HTMLReportCanvas.java"
        "java/com/android/server/usb/descriptors/report/ReportCanvas.java"
        "java/com/android/server/usb/descriptors/report/Reporting.java"
        "java/com/android/server/usb/descriptors/report/TextReportCanvas.java"
        "java/com/android/server/usb/descriptors/report/UsbStrings.java"
        "java/com/android/server/usb/descriptors/tree/UsbDescriptorsACInterfaceNode.java"
        "java/com/android/server/usb/descriptors/tree/UsbDescriptorsConfigNode.java"
        "java/com/android/server/usb/descriptors/tree/UsbDescriptorsDeviceNode.java"
        "java/com/android/server/usb/descriptors/tree/UsbDescriptorsEndpointNode.java"
        "java/com/android/server/usb/descriptors/tree/UsbDescriptorsInterfaceNode.java"
        "java/com/android/server/usb/descriptors/tree/UsbDescriptorsTree.java"
        "java/com/android/server/usb/descriptors/tree/UsbDescriptorsTreeNode.java"
    ];
    path = "java";
    visibility = ["//frameworks/base/services"];
};

"services.usb" = java_library_static {
    name = "services.usb";
    defaults = ["services_defaults"];
    srcs = [":services.usb-sources"];

    libs = [
        "services.core"
        "android.hidl.manager-V1.0-java"
    ];

    static_libs = [
        "android.hardware.usb-V1.0-java"
        "android.hardware.usb-V1.1-java"
        "android.hardware.usb-V1.2-java"
        "android.hardware.usb.gadget-V1.0-java"
        "android.hardware.usb.gadget-V1.1-java"
    ];
};

in { inherit "services.usb" "services.usb-sources"; }
