{ android_app }:
let

JETBoy = android_app {
    name = "JETBoy";
    srcs = [
        "src/com/example/android/jetboy/Asteroid.java"
        "src/com/example/android/jetboy/Explosion.java"
        "src/com/example/android/jetboy/JetBoy.java"
        "src/com/example/android/jetboy/JetBoyView.java"
    ];
    sdk_version = "current";
    dex_preopt = {
        enabled = false;
    };
};

in { inherit JETBoy; }
