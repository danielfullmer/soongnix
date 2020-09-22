{ aidl_interface }:
let

"android.hardware.identity" = aidl_interface {
    name = "android.hardware.identity";
    vendor_available = true;
    srcs = [
        "android/hardware/identity/Certificate.aidl"
        "android/hardware/identity/CipherSuite.aidl"
        "android/hardware/identity/HardwareInformation.aidl"
        "android/hardware/identity/IIdentityCredential.aidl"
        "android/hardware/identity/IIdentityCredentialStore.aidl"
        "android/hardware/identity/IWritableIdentityCredential.aidl"
        "android/hardware/identity/RequestDataItem.aidl"
        "android/hardware/identity/RequestNamespace.aidl"
        "android/hardware/identity/SecureAccessControlProfile.aidl"
    ];
    imports = [
        "android.hardware.keymaster"
    ];
    stability = "vintf";
    backend = {
        java = {
            platform_apis = true;
        };
        ndk = {
            vndk = {
                enabled = true;
            };
        };
    };
    versions = [
        "1"
        "2"
    ];
};

in { inherit "android.hardware.identity"; }
