{ android_app }:
let

MusicFX = android_app {
    name = "MusicFX";
    srcs = ["src/**/*.java"];
    libs = ["framework"];
    platform_apis = true;
    privileged = true;
};

in { inherit MusicFX; }
