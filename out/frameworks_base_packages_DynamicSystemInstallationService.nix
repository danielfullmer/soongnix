{ android_app }:
let

DynamicSystemInstallationService = android_app {
    name = "DynamicSystemInstallationService";

    srcs = [
        "src/com/android/dynsystem/BootCompletedReceiver.java"
        "src/com/android/dynsystem/DynamicSystemInstallationService.java"
        "src/com/android/dynsystem/InstallationAsyncTask.java"
        "src/com/android/dynsystem/KeyRevocationList.java"
        "src/com/android/dynsystem/SparseInputStream.java"
        "src/com/android/dynsystem/VerificationActivity.java"
    ];
    resource_dirs = ["res"];

    certificate = "platform";
    privileged = true;
    platform_apis = true;

    optimize = {
        enabled = false;
    };
};

in { inherit DynamicSystemInstallationService; }
