{ android_app }:
let

MediaProvider = android_app {
    name = "MediaProvider";

    manifest = "AndroidManifest.xml";

    resource_dirs = [
        "res"
    ];

    srcs = [
        "src/com/android/providers/media/IMtpService.aidl"
        "src/com/android/providers/media/CheckedListItem.java"
        "src/com/android/providers/media/IdleService.java"
        "src/com/android/providers/media/LocalCallingIdentity.java"
        "src/com/android/providers/media/MediaDocumentsProvider.java"
        "src/com/android/providers/media/MediaProvider.java"
        "src/com/android/providers/media/MediaReceiver.java"
        "src/com/android/providers/media/MediaScannerService.java"
        "src/com/android/providers/media/MediaService.java"
        "src/com/android/providers/media/MediaUpgradeReceiver.java"
        "src/com/android/providers/media/MtpReceiver.java"
        "src/com/android/providers/media/MtpService.java"
        "src/com/android/providers/media/PermissionActivity.java"
        "src/com/android/providers/media/PrioritizedFutureTask.java"
        "src/com/android/providers/media/RingtoneOverlayService.java"
        "src/com/android/providers/media/RingtonePickerActivity.java"
        "src/com/android/providers/media/scan/LegacyMediaScanner.java"
        "src/com/android/providers/media/scan/MediaScanner.java"
        "src/com/android/providers/media/scan/ModernMediaScanner.java"
        "src/com/android/providers/media/scan/PlaylistResolver.java"
        "src/com/android/providers/media/util/CachedSupplier.java"
        "src/com/android/providers/media/util/IsoInterface.java"
        "src/com/android/providers/media/util/XmpInterface.java"
    ];

    optimize = {
        proguard_flags_files = ["proguard.flags"];
    };

    platform_apis = true;

    certificate = "media";

    privileged = true;
};

in { inherit MediaProvider; }
