{ android_test }:
let

# ########################################################################
#  Build FrameworksUiServicesTests package
# ########################################################################

FrameworksUiServicesTests = android_test {
    name = "FrameworksUiServicesTests";

    #  Include test java files
    srcs = [
        "src/com/android/frameworks/tests/uiservices/DummyProvider.java"
        "src/com/android/server/UiModeManagerServiceTest.java"
        "src/com/android/server/UiServiceTestCase.java"
        "src/com/android/server/notification/AlertRateLimiterTest.java"
        "src/com/android/server/notification/BadgeExtractorTest.java"
        "src/com/android/server/notification/BubbleExtractorTest.java"
        "src/com/android/server/notification/BuzzBeepBlinkTest.java"
        "src/com/android/server/notification/CriticalNotificationExtractorTest.java"
        "src/com/android/server/notification/GlobalSortKeyComparatorTest.java"
        "src/com/android/server/notification/GroupHelperTest.java"
        "src/com/android/server/notification/ImportanceExtractorTest.java"
        "src/com/android/server/notification/ManagedServicesTest.java"
        "src/com/android/server/notification/NotificationAdjustmentExtractorTest.java"
        "src/com/android/server/notification/NotificationAssistantsTest.java"
        "src/com/android/server/notification/NotificationChannelExtractorTest.java"
        "src/com/android/server/notification/NotificationChannelTest.java"
        "src/com/android/server/notification/NotificationComparatorTest.java"
        "src/com/android/server/notification/NotificationIntrusivenessExtractorTest.java"
        "src/com/android/server/notification/NotificationListenerServiceTest.java"
        "src/com/android/server/notification/NotificationManagerServiceTest.java"
        "src/com/android/server/notification/NotificationRecordTest.java"
        "src/com/android/server/notification/NotificationShellCmdTest.java"
        "src/com/android/server/notification/NotificationStatsTest.java"
        "src/com/android/server/notification/NotificationTest.java"
        "src/com/android/server/notification/NotifyingAppTest.java"
        "src/com/android/server/notification/PreferencesHelperTest.java"
        "src/com/android/server/notification/PulledStatsTest.java"
        "src/com/android/server/notification/RankingHelperTest.java"
        "src/com/android/server/notification/RateEstimatorTest.java"
        "src/com/android/server/notification/RoleObserverTest.java"
        "src/com/android/server/notification/ScheduleCalendarTest.java"
        "src/com/android/server/notification/ScheduleConditionProviderTest.java"
        "src/com/android/server/notification/SnoozeHelperTest.java"
        "src/com/android/server/notification/ValidateNotificationPeopleTest.java"
        "src/com/android/server/notification/ZenModeConfigTest.java"
        "src/com/android/server/notification/ZenModeExtractorTest.java"
        "src/com/android/server/notification/ZenModeFilteringTest.java"
        "src/com/android/server/notification/ZenModeHelperTest.java"
        "src/com/android/server/notification/ZenPolicyTest.java"
        "src/com/android/server/slice/PackageMatchingCacheTest.java"
        "src/com/android/server/slice/PinnedSliceStateTest.java"
        "src/com/android/server/slice/SliceClientPermissionsTest.java"
        "src/com/android/server/slice/SliceFullAccessListTest.java"
        "src/com/android/server/slice/SliceManagerServiceTest.java"
        "src/com/android/server/slice/SlicePermissionManagerTest.java"
        "src/com/android/server/slice/SliceProviderPermissionsTest.java"
    ];

    static_libs = [
        "services.accessibility"
        "services.core"
        "services.devicepolicy"
        "services.net"
        "services.usage"
        "guava"
        "androidx.test.rules"
        "hamcrest-library"
        "mockito-target-inline-minus-junit4"
        "platform-test-annotations"
        "platformprotosnano"
        "hamcrest-library"
        "testables"
        "truth-prebuilt"
    ];

    libs = [
        "android.test.runner"
        "android.test.base"
    ];

    dxflags = ["--multi-dex"];

    platform_apis = true;
    test_suites = ["device-tests"];

    certificate = "platform";

    compile_multilib = "both";

    #  These are not normally accessible from apps so they must be explicitly included.
    jni_libs = [
        "libdexmakerjvmtiagent"
        "libmultiplejvmtiagentsinterferenceagent"
        "libbacktrace"
        "libbase"
        "libbinder"
        "libbinderthreadstate"
        "libc++"
        "libcutils"
        "liblog"
        "liblzma"
        "libnativehelper"
        "libui"
        "libunwindstack"
        "libutils"
        "netd_aidl_interface-V2-cpp"
    ];
};

in { inherit FrameworksUiServicesTests; }
