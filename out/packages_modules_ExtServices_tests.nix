{ android_test }:
let

ExtServicesUnitTests = android_test {
    name = "ExtServicesUnitTests";

    #  Include all test java files.
    srcs = [
        "src/android/ext/services/VersionTest.java"
        "src/android/ext/services/autofill/AutofillFieldClassificationServiceImplTest.java"
        "src/android/ext/services/autofill/CreditCardMatcherTest.java"
        "src/android/ext/services/autofill/EditDistanceScorerTest.java"
        "src/android/ext/services/autofill/ExactMatchTest.java"
        "src/android/ext/services/autofill/InlineSuggestionRenderServiceImplTest.java"
        "src/android/ext/services/notification/AgingHelperTest.java"
        "src/android/ext/services/notification/AssistantSettingsTest.java"
        "src/android/ext/services/notification/ChannelImpressionsTest.java"
        "src/android/ext/services/notification/EntityTypeCounterTest.java"
        "src/android/ext/services/notification/NotificationCategorizerTest.java"
        "src/android/ext/services/notification/NotificationEntryTest.java"
        "src/android/ext/services/resolver/LRResolverRankerServiceTest.java"
        "src/android/ext/services/storage/CacheQuotaServiceImplTest.java"
        "src/android/ext/services/watchdog/ExplicitHealthCheckServiceImplTest.java"
        "src/android/ext/services/watchdog/ExplicitHealthCheckServiceImplUnitTest.java"
    ];

    libs = [
        "android.test.runner"
        "android.test.base"
    ];

    static_libs = [
        "ExtServices-core"
        "androidx.test.rules"
        "compatibility-device-util-axt"
        "mockito-target-extended-minus-junit4"
        "androidx.test.espresso.core"
        "truth-prebuilt"
        "testables"
        "testng"
    ];
    jni_libs = [
        "libdexmakerjvmtiagent"
        "libstaticjvmtiagent"
    ];
    test_suites = [
        "device-tests"
        "mts"
    ];
    platform_apis = true;
    compile_multilib = "both";
};

in { inherit ExtServicesUnitTests; }
