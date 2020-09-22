{ android_app, android_app_certificate }:
let

OsuLogin = android_app {
    name = "OsuLogin";
    defaults = ["wifi-module-sdk-version-defaults"];
    static_libs = ["androidx.legacy_legacy-support-v4"];
    resource_dirs = ["res"];
    srcs = ["src/com/android/hotspot2/osulogin/OsuLoginActivity.java"];
    sdk_version = "system_current";
    certificate = ":com.android.hotspot2.osulogin.certificate";
    apex_available = [
        "com.android.wifi"
        "test_com.android.wifi"
    ];
};

"com.android.hotspot2.osulogin.certificate" = android_app_certificate {
    name = "com.android.hotspot2.osulogin.certificate";
    certificate = "certs/com.android.hotspot2.osulogin";
};

in { inherit "com.android.hotspot2.osulogin.certificate" OsuLogin; }
