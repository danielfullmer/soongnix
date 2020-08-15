{ android_app }:
let

ExternalStorageProvider = android_app {
    name = "ExternalStorageProvider";

    manifest = "AndroidManifest.xml";

    resource_dirs = [
        "res"
    ];

    srcs = [
        "src/com/android/externalstorage/ExternalStorageProvider.java"
        "src/com/android/externalstorage/MountReceiver.java"
        "src/com/android/externalstorage/TestDocumentsProvider.java"
    ];

    platform_apis = true;

    certificate = "platform";

    privileged = true;
};

in { inherit ExternalStorageProvider; }
