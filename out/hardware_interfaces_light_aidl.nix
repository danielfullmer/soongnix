{ aidl_interface }:
let

"android.hardware.light" = aidl_interface {
    name = "android.hardware.light";
    vendor_available = true;
    srcs = [
        "android/hardware/light/BrightnessMode.aidl"
        "android/hardware/light/FlashMode.aidl"
        "android/hardware/light/HwLight.aidl"
        "android/hardware/light/HwLightState.aidl"
        "android/hardware/light/ILights.aidl"
        "android/hardware/light/LightType.aidl"
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
    versions = ["1"];
};

in { inherit "android.hardware.light"; }
