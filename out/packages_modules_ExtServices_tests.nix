{ android_test }:
let

ExtServicesUnitTests = android_test {
    name = "ExtServicesUnitTests";

    #  Include all test java files.
    srcs = [
        "src/android/ext/services/autofill/AutofillFieldClassificationServiceImplTest.java"
        "src/android/ext/services/autofill/EditDistanceScorerTest.java"
        "src/android/ext/services/autofill/ExactMatchTest.java"
        "src/android/ext/services/notification/AgingHelperTest.java"
        "src/android/ext/services/notification/AssistantSettingsTest.java"
        "src/android/ext/services/notification/AssistantTest.java"
        "src/android/ext/services/notification/ChannelImpressionsTest.java"
        "src/android/ext/services/notification/EntityTypeCounterTest.java"
        "src/android/ext/services/notification/NotificationCategorizerTest.java"
        "src/android/ext/services/notification/NotificationEntryTest.java"
        "src/android/ext/services/notification/SmartActionsHelperTest.java"
        "src/android/ext/services/sms/FinancialSmsServiceImplTest.java"
        "src/android/ext/services/storage/CacheQuotaServiceImplTest.java"
        "src/android/ext/services/watchdog/ExplicitHealthCheckServiceImplTest.java"
    ];

    #  We only want this apk build for tests.
    certificate = "platform";

    libs = [
        "android.test.runner"
        "android.test.base"
    ];

    static_libs = [
        "ExtServices-core"
        "androidx.test.rules"
        "compatibility-device-util-axt"
        "mockito-target-minus-junit4"
        "androidx.test.espresso.core"
        "truth-prebuilt"
        "testables"
        "testng"
    ];

    platform_apis = true;
};

in { inherit ExtServicesUnitTests; }
