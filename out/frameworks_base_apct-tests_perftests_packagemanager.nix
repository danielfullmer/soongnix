{ android_test }:
let

PackageManagerPerfTests = android_test {
    name = "PackageManagerPerfTests";

    srcs = ["src/android/os/PackageManagerPerfTest.java"];

    static_libs = [
        "platform-compat-test-rules"
        "androidx.appcompat_appcompat"
        "androidx.test.rules"
        "androidx.test.ext.junit"
        "androidx.annotation_annotation"
        "apct-perftests-utils"
    ];

    libs = ["android.test.base"];

    platform_apis = true;

    test_suites = ["device-tests"];

};

in { inherit PackageManagerPerfTests; }
