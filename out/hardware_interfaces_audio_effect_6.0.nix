{ hidl_interface }:
let

#  This file is autogenerated by hidl-gen -Landroidbp.

"android.hardware.audio.effect@6.0" = hidl_interface {
    name = "android.hardware.audio.effect@6.0";
    root = "android.hardware";
    vndk = {
        enabled = true;
    };
    srcs = [
        "types.hal"
        "IAcousticEchoCancelerEffect.hal"
        "IAutomaticGainControlEffect.hal"
        "IBassBoostEffect.hal"
        "IDownmixEffect.hal"
        "IEffect.hal"
        "IEffectBufferProviderCallback.hal"
        "IEffectsFactory.hal"
        "IEnvironmentalReverbEffect.hal"
        "IEqualizerEffect.hal"
        "ILoudnessEnhancerEffect.hal"
        "INoiseSuppressionEffect.hal"
        "IPresetReverbEffect.hal"
        "IVirtualizerEffect.hal"
        "IVisualizerEffect.hal"
    ];
    interfaces = [
        "android.hardware.audio.common@6.0"
        "android.hidl.base@1.0"
        "android.hidl.safe_union@1.0"
    ];
    gen_java = false;
    gen_java_constants = true;
};

in { inherit "android.hardware.audio.effect@6.0"; }