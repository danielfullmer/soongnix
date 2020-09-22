{ android_test }:
let

CtsProviderTestCases = android_test {
    name = "CtsProviderTestCases";
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
        "src/android/provider/cts/DocumentsContractTest.java"
        "src/android/provider/cts/FontRequestTest.java"
        "src/android/provider/cts/FontsContractTest.java"
        "src/android/provider/cts/MockFontProvider.java"
        "src/android/provider/cts/ProviderTestUtils.java"
        "src/android/provider/cts/SearchIndexableResourceTest.java"
        "src/android/provider/cts/SearchRecentSuggestionsTest.java"
        "src/android/provider/cts/SettingsPanelTest.java"
        "src/android/provider/cts/SmsBackupRestoreTest.java"
        "src/android/provider/cts/TestCaseThatRunsIfTelephonyIsEnabled.java"
        "src/android/provider/cts/TestSRSProvider.java"
        "src/android/provider/cts/TestSearchRecentSuggestionsProvider.java"
        "src/android/provider/cts/UserDictionary_WordsTest.java"
        "src/android/provider/cts/WifiSliceTest.java"
        "src/android/provider/cts/contacts/CallLogTest.java"
        "src/android/provider/cts/contacts/StubDialerActivity.java"
        "src/android/provider/cts/contacts/StubInCallService.java"
        "src/android/provider/cts/contacts/VoicemailContractTest.java"
        "src/android/provider/cts/media/MediaStoreAudioTestHelper.java"
        "src/android/provider/cts/media/MediaStoreIntentsTest.java"
        "src/android/provider/cts/media/MediaStoreMatchTest.java"
        "src/android/provider/cts/media/MediaStoreNotificationTest.java"
        "src/android/provider/cts/media/MediaStorePendingTest.java"
        "src/android/provider/cts/media/MediaStorePlacementTest.java"
        "src/android/provider/cts/media/MediaStoreTest.java"
        "src/android/provider/cts/media/MediaStoreTrashedTest.java"
        "src/android/provider/cts/media/MediaStoreUtils.java"
        "src/android/provider/cts/media/MediaStore_AudioTest.java"
        "src/android/provider/cts/media/MediaStore_Audio_AlbumsTest.java"
        "src/android/provider/cts/media/MediaStore_Audio_ArtistsTest.java"
        "src/android/provider/cts/media/MediaStore_Audio_Artists_AlbumsTest.java"
        "src/android/provider/cts/media/MediaStore_Audio_GenresTest.java"
        "src/android/provider/cts/media/MediaStore_Audio_Genres_MembersTest.java"
        "src/android/provider/cts/media/MediaStore_Audio_MediaTest.java"
        "src/android/provider/cts/media/MediaStore_Audio_PlaylistsTest.java"
        "src/android/provider/cts/media/MediaStore_Audio_Playlists_MembersTest.java"
        "src/android/provider/cts/media/MediaStore_DownloadsTest.java"
        "src/android/provider/cts/media/MediaStore_FilesTest.java"
        "src/android/provider/cts/media/MediaStore_Images_MediaTest.java"
        "src/android/provider/cts/media/MediaStore_Images_ThumbnailsTest.java"
        "src/android/provider/cts/media/MediaStore_MetadataKeysTest.java"
        "src/android/provider/cts/media/MediaStore_VideoTest.java"
        "src/android/provider/cts/media/MediaStore_Video_MediaTest.java"
        "src/android/provider/cts/media/MediaStore_Video_ThumbnailsTest.java"
        "src/android/provider/cts/settings/SettingsTest.java"
        "src/android/provider/cts/settings/Settings_NameValueTableTest.java"
        "src/android/provider/cts/settings/Settings_SecureTest.java"
        "src/android/provider/cts/settings/Settings_SettingNotFoundExceptionTest.java"
        "src/android/provider/cts/settings/Settings_SystemTest.java"
        "app/GalleryTestApp/src/android/provider/apps/cts/gallerytestapp/ReviewActivity.java"
        "app/GalleryTestApp/src/android/provider/apps/cts/gallerytestapp/ReviewPrewarmService.java"
    ];

    #  uncomment when b/140885436 is fixed
    #  sdk_version: "test_current",
    min_sdk_version = "21";

    platform_apis = true;

    data = [":CtsProviderGalleryTestApp"];
};

in { inherit CtsProviderTestCases; }
