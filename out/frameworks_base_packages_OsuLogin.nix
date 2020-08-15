{ android_app }:
let

OsuLogin = android_app {
    name = "OsuLogin";
    static_libs = ["androidx.legacy_legacy-support-v4"];
    resource_dirs = ["res"];
    srcs = ["src/com/android/hotspot2/osu/OsuLoginActivity.java"];
    platform_apis = true;
    certificate = "platform";
};

in { inherit OsuLogin; }
