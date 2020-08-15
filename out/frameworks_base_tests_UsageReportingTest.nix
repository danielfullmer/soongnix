{ android_test }:
let

UsageReportingTest = android_test {
    name = "UsageReportingTest";
    #  Only compile source java files in this apk.
    srcs = ["src/com/android/tests/usagereporter/UsageReporterActivity.java"];
    static_libs = ["androidx.legacy_legacy-support-v4"];
    certificate = "platform";
    platform_apis = true;
};

in { inherit UsageReportingTest; }
