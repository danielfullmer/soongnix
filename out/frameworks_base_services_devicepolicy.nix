{ filegroup, java_library_static }:
let

"services.devicepolicy-sources" = filegroup {
    name = "services.devicepolicy-sources";
    srcs = [
        "java/com/android/server/devicepolicy/AbUpdateInstaller.java"
        "java/com/android/server/devicepolicy/BaseIDevicePolicyManager.java"
        "java/com/android/server/devicepolicy/CertificateMonitor.java"
        "java/com/android/server/devicepolicy/CryptoTestHelper.java"
        "java/com/android/server/devicepolicy/DeviceAdminServiceController.java"
        "java/com/android/server/devicepolicy/DevicePolicyCacheImpl.java"
        "java/com/android/server/devicepolicy/DevicePolicyConstants.java"
        "java/com/android/server/devicepolicy/DevicePolicyManagerService.java"
        "java/com/android/server/devicepolicy/DeviceStateCacheImpl.java"
        "java/com/android/server/devicepolicy/NetworkLogger.java"
        "java/com/android/server/devicepolicy/NetworkLoggingHandler.java"
        "java/com/android/server/devicepolicy/NonAbUpdateInstaller.java"
        "java/com/android/server/devicepolicy/OverlayPackagesProvider.java"
        "java/com/android/server/devicepolicy/Owners.java"
        "java/com/android/server/devicepolicy/PersonalAppsSuspensionHelper.java"
        "java/com/android/server/devicepolicy/RemoteBugreportUtils.java"
        "java/com/android/server/devicepolicy/SecurityLogMonitor.java"
        "java/com/android/server/devicepolicy/TransferOwnershipMetadataManager.java"
        "java/com/android/server/devicepolicy/UpdateInstaller.java"
    ];
    path = "java";
    visibility = ["//frameworks/base/services"];
};

"services.devicepolicy" = java_library_static {
    name = "services.devicepolicy";
    defaults = ["services_defaults"];
    srcs = [":services.devicepolicy-sources"];

    libs = [
        "services.core"
        "app-compat-annotations"
    ];
};

in { inherit "services.devicepolicy" "services.devicepolicy-sources"; }
