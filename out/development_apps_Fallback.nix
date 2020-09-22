{ android_app }:
let

Fallback = android_app {
    name = "Fallback";
    srcs = ["src/com/android/fallback/Fallback.java"];
    sdk_version = "current";
};

in { inherit Fallback; }
