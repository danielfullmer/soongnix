{ android_test }:
let

CalendarProviderTests = android_test {
    name = "CalendarProviderTests";
    #  Include all test java files.
    srcs = ["src/**/*.java"];
    platform_apis = true;
    test_suites = ["device-tests"];
    static_libs = [
        "calendar-common"
        "junit"
    ];
    libs = [
        "ext"
        "android.test.runner"
        "android.test.base"
        "android.test.mock"
    ];
    instrumentation_for = "CalendarProvider";
};

in { inherit CalendarProviderTests; }
