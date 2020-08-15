{ android_app }:
let

ContactsProvider = android_app {
    name = "ContactsProvider";
    #  Only compile source java files in this apk.
    srcs = [
        "src/com/android/providers/contacts/AbstractContactsProvider.java"
        "src/com/android/providers/contacts/AccountWithDataSet.java"
        "src/com/android/providers/contacts/BootCompletedReceiver.java"
        "src/com/android/providers/contacts/CallLogDatabaseHelper.java"
        "src/com/android/providers/contacts/CallLogInsertionHelper.java"
        "src/com/android/providers/contacts/CallLogProvider.java"
        "src/com/android/providers/contacts/Constants.java"
        "src/com/android/providers/contacts/ContactDirectoryManager.java"
        "src/com/android/providers/contacts/ContactLocaleUtils.java"
        "src/com/android/providers/contacts/ContactLookupKey.java"
        "src/com/android/providers/contacts/ContactMetadataProvider.java"
        "src/com/android/providers/contacts/ContactsDatabaseHelper.java"
        "src/com/android/providers/contacts/ContactsPackageMonitor.java"
        "src/com/android/providers/contacts/ContactsProvider2.java"
        "src/com/android/providers/contacts/ContactsTaskScheduler.java"
        "src/com/android/providers/contacts/ContactsTransaction.java"
        "src/com/android/providers/contacts/ContactsUpgradeReceiver.java"
        "src/com/android/providers/contacts/CountryMonitor.java"
        "src/com/android/providers/contacts/DataRowHandler.java"
        "src/com/android/providers/contacts/DataRowHandlerForCommonDataKind.java"
        "src/com/android/providers/contacts/DataRowHandlerForCustomMimetype.java"
        "src/com/android/providers/contacts/DataRowHandlerForEmail.java"
        "src/com/android/providers/contacts/DataRowHandlerForGroupMembership.java"
        "src/com/android/providers/contacts/DataRowHandlerForIdentity.java"
        "src/com/android/providers/contacts/DataRowHandlerForIm.java"
        "src/com/android/providers/contacts/DataRowHandlerForNickname.java"
        "src/com/android/providers/contacts/DataRowHandlerForNote.java"
        "src/com/android/providers/contacts/DataRowHandlerForOrganization.java"
        "src/com/android/providers/contacts/DataRowHandlerForPhoneNumber.java"
        "src/com/android/providers/contacts/DataRowHandlerForPhoto.java"
        "src/com/android/providers/contacts/DataRowHandlerForStructuredName.java"
        "src/com/android/providers/contacts/DataRowHandlerForStructuredPostal.java"
        "src/com/android/providers/contacts/DatabaseModifier.java"
        "src/com/android/providers/contacts/DbModifierWithNotification.java"
        "src/com/android/providers/contacts/DefaultCallLogInsertionHelper.java"
        "src/com/android/providers/contacts/FastScrollingIndexCache.java"
        "src/com/android/providers/contacts/GlobalSearchSupport.java"
        "src/com/android/providers/contacts/HanziToPinyin.java"
        "src/com/android/providers/contacts/LegacyApiSupport.java"
        "src/com/android/providers/contacts/LocaleChangeReceiver.java"
        "src/com/android/providers/contacts/LocaleSet.java"
        "src/com/android/providers/contacts/MemoryCursor.java"
        "src/com/android/providers/contacts/MetadataEntryParser.java"
        "src/com/android/providers/contacts/NameLookupBuilder.java"
        "src/com/android/providers/contacts/NameNormalizer.java"
        "src/com/android/providers/contacts/NameSplitter.java"
        "src/com/android/providers/contacts/PhoneAccountRegistrationReceiver.java"
        "src/com/android/providers/contacts/PhoneLookupWithStarPrefix.java"
        "src/com/android/providers/contacts/PhotoPriorityResolver.java"
        "src/com/android/providers/contacts/PhotoProcessor.java"
        "src/com/android/providers/contacts/PhotoStore.java"
        "src/com/android/providers/contacts/PostalSplitter.java"
        "src/com/android/providers/contacts/ProfileAwareUriMatcher.java"
        "src/com/android/providers/contacts/ProfileDatabaseHelper.java"
        "src/com/android/providers/contacts/ProfileProvider.java"
        "src/com/android/providers/contacts/ReorderingCursorWrapper.java"
        "src/com/android/providers/contacts/SearchIndexManager.java"
        "src/com/android/providers/contacts/ShadowCallLogProvider.java"
        "src/com/android/providers/contacts/TransactionContext.java"
        "src/com/android/providers/contacts/VoicemailContentProvider.java"
        "src/com/android/providers/contacts/VoicemailContentTable.java"
        "src/com/android/providers/contacts/VoicemailNotifier.java"
        "src/com/android/providers/contacts/VoicemailPermissions.java"
        "src/com/android/providers/contacts/VoicemailStatusTable.java"
        "src/com/android/providers/contacts/VoicemailTable.java"
        "src/com/android/providers/contacts/VoicemailUriType.java"
        "src/com/android/providers/contacts/aggregation/AbstractContactAggregator.java"
        "src/com/android/providers/contacts/aggregation/ContactAggregator.java"
        "src/com/android/providers/contacts/aggregation/ContactAggregator2.java"
        "src/com/android/providers/contacts/aggregation/ProfileAggregator.java"
        "src/com/android/providers/contacts/aggregation/util/CommonNicknameCache.java"
        "src/com/android/providers/contacts/aggregation/util/ContactAggregatorHelper.java"
        "src/com/android/providers/contacts/aggregation/util/ContactMatcher.java"
        "src/com/android/providers/contacts/aggregation/util/MatchScore.java"
        "src/com/android/providers/contacts/aggregation/util/NameDistance.java"
        "src/com/android/providers/contacts/aggregation/util/RawContactMatcher.java"
        "src/com/android/providers/contacts/aggregation/util/RawContactMatchingCandidates.java"
        "src/com/android/providers/contacts/database/ContactsTableUtil.java"
        "src/com/android/providers/contacts/database/DeletedContactsTableUtil.java"
        "src/com/android/providers/contacts/database/MoreDatabaseUtils.java"
        "src/com/android/providers/contacts/debug/ContactsDumpActivity.java"
        "src/com/android/providers/contacts/debug/DataExporter.java"
        "src/com/android/providers/contacts/debug/DumpFileProvider.java"
        "src/com/android/providers/contacts/enterprise/EnterpriseContactsCursorWrapper.java"
        "src/com/android/providers/contacts/enterprise/EnterprisePolicyGuard.java"
        "src/com/android/providers/contacts/sqlite/DatabaseAnalyzer.java"
        "src/com/android/providers/contacts/sqlite/SqlChecker.java"
        "src/com/android/providers/contacts/util/CappedStringBuilder.java"
        "src/com/android/providers/contacts/util/Clock.java"
        "src/com/android/providers/contacts/util/CloseUtils.java"
        "src/com/android/providers/contacts/util/ContactsPermissions.java"
        "src/com/android/providers/contacts/util/DbQueryUtils.java"
        "src/com/android/providers/contacts/util/Hex.java"
        "src/com/android/providers/contacts/util/MemoryUtils.java"
        "src/com/android/providers/contacts/util/NeededForTesting.java"
        "src/com/android/providers/contacts/util/PackageUtils.java"
        "src/com/android/providers/contacts/util/PropertyUtils.java"
        "src/com/android/providers/contacts/util/SelectionBuilder.java"
        "src/com/android/providers/contacts/util/TypedUriMatcher.java"
        "src/com/android/providers/contacts/util/TypedUriMatcherImpl.java"
        "src/com/android/providers/contacts/util/UriType.java"
        "src/com/android/providers/contacts/util/UserUtils.java"
        "src/com/android/providers/contacts/EventLogTags.logtags"
    ];
    libs = [
        "ext"
        "telephony-common"
    ];
    static_libs = [
        "android-common"
        "com.android.vcard"
        "guava"
    ];

    #  The Jacoco tool analyzes code coverage when running unit tests on the
    #  application. This configuration line selects which packages will be analyzed,
    #  leaving out code which is tested by other means (e.g. static libraries) that
    #  would dilute the coverage results. These options do not affect regular
    #  production builds.
    jacoco = {
        include_filter = ["com.android.providers.contacts.*"];
    };
    platform_apis = true;
    certificate = "shared";
    privileged = true;
    optimize = {
        proguard_flags_files = ["proguard.flags"];
    };
};

in { inherit ContactsProvider; }
