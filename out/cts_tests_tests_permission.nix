{ android_test }:
let

#
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
#
CtsPermissionTestCases = android_test {
    name = "CtsPermissionTestCases";
    defaults = ["cts_defaults"];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    #  Include both the 32 and 64 bit versions
    compile_multilib = "both";
    static_libs = [
        "ctstestrunner-axt"
        "guava"
        "android-ex-camera2"
        "compatibility-device-util-axt"
        "truth-prebuilt"
        "androidx.annotation_annotation"
        "platformprotosnano"
        "permission-test-util-lib"
    ];
    jni_libs = [
        "libctspermission_jni"
        "libnativehelper_compat_libc++"
    ];
    srcs = [
        "src/android/permission/cts/ActivityPermissionRationaleTest.java"
        "src/android/permission/cts/AppIdleStatePermissionTest.java"
        "src/android/permission/cts/AppWidgetManagerPermissionTest.java"
        "src/android/permission/cts/BackgroundPermissionButtonLabelTest.java"
        "src/android/permission/cts/BackgroundPermissionsTest.java"
        "src/android/permission/cts/Camera2PermissionTest.java"
        "src/android/permission/cts/CameraPermissionTest.java"
        "src/android/permission/cts/ConnectivityManagerPermissionTest.java"
        "src/android/permission/cts/ContactsProviderTest.java"
        "src/android/permission/cts/DebuggableTest.java"
        "src/android/permission/cts/FileSystemPermissionTest.java"
        "src/android/permission/cts/FileUtils.java"
        "src/android/permission/cts/IgnoreAllTestsRule.java"
        "src/android/permission/cts/LocationAccessCheckTest.java"
        "src/android/permission/cts/MainlineNetworkStackPermissionTest.java"
        "src/android/permission/cts/NoActivityRelatedPermissionTest.java"
        "src/android/permission/cts/NoAudioPermissionTest.java"
        "src/android/permission/cts/NoBroadcastPackageRemovedPermissionTest.java"
        "src/android/permission/cts/NoCaptureVideoPermissionTest.java"
        "src/android/permission/cts/NoKeyPermissionTest.java"
        "src/android/permission/cts/NoNetworkStatePermissionTest.java"
        "src/android/permission/cts/NoReadLogsPermissionTest.java"
        "src/android/permission/cts/NoSdCardWritePermissionTest.java"
        "src/android/permission/cts/NoSystemFunctionPermissionTest.java"
        "src/android/permission/cts/NoWakeLockPermissionTest.java"
        "src/android/permission/cts/NoWallpaperPermissionsTest.java"
        "src/android/permission/cts/NoWifiStatePermissionTest.java"
        "src/android/permission/cts/NotificationListener.java"
        "src/android/permission/cts/OneTimePermissionTest.java"
        "src/android/permission/cts/PackageManagerRequiringPermissionsTest.java"
        "src/android/permission/cts/PermissionControllerTest.java"
        "src/android/permission/cts/PermissionFlagsTest.java"
        "src/android/permission/cts/PermissionGroupChange.java"
        "src/android/permission/cts/PermissionStubActivity.java"
        "src/android/permission/cts/PermissionUpdateListenerTest.java"
        "src/android/permission/cts/PowerManagerServicePermissionTest.java"
        "src/android/permission/cts/ProviderPermissionTest.java"
        "src/android/permission/cts/RebootPermissionTest.java"
        "src/android/permission/cts/RemovePermissionTest.java"
        "src/android/permission/cts/RuntimePermissionPresentationInfoTest.java"
        "src/android/permission/cts/SecureElementPermissionTest.java"
        "src/android/permission/cts/ServicePermissionTest.java"
        "src/android/permission/cts/ServicesInstantAppsCannotAccessTests.java"
        "src/android/permission/cts/SharedUidPermissionsTest.java"
        "src/android/permission/cts/ShellPermissionTest.java"
        "src/android/permission/cts/SmsManagerPermissionTest.java"
        "src/android/permission/cts/SplitPermissionTest.java"
        "src/android/permission/cts/SplitPermissionsSystemTest.java"
        "src/android/permission/cts/TvPermissionTest.java"
        "src/android/permission/cts/appthataccesseslocation/IAccessLocationOnCommand.aidl"
        "src/android/permission/cts/UndefinedGroupPermissionTest.kt"
    ];
    sdk_version = "test_current";
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
};

in { inherit CtsPermissionTestCases; }
