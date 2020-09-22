{ aidl_interface }:
let

"android.hardware.keymaster" = aidl_interface {
    name = "android.hardware.keymaster";
    vendor_available = true;
    srcs = [
        "android/hardware/keymaster/HardwareAuthToken.aidl"
        "android/hardware/keymaster/HardwareAuthenticatorType.aidl"
        "android/hardware/keymaster/SecurityLevel.aidl"
        "android/hardware/keymaster/Timestamp.aidl"
        "android/hardware/keymaster/VerificationToken.aidl"
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

in { inherit "android.hardware.keymaster"; }
