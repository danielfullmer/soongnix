{ android_test_helper_app }:
let

#  Copyright (C) 2019 The Android Open Source Project
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

CtsFullBackupApp = android_test_helper_app {
    name = "CtsFullBackupApp";
    defaults = ["cts_support_defaults"];
    srcs = [
        "src/android/backup/app/FullBackupBackupAgent.java"
        "src/android/backup/app/KeyValueBackupAgent.java"
        "src/android/backup/app/MainActivity.java"
        "src/android/backup/app/WakeUpReceiver.java"
    ];
    static_libs = [
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
    ];
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    platform_apis = true;
    manifest = "fullbackup/AndroidManifest.xml";
};

CtsKeyValueBackupApp = android_test_helper_app {
    name = "CtsKeyValueBackupApp";
    defaults = ["cts_support_defaults"];
    #  Tag this module as a cts test artifact
    srcs = [
        "src/android/backup/app/FullBackupBackupAgent.java"
        "src/android/backup/app/KeyValueBackupAgent.java"
        "src/android/backup/app/MainActivity.java"
        "src/android/backup/app/WakeUpReceiver.java"
    ];
    static_libs = [
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
    ];
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    platform_apis = true;
    manifest = "keyvalue/AndroidManifest.xml";
};

CtsPermissionBackupApp = android_test_helper_app {
    name = "CtsPermissionBackupApp";
    defaults = ["cts_support_defaults"];
    #  Tag this module as a cts test artifact
    srcs = [
        "src/android/backup/app/FullBackupBackupAgent.java"
        "src/android/backup/app/KeyValueBackupAgent.java"
        "src/android/backup/app/MainActivity.java"
        "src/android/backup/app/WakeUpReceiver.java"
    ];
    static_libs = [
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
    ];
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    platform_apis = true;
    manifest = "permission/AndroidManifest.xml";
};

CtsPermissionBackupApp22 = android_test_helper_app {
    name = "CtsPermissionBackupApp22";
    defaults = ["cts_support_defaults"];
    #  Tag this module as a cts test artifact
    srcs = [
        "src/android/backup/app/FullBackupBackupAgent.java"
        "src/android/backup/app/KeyValueBackupAgent.java"
        "src/android/backup/app/MainActivity.java"
        "src/android/backup/app/WakeUpReceiver.java"
    ];
    static_libs = [
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
    ];
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    platform_apis = true;
    manifest = "permission22/AndroidManifest.xml";
};

in { inherit CtsFullBackupApp CtsKeyValueBackupApp CtsPermissionBackupApp CtsPermissionBackupApp22; }
