{ android_app }:
let

MtpService = android_app {
    name = "MtpService";

    static_libs = [
        "androidx.appcompat_appcompat"
    ];
    srcs = [
        "src/com/android/mtp/BusyDeviceException.java"
        "src/com/android/mtp/DocumentLoader.java"
        "src/com/android/mtp/Identifier.java"
        "src/com/android/mtp/Mapper.java"
        "src/com/android/mtp/MtpDatabase.java"
        "src/com/android/mtp/MtpDatabaseConstants.java"
        "src/com/android/mtp/MtpDeviceRecord.java"
        "src/com/android/mtp/MtpDocumentsProvider.java"
        "src/com/android/mtp/MtpDocumentsService.java"
        "src/com/android/mtp/MtpFileWriter.java"
        "src/com/android/mtp/MtpManager.java"
        "src/com/android/mtp/MtpReceiver.java"
        "src/com/android/mtp/MtpRoot.java"
        "src/com/android/mtp/MtpService.java"
        "src/com/android/mtp/PipeManager.java"
        "src/com/android/mtp/ReceiverActivity.java"
        "src/com/android/mtp/RootScanner.java"
        "src/com/android/mtp/SendObjectInfoFailure.java"
        "src/com/android/mtp/ServiceIntentSender.java"
        "src/com/android/mtp/UsbIntentReceiver.java"
        "src/com/android/mtp/annotations/UsedByNative.java"
    ];
    platform_apis = true;
    certificate = "media";
    privileged = true;
    optimize = {
        proguard_flags_files = ["proguard.flags"];
    };
};

in { inherit MtpService; }
