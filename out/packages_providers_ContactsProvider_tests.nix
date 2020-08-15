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
    srcs = [
        "src/com/android/providers/contacts/BaseContactsProvider2Test.java"
        "src/com/android/providers/contacts/BaseDatabaseHelperUpgradeTest.java"
        "src/com/android/providers/contacts/BaseVoicemailProviderTest.java"
        "src/com/android/providers/contacts/CallLogDatabaseHelperTestable.java"
        "src/com/android/providers/contacts/CallLogInsertionHelperTest.java"
        "src/com/android/providers/contacts/CallLogMigrationTest.java"
        "src/com/android/providers/contacts/CallLogProviderTest.java"
        "src/com/android/providers/contacts/CallLogProviderTestable.java"
        "src/com/android/providers/contacts/CallerInfoIntegrationTest.java"
        "src/com/android/providers/contacts/ContactDirectoryManagerTest.java"
        "src/com/android/providers/contacts/ContactLocaleUtilsTest.java"
        "src/com/android/providers/contacts/ContactLookupKeyTest.java"
        "src/com/android/providers/contacts/ContactMetadataProviderTest.java"
        "src/com/android/providers/contacts/ContactMetadataProviderTestable.java"
        "src/com/android/providers/contacts/ContactsActor.java"
        "src/com/android/providers/contacts/ContactsDatabaseHelperTest.java"
        "src/com/android/providers/contacts/ContactsDatabaseHelperUpgradeTest.java"
        "src/com/android/providers/contacts/ContactsIcuTest.java"
        "src/com/android/providers/contacts/ContactsMockPackageManager.java"
        "src/com/android/providers/contacts/ContactsMockResources.java"
        "src/com/android/providers/contacts/ContactsProvider2Test.java"
        "src/com/android/providers/contacts/ContactsProvider2TransactionTest.java"
        "src/com/android/providers/contacts/ContactsTaskSchedulerTest.java"
        "src/com/android/providers/contacts/DirectoryTest.java"
        "src/com/android/providers/contacts/EnterpriseContactsCursorWrapperTest.java"
        "src/com/android/providers/contacts/EvenMoreAsserts.java"
        "src/com/android/providers/contacts/FastScrollingIndexCacheTest.java"
        "src/com/android/providers/contacts/FixedAndroidTestCase.java"
        "src/com/android/providers/contacts/GlobalSearchSupportTest.java"
        "src/com/android/providers/contacts/GroupsTest.java"
        "src/com/android/providers/contacts/HanziToPinyinTest.java"
        "src/com/android/providers/contacts/LegacyContactsProviderTest.java"
        "src/com/android/providers/contacts/LocaleSetTest.java"
        "src/com/android/providers/contacts/MetadataEntryParserTest.java"
        "src/com/android/providers/contacts/MockSyncAdapter.java"
        "src/com/android/providers/contacts/NameLookupBuilderTest.java"
        "src/com/android/providers/contacts/NameNormalizerTest.java"
        "src/com/android/providers/contacts/NameSplitterTest.java"
        "src/com/android/providers/contacts/PhoneLookupWithStarPrefixTest.java"
        "src/com/android/providers/contacts/PhotoLoadingTestCase.java"
        "src/com/android/providers/contacts/PhotoPriorityResolverTest.java"
        "src/com/android/providers/contacts/PhotoProcessorTest.java"
        "src/com/android/providers/contacts/PhotoStoreTest.java"
        "src/com/android/providers/contacts/PostalSplitterForJapaneseTest.java"
        "src/com/android/providers/contacts/PostalSplitterTest.java"
        "src/com/android/providers/contacts/RenamingDelegatingContext.java"
        "src/com/android/providers/contacts/SearchIndexManagerTest.java"
        "src/com/android/providers/contacts/SecondaryUserContactsProvider2.java"
        "src/com/android/providers/contacts/SqlInjectionDetectionTest.java"
        "src/com/android/providers/contacts/SynchronousContactsProvider2.java"
        "src/com/android/providers/contacts/SynchronousProfileProvider.java"
        "src/com/android/providers/contacts/TestUtils.java"
        "src/com/android/providers/contacts/TransactionContextTest.java"
        "src/com/android/providers/contacts/VCardTest.java"
        "src/com/android/providers/contacts/VoicemailCleanupTest.java"
        "src/com/android/providers/contacts/VoicemailProviderTest.java"
        "src/com/android/providers/contacts/aggregation/ContactAggregator2Test.java"
        "src/com/android/providers/contacts/aggregation/ContactAggregatorTest.java"
        "src/com/android/providers/contacts/aggregation/util/ContactAggregatorHelperTest.java"
        "src/com/android/providers/contacts/aggregation/util/ContactMatcherTest.java"
        "src/com/android/providers/contacts/aggregation/util/NameDistanceTest.java"
        "src/com/android/providers/contacts/database/MoreDatabaseUtilTest.java"
        "src/com/android/providers/contacts/enterprise/EnterprisePolicyGuardTest.java"
        "src/com/android/providers/contacts/sqlite/DatabaseAnalyzerTest.java"
        "src/com/android/providers/contacts/sqlite/SqlCheckerTest.java"
        "src/com/android/providers/contacts/util/CappedStringBuilderTest.java"
        "src/com/android/providers/contacts/util/DBQueryUtilsTest.java"
        "src/com/android/providers/contacts/util/MockClock.java"
        "src/com/android/providers/contacts/util/MockSharedPreferences.java"
        "src/com/android/providers/contacts/util/NullContentProvider.java"
        "src/com/android/providers/contacts/util/SelectionBuilderTest.java"
        "src/com/android/providers/contacts/util/TypedUriMatcherImplTest.java"
        "src/com/android/providers/contacts/util/UserUtilsTest.java"
    ];
    platform_apis = true;
    test_suites = ["device-tests"];
    instrumentation_for = "ContactsProvider";
    certificate = "shared";
    optimize = {
        enabled = false;
    };
};

in { inherit ContactsProviderTests; }
