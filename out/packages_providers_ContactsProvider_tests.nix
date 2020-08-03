{ android_test }:
let

ContactsProviderTests = android_test {
    name = "ContactsProviderTests";
    static_libs = [
        "ContactsProviderTestUtils"
        "androidx.test.rules"
        "mockito-target-minus-junit4"
    ];
    libs = [
        "android.test.runner"
        "android.test.base"
        "android.test.mock"
    ];

    #  Only compile source java files in this apk.
    srcs = ["src/**/*.java"];
    platform_apis = true;
    test_suites = ["device-tests"];
    instrumentation_for = "ContactsProvider";
    certificate = "shared";
    optimize = {
        enabled = false;
    };
};

in { inherit ContactsProviderTests; }
