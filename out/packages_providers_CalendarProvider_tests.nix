{ android_test }:
let

CalendarProviderTests = android_test {
    name = "CalendarProviderTests";
    #  Include all test java files.
    srcs = [
        "src/com/android/providers/calendar/CalendarCacheTest.java"
        "src/com/android/providers/calendar/CalendarDatabaseHelperTest.java"
        "src/com/android/providers/calendar/CalendarProvider2ForTesting.java"
        "src/com/android/providers/calendar/CalendarProvider2Test.java"
        "src/com/android/providers/calendar/CalendarProviderBroadcastReceiverTest.java"
        "src/com/android/providers/calendar/CalendarSanityCheckerTest.java"
        "src/com/android/providers/calendar/ICalendarTest.java"
        "src/com/android/providers/calendar/MockCrossProfileCalendarHelper.java"
        "src/com/android/providers/calendar/RecurrenceSetTest.java"
        "src/com/android/providers/calendar/enterprise/CrossProfileCalendarHelperTest.java"
    ];
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
