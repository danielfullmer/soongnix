{ android_test_helper_app }:
let

#  Copyright (C) 2011 The Android Open Source Project
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

CtsAdminApp = android_test_helper_app {
    name = "CtsAdminApp";
    defaults = ["cts_support_defaults"];
    libs = ["guava"];
    static_libs = ["androidx.test.rules"];
    srcs = [
        "src/android/admin/app/CtsDeviceAdminActivationTestActivity.java"
        "src/android/admin/app/CtsDeviceAdminBrokenReceiver.java"
        "src/android/admin/app/CtsDeviceAdminBrokenReceiver2.java"
        "src/android/admin/app/CtsDeviceAdminBrokenReceiver3.java"
        "src/android/admin/app/CtsDeviceAdminBrokenReceiver4.java"
        "src/android/admin/app/CtsDeviceAdminBrokenReceiver5.java"
        "src/android/admin/app/CtsDeviceAdminDeactivatedReceiver.java"
        "src/android/admin/app/CtsDeviceAdminDeviceOwner.java"
        "src/android/admin/app/CtsDeviceAdminProfileOwner.java"
        "src/android/admin/app/CtsDeviceAdminReceiver.java"
        "src/android/admin/app/CtsDeviceAdminReceiver2.java"
        "src/android/admin/app/CtsDeviceAdminReceiver3.java"
        "src/android/admin/app/CtsDeviceAdminReceiverInvisible.java"
        "src/android/admin/app/CtsDeviceAdminReceiverVisible.java"
    ];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts"
        "general-tests"
    ];
    sdk_version = "current";
    dex_preopt = {
        enabled = false;
    };
};

in { inherit CtsAdminApp; }
