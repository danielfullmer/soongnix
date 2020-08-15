{ android_test }:
let

CtsProviderTestCases = android_test {
    name = "CtsProviderTestCases";
    defaults = ["cts_defaults"];

    compile_multilib = "both";

    test_suites = [
        "cts"
        "vts"
        "general-tests"
    ];

    libs = [
        "android.test.mock"
        "android.test.base.stubs"
        "android.test.runner.stubs"
        "telephony-common"
    ];

    static_libs = [
        "androidx.slice_slice-core"
        "androidx.slice_slice-view"
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
        "junit"
        "truth-prebuilt"
        "mockito-target-minus-junit4"
    ];

    jni_libs = [
        "libcts_jni"
        "libnativehelper_compat_libc++"
    ];

    srcs = [
        "src/android/provider/cts/BlockedNumberBackupRestoreTest.java"
        "src/android/provider/cts/BlockedNumberContractTest.java"
        "src/android/provider/cts/BrowserStubActivity.java"
        "src/android/provider/cts/CalendarTest.java"
        "src/android/provider/cts/CallLogTest.java"
        "src/android/provider/cts/DocumentsContractTest.java"
        "src/android/provider/cts/FontRequestTest.java"
        "src/android/provider/cts/FontsContractTest.java"
        "src/android/provider/cts/MediaStoreAudioTestHelper.java"
        "src/android/provider/cts/MediaStoreIntentsTest.java"
        "src/android/provider/cts/MediaStorePendingTest.java"
        "src/android/provider/cts/MediaStorePlacementTest.java"
        "src/android/provider/cts/MediaStoreTest.java"
        "src/android/provider/cts/MediaStoreUtils.java"
        "src/android/provider/cts/MediaStore_AudioTest.java"
        "src/android/provider/cts/MediaStore_Audio_AlbumsTest.java"
        "src/android/provider/cts/MediaStore_Audio_ArtistsTest.java"
        "src/android/provider/cts/MediaStore_Audio_Artists_AlbumsTest.java"
        "src/android/provider/cts/MediaStore_Audio_GenresTest.java"
        "src/android/provider/cts/MediaStore_Audio_Genres_MembersTest.java"
        "src/android/provider/cts/MediaStore_Audio_MediaTest.java"
        "src/android/provider/cts/MediaStore_Audio_PlaylistsTest.java"
        "src/android/provider/cts/MediaStore_Audio_Playlists_MembersTest.java"
        "src/android/provider/cts/MediaStore_DownloadsTest.java"
        "src/android/provider/cts/MediaStore_FilesTest.java"
        "src/android/provider/cts/MediaStore_Images_MediaTest.java"
        "src/android/provider/cts/MediaStore_Images_ThumbnailsTest.java"
        "src/android/provider/cts/MediaStore_VideoTest.java"
        "src/android/provider/cts/MediaStore_Video_MediaTest.java"
        "src/android/provider/cts/MediaStore_Video_ThumbnailsTest.java"
        "src/android/provider/cts/MockFontProvider.java"
        "src/android/provider/cts/PhotoUtil.java"
        "src/android/provider/cts/ProviderTestUtils.java"
        "src/android/provider/cts/SearchRecentSuggestionsTest.java"
        "src/android/provider/cts/SettingsPanelTest.java"
        "src/android/provider/cts/SettingsTest.java"
        "src/android/provider/cts/Settings_NameValueTableTest.java"
        "src/android/provider/cts/Settings_SecureTest.java"
        "src/android/provider/cts/Settings_SettingNotFoundExceptionTest.java"
        "src/android/provider/cts/Settings_SystemTest.java"
        "src/android/provider/cts/SmsBackupRestoreTest.java"
        "src/android/provider/cts/TestCaseThatRunsIfTelephonyIsEnabled.java"
        "src/android/provider/cts/TestSRSProvider.java"
        "src/android/provider/cts/TestSearchRecentSuggestionsProvider.java"
        "src/android/provider/cts/UserDictionary_WordsTest.java"
        "src/android/provider/cts/WifiSliceTest.java"
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
        "src/android/provider/cts/contacts/StubDialerActivity.java"
        "src/android/provider/cts/contacts/StubInCallService.java"
        "src/android/provider/cts/contacts/VoicemailContractTest.java"
        "src/android/provider/cts/contacts/account/ContactsContract_Subquery.java"
        "src/android/provider/cts/contacts/account/MockAccountService.java"
        "src/android/provider/cts/contacts/account/StaticAccountAuthenticator.java"
        "src/libcore/util/HexEncoding.java"
    ];

    sdk_version = "test_current";
    min_sdk_version = "21";
};

in { inherit CtsProviderTestCases; }
