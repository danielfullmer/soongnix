{ android_test, android_test_helper_app, java_defaults, java_library }:
let

#  Copyright (C) 2016 The Android Open Source Project
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

CtsShortcutManagerTestCases = android_test {
    name = "CtsShortcutManagerTestCases";
    defaults = [
        "cts_defaults"
        "CtsShortcutManagerDefaults"
    ];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    srcs = [
        "src/android/content/pm/cts/shortcutmanager/MyActivity.java"
        "src/android/content/pm/cts/shortcutmanager/ShortcutLaunchedActivity.java"
        "src/android/content/pm/cts/shortcutmanager/ShortcutManagerClientApiTest.java"
        "src/android/content/pm/cts/shortcutmanager/ShortcutManagerConfigActivityTest.java"
        "src/android/content/pm/cts/shortcutmanager/ShortcutManagerCtsTestsBase.java"
        "src/android/content/pm/cts/shortcutmanager/ShortcutManagerFakingPublisherTest.java"
        "src/android/content/pm/cts/shortcutmanager/ShortcutManagerLauncherApiTest.java"
        "src/android/content/pm/cts/shortcutmanager/ShortcutManagerLauncherCallbackTest.java"
        "src/android/content/pm/cts/shortcutmanager/ShortcutManagerMaxCountTest.java"
        "src/android/content/pm/cts/shortcutmanager/ShortcutManagerMiscTest.java"
        "src/android/content/pm/cts/shortcutmanager/ShortcutManagerMultiLauncherTest.java"
        "src/android/content/pm/cts/shortcutmanager/ShortcutManagerNegativeTest.java"
        "src/android/content/pm/cts/shortcutmanager/ShortcutManagerRequestPinTest.java"
        "src/android/content/pm/cts/shortcutmanager/ShortcutManagerSpoofDetectionTest.java"
        "src/android/content/pm/cts/shortcutmanager/ShortcutManagerSpoofingTest.java"
        "src/android/content/pm/cts/shortcutmanager/ShortcutManagerStartShortcutTest.java"
        "src/android/content/pm/cts/shortcutmanager/ShortcutManagerThrottlingTest.java"
        "src/android/content/pm/cts/shortcutmanager/ShortcutManagerUsageTest.java"
    ];
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

# -----------------------------------------------------------
CtsShortcutManagerLauncher1 = android_test_helper_app {
    name = "CtsShortcutManagerLauncher1";
    defaults = [
        "cts_defaults"
        "CtsShortcutManagerDefaults"
    ];
    srcs = [
        "packages/src/android/content/pm/cts/shortcutmanager/packages/Launcher.java"
        "packages/src/android/content/pm/cts/shortcutmanager/packages/ShortcutConfirmPin.java"
    ];
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    aaptflags = [
        "--rename-manifest-package"
        "android.content.pm.cts.shortcutmanager.packages.launcher1"
    ];
    manifest = "packages/launchermanifest/AndroidManifest.xml";
};

# -----------------------------------------------------------
CtsShortcutManagerLauncher2 = android_test_helper_app {
    name = "CtsShortcutManagerLauncher2";
    defaults = [
        "cts_defaults"
        "CtsShortcutManagerDefaults"
    ];
    srcs = [
        "packages/src/android/content/pm/cts/shortcutmanager/packages/Launcher.java"
        "packages/src/android/content/pm/cts/shortcutmanager/packages/ShortcutConfirmPin.java"
    ];
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    aaptflags = [
        "--rename-manifest-package"
        "android.content.pm.cts.shortcutmanager.packages.launcher2"
    ];
    manifest = "packages/launchermanifest/AndroidManifest.xml";
};

# -----------------------------------------------------------
CtsShortcutManagerLauncher3 = android_test_helper_app {
    name = "CtsShortcutManagerLauncher3";
    defaults = [
        "cts_defaults"
        "CtsShortcutManagerDefaults"
    ];
    srcs = [
        "packages/src/android/content/pm/cts/shortcutmanager/packages/Launcher.java"
        "packages/src/android/content/pm/cts/shortcutmanager/packages/ShortcutConfirmPin.java"
    ];
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    aaptflags = [
        "--rename-manifest-package"
        "android.content.pm.cts.shortcutmanager.packages.launcher3"
    ];
    manifest = "packages/launchermanifest/AndroidManifest.xml";
};

CtsShortcutManagerLauncher4 = android_test_helper_app {
    name = "CtsShortcutManagerLauncher4";
    defaults = [
        "cts_defaults"
        "CtsShortcutManagerDefaults"
    ];
    srcs = [
        "packages/src/android/content/pm/cts/shortcutmanager/packages/Launcher.java"
        "packages/src/android/content/pm/cts/shortcutmanager/packages/ShortcutConfirmPin.java"
    ];
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    aaptflags = [
        "--rename-manifest-package"
        "android.content.pm.cts.shortcutmanager.packages.launcher4"
    ];
    manifest = "packages/launchermanifest_nonshared/AndroidManifest.xml";
};

CtsShortcutManagerPackage1 = android_test_helper_app {
    name = "CtsShortcutManagerPackage1";
    defaults = [
        "cts_defaults"
        "CtsShortcutManagerDefaults"
    ];
    srcs = [
        "packages/src/android/content/pm/cts/shortcutmanager/packages/Launcher.java"
        "packages/src/android/content/pm/cts/shortcutmanager/packages/ShortcutConfirmPin.java"
    ];
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    aaptflags = [
        "--rename-manifest-package"
        "android.content.pm.cts.shortcutmanager.packages.package1"
    ];
    manifest = "packages/packagemanifest/AndroidManifest.xml";
    resource_dirs = ["packages/packagemanifest/res"];
};

# -----------------------------------------------------------
CtsShortcutManagerPackage2 = android_test_helper_app {
    name = "CtsShortcutManagerPackage2";
    defaults = [
        "cts_defaults"
        "CtsShortcutManagerDefaults"
    ];
    srcs = [
        "packages/src/android/content/pm/cts/shortcutmanager/packages/Launcher.java"
        "packages/src/android/content/pm/cts/shortcutmanager/packages/ShortcutConfirmPin.java"
    ];
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    aaptflags = [
        "--rename-manifest-package"
        "android.content.pm.cts.shortcutmanager.packages.package2"
    ];
    manifest = "packages/packagemanifest/AndroidManifest.xml";
    resource_dirs = ["packages/packagemanifest/res"];
};

# -----------------------------------------------------------
CtsShortcutManagerPackage3 = android_test_helper_app {
    name = "CtsShortcutManagerPackage3";
    defaults = [
        "cts_defaults"
        "CtsShortcutManagerDefaults"
    ];
    srcs = [
        "packages/src/android/content/pm/cts/shortcutmanager/packages/Launcher.java"
        "packages/src/android/content/pm/cts/shortcutmanager/packages/ShortcutConfirmPin.java"
    ];
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    aaptflags = [
        "--rename-manifest-package"
        "android.content.pm.cts.shortcutmanager.packages.package3"
    ];
    manifest = "packages/packagemanifest/AndroidManifest.xml";
    resource_dirs = ["packages/packagemanifest/res"];
};

CtsShortcutManagerPackage4 = android_test_helper_app {
    name = "CtsShortcutManagerPackage4";
    defaults = [
        "cts_defaults"
        "CtsShortcutManagerDefaults"
    ];
    srcs = [
        "packages/src/android/content/pm/cts/shortcutmanager/packages/Launcher.java"
        "packages/src/android/content/pm/cts/shortcutmanager/packages/ShortcutConfirmPin.java"
    ];
    #  tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    aaptflags = [
        "--rename-manifest-package"
        "android.content.pm.cts.shortcutmanager.packages.package4"
    ];
    manifest = "packages/packagemanifest_nonshared/AndroidManifest.xml";
};

CtsShortcutManagerThrottlingTest = android_test_helper_app {
    name = "CtsShortcutManagerThrottlingTest";
    defaults = [
        "cts_defaults"
        "CtsShortcutManagerDefaults"
    ];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    srcs = [
        "throttling/src/android/content/pm/cts/shortcutmanager/throttling/BgService.java"
        "throttling/src/android/content/pm/cts/shortcutmanager/throttling/FgService.java"
        "throttling/src/android/content/pm/cts/shortcutmanager/throttling/InlineReply.java"
        "throttling/src/android/content/pm/cts/shortcutmanager/throttling/MyActivity.java"
        "throttling/src/android/content/pm/cts/shortcutmanager/throttling/ShortcutManagerThrottlingTestReceiver.java"
        "throttling/src/android/content/pm/cts/shortcutmanager/throttling/ThrottledTests.java"
    ];
    min_sdk_version = "25";
    manifest = "throttling/AndroidManifest.xml";
};

CtsShortcutManagerLib = java_library {
    name = "CtsShortcutManagerLib";
    srcs = [
        "common/src/android.content.pm.cts.shortcutmanager.common/Constants.java"
        "common/src/android.content.pm.cts.shortcutmanager.common/ReplyUtil.java"
    ];
    static_libs = [
        "androidx.test.rules"
        "ShortcutManagerTestUtils"
    ];
};

CtsShortcutManagerDefaults = java_defaults {
    name = "CtsShortcutManagerDefaults";
    sdk_version = "test_current";
    static_libs = [
        "androidx.test.rules"
        "androidx.legacy_legacy-support-v4"
        "mockito-target-minus-junit4"
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
        "ub-uiautomator"
        "ShortcutManagerTestUtils"
        "CtsShortcutManagerLib"
    ];
};

in { inherit CtsShortcutManagerDefaults CtsShortcutManagerLauncher1 CtsShortcutManagerLauncher2 CtsShortcutManagerLauncher3 CtsShortcutManagerLauncher4 CtsShortcutManagerLib CtsShortcutManagerPackage1 CtsShortcutManagerPackage2 CtsShortcutManagerPackage3 CtsShortcutManagerPackage4 CtsShortcutManagerTestCases CtsShortcutManagerThrottlingTest; }
