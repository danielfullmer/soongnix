{ android_test }:
let

#
#  Copyright (C) 2009 The Android Open Source Project
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

CtsPermission2TestCases = android_test {
    name = "CtsPermission2TestCases";
    defaults = ["cts_defaults"];

    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts"
        "general-tests"
        "cts_instant"
    ];

    libs = ["android.test.base.stubs"];

    static_libs = [
        "androidx.test.core"
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
        "guava"
        "androidx.test.ext.junit-nodeps"
        "truth-prebuilt"
        "permission-test-util-lib"
    ];

    srcs = [
        "src/android/permission2/cts/CommandBroadcastReceiver.java"
        "src/android/permission2/cts/ContactsProviderTest.java"
        "src/android/permission2/cts/NoCaptureAudioOutputPermissionTest.java"
        "src/android/permission2/cts/NoLocationPermissionTest.java"
        "src/android/permission2/cts/NoProcessOutgoingCallPermissionTest.java"
        "src/android/permission2/cts/NoReceiveSmsPermissionTest.java"
        "src/android/permission2/cts/NoWriteSecureSettingsPermissionTest.java"
        "src/android/permission2/cts/PermissionMaxSdkVersionTest.java"
        "src/android/permission2/cts/PermissionPolicyTest.java"
        "src/android/permission2/cts/PrivappPermissionsTest.java"
        "src/android/permission2/cts/ProtectedBroadcastsTest.java"
        "src/android/permission2/cts/RestrictedPermissionsTest.java"
        "src/android/permission2/cts/RestrictedStoragePermissionSharedUidTest.java"
    ];

    sdk_version = "test_current";
};

in { inherit CtsPermission2TestCases; }
