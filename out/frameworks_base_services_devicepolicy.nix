{ java_library_static }:
let

"services.devicepolicy" = java_library_static {
    name = "services.devicepolicy";
    srcs = [
        "java/com/android/server/devicepolicy/AbUpdateInstaller.java"
        "java/com/android/server/devicepolicy/BaseIDevicePolicyManager.java"
        "java/com/android/server/devicepolicy/CertificateMonitor.java"
        "java/com/android/server/devicepolicy/CryptoTestHelper.java"
        "java/com/android/server/devicepolicy/DeviceAdminServiceController.java"
        "java/com/android/server/devicepolicy/DevicePolicyCacheImpl.java"
        "java/com/android/server/devicepolicy/DevicePolicyConstants.java"
        "java/com/android/server/devicepolicy/DevicePolicyManagerService.java"
        "java/com/android/server/devicepolicy/NetworkLogger.java"
        "java/com/android/server/devicepolicy/NetworkLoggingHandler.java"
        "java/com/android/server/devicepolicy/NonAbUpdateInstaller.java"
        "java/com/android/server/devicepolicy/OverlayPackagesProvider.java"
        "java/com/android/server/devicepolicy/Owners.java"
        "java/com/android/server/devicepolicy/RemoteBugreportUtils.java"
        "java/com/android/server/devicepolicy/SecurityLogMonitor.java"
        "java/com/android/server/devicepolicy/TransferOwnershipMetadataManager.java"
        "java/com/android/server/devicepolicy/UpdateInstaller.java"
    ];

    libs = [
        "services.core"
    ];
};

in { inherit "services.devicepolicy"; }
