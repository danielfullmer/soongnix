{ android_test }:
let

#  Copyright (C) 2008 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

CtsContentTestCases = android_test {
    name = "CtsContentTestCases";
    defaults = ["cts_defaults"];

    #  Don't run manifestmerger on dependencies, it is unhappy with the duplicate
    #  REQUIRED_MULTI_DENY permissions in AndroidManifest.xml
    dont_merge_manifests = true;
    #  Include both the 32 and 64 bit versions
    compile_multilib = "both";
    jni_libs = [
        "libnativecursorwindow_jni"
        "libnativehelper_compat_libc++"
    ];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
        "android.test.mock"
    ];
    static_libs = [
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
        "services.core"
        "junit"
        "truth-prebuilt"
        "accountaccesslib"
        "ub-uiautomator"
        #  TODO: remove once Android migrates to JUnit 4.12, which provides assertThrows:
        "testng"
        "androidx.legacy_legacy-support-v4"
        "androidx.test.core"
    ];
    #  Use multi-dex as the compatibility-common-util-devicesidelib dependency
    #  on compatibility-device-util-axt pushes us beyond 64k methods.
    dxflags = ["--multi-dex"];
    #  Resource unit tests use a private locale and some densities
    aapt_include_all_resources = true;
    aaptflags = [
        "-c cs"
        "-c fil,fil-rPH,fil-rSA"
        "-c fr,fr-rFR"
        "-c iw,iw-rIL"
        "-c kok,b+kok+419,b+kok+419+variant,b+kok+IN,b+kok+Knda,b+kok+Knda+419,b+kok+Knda+419+variant"
        "-c b+kok+variant"
        "-c mk,mk-rMK"
        "-c tl,tl-rPH"
        "-c tgl,tgl-rPH"
        "-c tlh"
        "-c xx,xx-rYY"
    ];
    srcs = [
        "src/android/content/cts/AccountAccessSameCertTest.java"
        "src/android/content/cts/ActivityNotFoundExceptionTest.java"
        "src/android/content/cts/AsyncQueryHandlerTest.java"
        "src/android/content/cts/AvailableIntentsActivity.java"
        "src/android/content/cts/AvailableIntentsTest.java"
        "src/android/content/cts/BroadcastReceiverTest.java"
        "src/android/content/cts/BuggyProviderTest.java"
        "src/android/content/cts/CameraIntentHandlerActivity.java"
        "src/android/content/cts/ChildActivity.java"
        "src/android/content/cts/ClipDescriptionTest.java"
        "src/android/content/cts/ClipboardManagerListenerActivity.java"
        "src/android/content/cts/ClipboardManagerListenerTest.java"
        "src/android/content/cts/ClipboardManagerTest.java"
        "src/android/content/cts/ComponentNameTest.java"
        "src/android/content/cts/ContentProviderClientTest.java"
        "src/android/content/cts/ContentProviderCursorWindowTest.java"
        "src/android/content/cts/ContentProviderOperationTest.java"
        "src/android/content/cts/ContentProviderResultTest.java"
        "src/android/content/cts/ContentProviderTest.java"
        "src/android/content/cts/ContentQueryMapTest.java"
        "src/android/content/cts/ContentResolverSyncTestCase.java"
        "src/android/content/cts/ContentResolverTest.java"
        "src/android/content/cts/ContentResolverWrapTest.java"
        "src/android/content/cts/ContentUrisTest.java"
        "src/android/content/cts/ContentValuesTest.java"
        "src/android/content/cts/ContextAccessTest.java"
        "src/android/content/cts/ContextCtsActivity.java"
        "src/android/content/cts/ContextMoreTest.java"
        "src/android/content/cts/ContextTest.java"
        "src/android/content/cts/ContextWrapperTest.java"
        "src/android/content/cts/CursorWindowContentProvider.java"
        "src/android/content/cts/DeferSyncTest.java"
        "src/android/content/cts/DummyProvider.java"
        "src/android/content/cts/HighPriorityBroadcastReceiver.java"
        "src/android/content/cts/ImageCaptureActivity.java"
        "src/android/content/cts/ImageCaptureUriExtraToClipDataTest.java"
        "src/android/content/cts/IntentFilterTest.java"
        "src/android/content/cts/IntentFilter_AuthorityEntryTest.java"
        "src/android/content/cts/IntentFilter_MalformedMimeTypeExceptionTest.java"
        "src/android/content/cts/IntentTest.java"
        "src/android/content/cts/Intent_FilterComparisonTest.java"
        "src/android/content/cts/Intent_ShortcutIconResourceTest.java"
        "src/android/content/cts/LocusIdTest.java"
        "src/android/content/cts/LowPriorityBroadcastReceiver.java"
        "src/android/content/cts/MockAccountAuthenticator.java"
        "src/android/content/cts/MockAccountService.java"
        "src/android/content/cts/MockActivity.java"
        "src/android/content/cts/MockApplication.java"
        "src/android/content/cts/MockBuggyProvider.java"
        "src/android/content/cts/MockContentProvider.java"
        "src/android/content/cts/MockContextService.java"
        "src/android/content/cts/MockReceiver.java"
        "src/android/content/cts/MockReceiverAbort.java"
        "src/android/content/cts/MockReceiverDisableable.java"
        "src/android/content/cts/MockReceiverFirst.java"
        "src/android/content/cts/MockRemoteContentProvider.java"
        "src/android/content/cts/MockSRSProvider.java"
        "src/android/content/cts/MockService.java"
        "src/android/content/cts/MockSyncAdapter.java"
        "src/android/content/cts/MockSyncAdapterService.java"
        "src/android/content/cts/MutableContextWrapperTest.java"
        "src/android/content/cts/ReadableFileReceiverActivity.java"
        "src/android/content/cts/ReadableUriExtraToClipDataTest.java"
        "src/android/content/cts/ReceiverCallNotAllowedExceptionTest.java"
        "src/android/content/cts/ResultReceiver.java"
        "src/android/content/cts/SearchRecentSuggestionsProviderTest.java"
        "src/android/content/cts/SharedPreferencesTest.java"
        "src/android/content/cts/SyncStorageEngineTest.java"
        "src/android/content/cts/TestPagingContentProvider.java"
        "src/android/content/cts/UriMatcherTest.java"
        "src/android/content/cts/util/XmlUtils.java"
        "src/android/content/om/cts/OverlayInfoTest.java"
        "src/android/content/om/cts/OverlayManagerTest.java"
        "src/android/content/pm/cts/ActivityInfoTest.java"
        "src/android/content/pm/cts/ApplicationInfoTest.java"
        "src/android/content/pm/cts/ApplicationInfo_DisplayNameComparatorTest.java"
        "src/android/content/pm/cts/ComponentInfoTest.java"
        "src/android/content/pm/cts/ConfigurationInfoTest.java"
        "src/android/content/pm/cts/FeatureGroupInfoTest.java"
        "src/android/content/pm/cts/FeatureTest.java"
        "src/android/content/pm/cts/InstallSessionParamsUnitTest.java"
        "src/android/content/pm/cts/InstallSessionTransferTest.java"
        "src/android/content/pm/cts/InstantAppTest.java"
        "src/android/content/pm/cts/InstrumentationInfoTest.java"
        "src/android/content/pm/cts/LauncherAppsTest.java"
        "src/android/content/pm/cts/LauncherMockActivity.java"
        "src/android/content/pm/cts/PackageInfoTest.java"
        "src/android/content/pm/cts/PackageItemInfoIconTest.java"
        "src/android/content/pm/cts/PackageItemInfoTest.java"
        "src/android/content/pm/cts/PackageItemInfo_DisplayNameComparatorTest.java"
        "src/android/content/pm/cts/PackageManagerShellCommandIncrementalTest.java"
        "src/android/content/pm/cts/PackageManagerShellCommandTest.java"
        "src/android/content/pm/cts/PackageManagerTest.java"
        "src/android/content/pm/cts/PackageManager_NameNotFoundExceptionTest.java"
        "src/android/content/pm/cts/PackageStatsTest.java"
        "src/android/content/pm/cts/PermissionFeatureTest.java"
        "src/android/content/pm/cts/PermissionGroupInfoTest.java"
        "src/android/content/pm/cts/PermissionInfoTest.java"
        "src/android/content/pm/cts/ProviderInfoListTest.java"
        "src/android/content/pm/cts/ProviderInfoTest.java"
        "src/android/content/pm/cts/ResolveInfoTest.java"
        "src/android/content/pm/cts/ServiceInfoTest.java"
        "src/android/content/pm/cts/SignatureTest.java"
        "src/android/content/res/cts/ArrayTest.java"
        "src/android/content/res/cts/AssetFileDescriptorTest.java"
        "src/android/content/res/cts/AssetFileDescriptor_AutoCloseInputStreamTest.java"
        "src/android/content/res/cts/AssetFileDescriptor_AutoCloseOutputStreamTest.java"
        "src/android/content/res/cts/AssetManagerTest.java"
        "src/android/content/res/cts/AssetManager_AssetInputStreamTest.java"
        "src/android/content/res/cts/ColorStateListTest.java"
        "src/android/content/res/cts/ConfigTest.java"
        "src/android/content/res/cts/ConfigurationTest.java"
        "src/android/content/res/cts/FractionTest.java"
        "src/android/content/res/cts/PluralResourcesTest.java"
        "src/android/content/res/cts/PrimitiveTest.java"
        "src/android/content/res/cts/PrivateAttributeTest.java"
        "src/android/content/res/cts/RawResourceTest.java"
        "src/android/content/res/cts/ResourceNameTest.java"
        "src/android/content/res/cts/ResourcesTest.java"
        "src/android/content/res/cts/Resources_NotFoundExceptionTest.java"
        "src/android/content/res/cts/Resources_ThemeTest.java"
        "src/android/content/res/cts/TypedArrayTest.java"
        "src/com/android/content/cts/DummyParcelable.java"
        "BinderPermissionTestService/aidl/com/android/cts/IBinderPermissionTestService.aidl"
    ];
    platform_apis = true;
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    min_sdk_version = "29";
};

in { inherit CtsContentTestCases; }
