{ android_test }:
let

UsageStatsTest = android_test {
    name = "UsageStatsTest";
    #  Only compile source java files in this apk.
    srcs = ["src/**/*.java"];
    static_libs = ["androidx.legacy_legacy-support-v4"];
    certificate = "platform";
    platform_apis = true;
};

in { inherit UsageStatsTest; }
