{ android_test }:
let

CtsContactsProviderTestCases = android_test {
    name = "CtsContactsProviderTestCases";
    defaults = ["cts_defaults"];

    compile_multilib = "both";

    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];

    libs = [
        "android.test.mock"
        "android.test.base.stubs"
        "android.test.runner.stubs"
    ];

    static_libs = [
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
        "junit"
        "truth-prebuilt"
    ];

    srcs = [
        "src/android/provider/cts/PhotoUtil.java"
        "src/android/provider/cts/contacts/CommonDatabaseUtils.java"
        "src/android/provider/cts/contacts/ContactUtil.java"
        "src/android/provider/cts/contacts/ContactsContractIntentsTest.java"
        "src/android/provider/cts/contacts/ContactsContract_AggregationSuggestionsTest.java"
        "src/android/provider/cts/contacts/ContactsContract_AllUriTest.java"
        "src/android/provider/cts/contacts/ContactsContract_CommonDataKinds_EmailTest.java"
        "src/android/provider/cts/contacts/ContactsContract_CommonDataKinds_EventTest.java"
        "src/android/provider/cts/contacts/ContactsContract_CommonDataKinds_ImTest.java"
        "src/android/provider/cts/contacts/ContactsContract_CommonDataKinds_OrganizationTest.java"
        "src/android/provider/cts/contacts/ContactsContract_CommonDataKinds_PhoneTest.java"
        "src/android/provider/cts/contacts/ContactsContract_CommonDataKinds_RelationTest.java"
        "src/android/provider/cts/contacts/ContactsContract_CommonDataKinds_SipAddressTest.java"
        "src/android/provider/cts/contacts/ContactsContract_CommonDataKinds_StructuredPostalTest.java"
        "src/android/provider/cts/contacts/ContactsContract_ContactCountsTest.java"
        "src/android/provider/cts/contacts/ContactsContract_ContactsTest.java"
        "src/android/provider/cts/contacts/ContactsContract_DataTest.java"
        "src/android/provider/cts/contacts/ContactsContract_DataUsageTest.java"
        "src/android/provider/cts/contacts/ContactsContract_DeletedContacts.java"
        "src/android/provider/cts/contacts/ContactsContract_DirectoryTest.java"
        "src/android/provider/cts/contacts/ContactsContract_DumpFileProviderTest.java"
        "src/android/provider/cts/contacts/ContactsContract_FrequentsStrequentsTest.java"
        "src/android/provider/cts/contacts/ContactsContract_GroupMembershipTest.java"
        "src/android/provider/cts/contacts/ContactsContract_IsSuperPrimaryName.java"
        "src/android/provider/cts/contacts/ContactsContract_PhoneLookup.java"
        "src/android/provider/cts/contacts/ContactsContract_PhotoTest.java"
        "src/android/provider/cts/contacts/ContactsContract_PinnedPositionsTest.java"
        "src/android/provider/cts/contacts/ContactsContract_ProviderStatus.java"
        "src/android/provider/cts/contacts/ContactsContract_QuickContactsTest.java"
        "src/android/provider/cts/contacts/ContactsContract_RawContactsTest.java"
        "src/android/provider/cts/contacts/ContactsContract_SearchSnippetsTest.java"
        "src/android/provider/cts/contacts/ContactsContract_StatusUpdatesTest.java"
        "src/android/provider/cts/contacts/ContactsContract_StructuredPhoneticName.java"
        "src/android/provider/cts/contacts/ContactsContract_Subquery.java"
        "src/android/provider/cts/contacts/ContactsContract_TestDataBuilder.java"
        "src/android/provider/cts/contacts/ContactsMetadataProviderTest.java"
        "src/android/provider/cts/contacts/ContactsProvider2_AccountRemovalTest.java"
        "src/android/provider/cts/contacts/ContactsTest.java"
        "src/android/provider/cts/contacts/Contacts_ContactMethodsTest.java"
        "src/android/provider/cts/contacts/Contacts_OrganizationsTest.java"
        "src/android/provider/cts/contacts/Contacts_PeopleTest.java"
        "src/android/provider/cts/contacts/Contacts_PhonesTest.java"
        "src/android/provider/cts/contacts/Contacts_SettingsTest.java"
        "src/android/provider/cts/contacts/DataUtil.java"
        "src/android/provider/cts/contacts/DatabaseAsserts.java"
        "src/android/provider/cts/contacts/DeletedContactUtil.java"
        "src/android/provider/cts/contacts/DummyGalProvider.java"
        "src/android/provider/cts/contacts/RawContactUtil.java"
        "src/android/provider/cts/contacts/account/MockAccountService.java"
        "src/android/provider/cts/contacts/account/StaticAccountAuthenticator.java"
    ];

    sdk_version = "test_current";
    min_sdk_version = "21";
};

in { inherit CtsContactsProviderTestCases; }
