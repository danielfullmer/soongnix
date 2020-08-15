{ android_test }:
let

EffectsTest = android_test {
    name = "EffectsTest";
    srcs = [
        "src/com/android/effectstest/BassBoostTest.java"
        "src/com/android/effectstest/EffectParameter.java"
        "src/com/android/effectstest/EffectsTest.java"
        "src/com/android/effectstest/EnvReverbTest.java"
        "src/com/android/effectstest/EqualizerTest.java"
        "src/com/android/effectstest/PresetReverbTest.java"
        "src/com/android/effectstest/SimplePlayer.java"
        "src/com/android/effectstest/VirtualizerTest.java"
        "src/com/android/effectstest/VisualizerTest.java"
    ];
    platform_apis = true;
};

in { inherit EffectsTest; }
