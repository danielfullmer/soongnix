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

CtsAppTestCases = android_test {
    name = "CtsAppTestCases";
    defaults = ["cts_defaults"];
    libs = [
        "android.test.runner.stubs"
        "org.apache.http.legacy"
        "android.test.base.stubs"
    ];
    static_libs = [
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
        "ctstestserver"
        "cts-opengl-util"
        "cts-wm-util"
        "mockito-target-minus-junit4"
        "androidx.test.ext.junit"
        "androidx.test.rules"
        "platform-test-annotations"
        "platformprotosnano"
        "permission-test-util-lib"
    ];
    srcs = [
        "src/android/app/backup/cts/BackupAgentHelperTest.java"
        "src/android/app/backup/cts/BackupAgentTest.java"
        "src/android/app/backup/cts/FileBackupHelperTest.java"
        "src/android/app/backup/cts/SharedPreferencesBackupHelperTest.java"
        "src/android/app/cts/ActionBarTest.java"
        "src/android/app/cts/ActivityActionModeTest.java"
        "src/android/app/cts/ActivityCallbacksTest.java"
        "src/android/app/cts/ActivityGroupTest.java"
        "src/android/app/cts/ActivityKeyboardShortcutsTest.java"
        "src/android/app/cts/ActivityManagerApi29Test.java"
        "src/android/app/cts/ActivityManagerFgsBgStartTest.java"
        "src/android/app/cts/ActivityManagerMemoryClassTest.java"
        "src/android/app/cts/ActivityManagerMemoryInfoTest.java"
        "src/android/app/cts/ActivityManagerProcessErrorStateInfoTest.java"
        "src/android/app/cts/ActivityManagerProcessStateTest.java"
        "src/android/app/cts/ActivityManagerTest.java"
        "src/android/app/cts/ActivityManager_RunningAppProcessInfoTest.java"
        "src/android/app/cts/ActivityManager_RunningServiceInfoTest.java"
        "src/android/app/cts/ActivityOptionsTest.java"
        "src/android/app/cts/AdjustmentTest.java"
        "src/android/app/cts/AlarmManagerTest.java"
        "src/android/app/cts/AlertDialogTest.java"
        "src/android/app/cts/AlertDialog_BuilderCursorTest.java"
        "src/android/app/cts/AlertDialog_BuilderTest.java"
        "src/android/app/cts/AliasActivityTest.java"
        "src/android/app/cts/AltProcessInstrumentation.java"
        "src/android/app/cts/AppTaskTests.java"
        "src/android/app/cts/ApplicationTest.java"
        "src/android/app/cts/AutomaticZenRuleTest.java"
        "src/android/app/cts/BadProviderTest.java"
        "src/android/app/cts/BaseProcessInstrumentation.java"
        "src/android/app/cts/BaseTileServiceTest.java"
        "src/android/app/cts/BooleanTileServiceTest.java"
        "src/android/app/cts/ConditionTest.java"
        "src/android/app/cts/CtsAppTestUtils.java"
        "src/android/app/cts/DefaultProcessInstrumentation.java"
        "src/android/app/cts/DialogTest.java"
        "src/android/app/cts/DisplayTest.java"
        "src/android/app/cts/DownloadManagerTest.java"
        "src/android/app/cts/DownloadManagerTestBase.java"
        "src/android/app/cts/ExpandableListActivityTest.java"
        "src/android/app/cts/FragmentReceiveResultTest.java"
        "src/android/app/cts/FragmentTest.java"
        "src/android/app/cts/FragmentTransactionTest.java"
        "src/android/app/cts/InstrumentationTest.java"
        "src/android/app/cts/Instrumentation_ActivityMonitorTest.java"
        "src/android/app/cts/Instrumentation_ActivityResultTest.java"
        "src/android/app/cts/IntentServiceTest.java"
        "src/android/app/cts/KeyguardManagerKeyguardLockTest.java"
        "src/android/app/cts/KeyguardManagerTest.java"
        "src/android/app/cts/LaunchTest.java"
        "src/android/app/cts/LauncherActivityTest.java"
        "src/android/app/cts/LauncherActivity_IconResizerTest.java"
        "src/android/app/cts/LauncherActivity_ListItemTest.java"
        "src/android/app/cts/LifecycleTest.java"
        "src/android/app/cts/ListActivityTest.java"
        "src/android/app/cts/LocalActivityManagerTest.java"
        "src/android/app/cts/MultiProcessInstrumentation.java"
        "src/android/app/cts/NewDocumentTest.java"
        "src/android/app/cts/NotificationCarExtenderTest.java"
        "src/android/app/cts/NotificationChannelGroupTest.java"
        "src/android/app/cts/NotificationChannelTest.java"
        "src/android/app/cts/NotificationDecoratedCustomViewStyleTest.java"
        "src/android/app/cts/NotificationManagerTest.java"
        "src/android/app/cts/NotificationStatsTest.java"
        "src/android/app/cts/NotificationTest.java"
        "src/android/app/cts/PendingIntentTest.java"
        "src/android/app/cts/PendingIntent_CanceledExceptionTest.java"
        "src/android/app/cts/PersonTest.java"
        "src/android/app/cts/PipNotSupportedActivityTest.java"
        "src/android/app/cts/ProgressDialogTest.java"
        "src/android/app/cts/RecoverableSecurityExceptionTest.java"
        "src/android/app/cts/RemoteInputTest.java"
        "src/android/app/cts/SearchManagerTest.java"
        "src/android/app/cts/ServiceTest.java"
        "src/android/app/cts/StatusBarManagerTest.java"
        "src/android/app/cts/StatusBarNotificationTest.java"
        "src/android/app/cts/SystemFeaturesTest.java"
        "src/android/app/cts/TabActivityTest.java"
        "src/android/app/cts/TaskDescriptionTest.java"
        "src/android/app/cts/TestContextTest.java"
        "src/android/app/cts/TileServiceTest.java"
        "src/android/app/cts/TimePickerDialogTest.java"
        "src/android/app/cts/ToolbarActionBarTest.java"
        "src/android/app/cts/UiModeManagerTest.java"
        "src/android/app/cts/UserHandleTest.java"
        "src/android/app/cts/WallpaperColorsTest.java"
        "src/android/app/cts/WallpaperInfoTest.java"
        "src/android/app/cts/WallpaperManagerTest.java"
        "src/android/app/cts/WearableExtenderTest.java"
        "src/android/app/cts/WildcardProcessInstrumentation.java"
        "src/android/app/cts/ZenPolicyTest.java"
        "src/android/app/cts/android/app/cts/tools/ServiceConnectionHandler.java"
        "src/android/app/cts/android/app/cts/tools/ServiceProcessController.java"
        "src/android/app/cts/android/app/cts/tools/SyncOrderedBroadcast.java"
        "src/android/app/cts/android/app/cts/tools/UidImportanceListener.java"
        "src/android/app/cts/android/app/cts/tools/WaitForBroadcast.java"
        "src/android/app/cts/android/app/cts/tools/WatchUidRunner.java"
    ];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    instrumentation_for = "CtsAppTestStubs";
    sdk_version = "test_current";
    min_sdk_version = "14";
};

CtsDownloadManagerApi28 = android_test {
    name = "CtsDownloadManagerApi28";
    defaults = ["cts_defaults"];
    libs = [
        "android.test.runner.stubs"
        "org.apache.http.legacy"
        "android.test.base.stubs"
    ];
    static_libs = [
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
        "ctstestserver"
        "mockito-target-minus-junit4"
        "androidx.test.rules"
        "platform-test-annotations"
        "androidx.test.rules"
    ];
    srcs = [
        "DownloadManagerApi28Test/src/android/app/cts/DownloadManagerApi28Test.java"
        "src/android/app/cts/DownloadManagerTestBase.java"
    ];
    resource_dirs = ["app/res"];
    asset_dirs = ["app/assets"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    sdk_version = "test_current";
    min_sdk_version = "14";
    manifest = "DownloadManagerApi28Test/AndroidManifest.xml";
    test_config = "DownloadManagerApi28Test/AndroidTest.xml";
};

CtsDownloadManagerInstaller = android_test {
    name = "CtsDownloadManagerInstaller";
    defaults = ["cts_defaults"];
    libs = [
        "android.test.runner.stubs"
        "org.apache.http.legacy"
        "android.test.base.stubs"
    ];
    static_libs = [
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
        "ctstestserver"
        "mockito-target-minus-junit4"
        "androidx.test.rules"
        "platform-test-annotations"
        "androidx.test.rules"
    ];
    srcs = [
        "DownloadManagerInstallerTest/src/android/app/cts/DownloadManagerInstallerTest.java"
        "src/android/app/cts/DownloadManagerTestBase.java"
    ];
    resource_dirs = ["app/res"];
    asset_dirs = ["app/assets"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    sdk_version = "test_current";
    min_sdk_version = "14";
    manifest = "DownloadManagerInstallerTest/AndroidManifest.xml";
    test_config = "DownloadManagerInstallerTest/AndroidTest.xml";
};

CtsAppExitTestCases = android_test {
    name = "CtsAppExitTestCases";
    defaults = ["cts_defaults"];
    libs = [
        "android.test.runner.stubs"
        "org.apache.http.legacy"
        "android.test.base.stubs"
    ];
    static_libs = [
        "ub-uiautomator"
        "androidx.test.rules"
        "compatibility-device-util-axt"
        "CtsExternalServiceCommon"
        "cts-wm-util"
    ];
    srcs = [
        "AppExitTest/src/android/app/cts/ActivityManagerAppExitInfoTest.java"
        "AppExitTest/src/android/app/cts/MemoryConsumerService.java"
        "src/android/app/cts/android/app/cts/tools/WatchUidRunner.java"
    ];
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    manifest = "AppExitTest/AndroidManifest.xml";
    test_config = "AppExitTest/AndroidTest.xml";
    platform_apis = true;
};

in { inherit CtsAppExitTestCases CtsAppTestCases CtsDownloadManagerApi28 CtsDownloadManagerInstaller; }
