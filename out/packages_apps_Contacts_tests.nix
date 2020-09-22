{ android_test }:
let

ContactsTests = android_test {
    name = "ContactsTests";

    certificate = "shared";

    srcs = [
        "src/com/android/contacts/ContactsLaunchPerformance.java"
        "src/com/android/contacts/ContactsUtilsTests.java"
        "src/com/android/contacts/DynamicShortcutsTests.java"
        "src/com/android/contacts/GroupsDaoIntegrationTests.java"
        "src/com/android/contacts/MoreContactUtilsTest.java"
        "src/com/android/contacts/NoPermissionsLaunchSmokeTest.java"
        "src/com/android/contacts/RunMethodInstrumentation.java"
        "src/com/android/contacts/activities/PeopleActivityTest.java"
        "src/com/android/contacts/activities/SimImportActivityTest.java"
        "src/com/android/contacts/compat/CompatUtilsTest.java"
        "src/com/android/contacts/database/NoNullCursorAsyncQueryHandlerTest.java"
        "src/com/android/contacts/database/SimContactDaoTests.java"
        "src/com/android/contacts/editor/ContactEditorUtilsTest.java"
        "src/com/android/contacts/editor/EditorUiUtilsTest.java"
        "src/com/android/contacts/format/FormatUtilsTests.java"
        "src/com/android/contacts/format/SpannedTestUtils.java"
        "src/com/android/contacts/format/TextHighlighterTest.java"
        "src/com/android/contacts/group/GroupUtilTest.java"
        "src/com/android/contacts/interactions/ContactDeletionInteractionTest.java"
        "src/com/android/contacts/interactions/ContactInteractionUtilTest.java"
        "src/com/android/contacts/interactions/TestLoaderManager.java"
        "src/com/android/contacts/list/ContactListItemViewTest.java"
        "src/com/android/contacts/model/AccountTypeManagerTest.java"
        "src/com/android/contacts/model/AccountWithDataSetTest.java"
        "src/com/android/contacts/model/ContactLoaderTest.java"
        "src/com/android/contacts/model/Cp2DeviceLocalAccountLocatorTests.java"
        "src/com/android/contacts/model/RawContactDeltaListTests.java"
        "src/com/android/contacts/model/RawContactDeltaTests.java"
        "src/com/android/contacts/model/RawContactModifierTests.java"
        "src/com/android/contacts/model/RawContactTest.java"
        "src/com/android/contacts/model/SimContactTests.java"
        "src/com/android/contacts/model/ValuesDeltaTests.java"
        "src/com/android/contacts/model/account/AccountTypeTest.java"
        "src/com/android/contacts/model/account/ExternalAccountTypeTest.java"
        "src/com/android/contacts/model/dataitem/DataItemTests.java"
        "src/com/android/contacts/preference/ContactsPreferencesTest.java"
        "src/com/android/contacts/test/FragmentTestActivity.java"
        "src/com/android/contacts/test/IntegrationTestUtils.java"
        "src/com/android/contacts/test/LaunchPerformanceBase.java"
        "src/com/android/contacts/test/mocks/ContactsMockContext.java"
        "src/com/android/contacts/test/mocks/ContactsMockPackageManager.java"
        "src/com/android/contacts/test/mocks/ForwardingContentProvider.java"
        "src/com/android/contacts/test/mocks/MockAccountTypeManager.java"
        "src/com/android/contacts/test/mocks/MockContactPhotoManager.java"
        "src/com/android/contacts/test/mocks/MockContentProvider.java"
        "src/com/android/contacts/test/mocks/MockSharedPreferences.java"
        "src/com/android/contacts/tests/AccountsTestHelper.java"
        "src/com/android/contacts/tests/AdbHelpers.java"
        "src/com/android/contacts/tests/ContactsMatchers.java"
        "src/com/android/contacts/tests/FakeAccountType.java"
        "src/com/android/contacts/tests/FakeDeviceAccountTypeFactory.java"
        "src/com/android/contacts/tests/FakeSimContactDao.java"
        "src/com/android/contacts/tests/PhoneNumberTestService.java"
        "src/com/android/contacts/tests/QueryService.java"
        "src/com/android/contacts/tests/SimContactsTestHelper.java"
        "src/com/android/contacts/tests/StringableCursor.java"
        "src/com/android/contacts/tests/allintents/AllIntentsActivity.java"
        "src/com/android/contacts/tests/allintents/ResultActivity.java"
        "src/com/android/contacts/tests/allintents/SelectAccountDialogFragment.java"
        "src/com/android/contacts/tests/quickcontact/QuickContactTestsActivity.java"
        "src/com/android/contacts/tests/testauth/TestAuthenticationService.java"
        "src/com/android/contacts/tests/testauth/TestAuthenticator.java"
        "src/com/android/contacts/tests/testauth/TestSyncAdapter.java"
        "src/com/android/contacts/tests/testauth/TestSyncService.java"
        "src/com/android/contacts/tests/testauth/TestauthConstants.java"
        "src/com/android/contacts/util/AccountDisplayInfoFactoryTests.java"
        "src/com/android/contacts/util/BitmapUtilTests.java"
        "src/com/android/contacts/util/ContactDisplayUtilTests.java"
        "src/com/android/contacts/util/ContactPhotoUtilsTest.java"
        "src/com/android/contacts/util/SearchUtilTest.java"
        "src/com/android/contacts/util/SyncUtilTests.java"
        "src/com/android/contacts/widget/CompositeListAdapterTest.java"
    ];

    instrumentation_for = "Contacts";

    sdk_version = "current";
    min_sdk_version = "21";

    static_libs = [
        "androidx.test.rules"
        "hamcrest-library"
        "mockito-target-minus-junit4"
        "ub-uiautomator"
    ];

    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
        "android.test.mock.stubs"
    ];

    test_suites = ["general-tests"];
};

in { inherit ContactsTests; }
