{ aidl_interface }:
let

"android.hardware.vibrator" = aidl_interface {
    name = "android.hardware.vibrator";
    vendor_available = true;
    srcs = [
        "android/hardware/vibrator/CompositeEffect.aidl"
        "android/hardware/vibrator/CompositePrimitive.aidl"
        "android/hardware/vibrator/Effect.aidl"
        "android/hardware/vibrator/EffectStrength.aidl"
        "android/hardware/vibrator/IVibrator.aidl"
        "android/hardware/vibrator/IVibratorCallback.aidl"
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

in { inherit "android.hardware.vibrator"; }
