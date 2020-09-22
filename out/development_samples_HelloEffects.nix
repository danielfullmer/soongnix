{ android_app }:
let

HelloEffects = android_app {
    name = "HelloEffects";
    srcs = [
        "src/com/example/android/mediafx/GLToolbox.java"
        "src/com/example/android/mediafx/HelloEffects.java"
        "src/com/example/android/mediafx/TextureRenderer.java"
    ];
    sdk_version = "current";
    dex_preopt = {
        enabled = false;
    };
};

in { inherit HelloEffects; }
