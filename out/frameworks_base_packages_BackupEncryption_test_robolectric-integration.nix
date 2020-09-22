{ android_robolectric_test }:
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

BackupEncryptionRoboIntegTests = android_robolectric_test {
    name = "BackupEncryptionRoboIntegTests";
    srcs = [
        "src/com/android/server/backup/encryption/RoundTripTest.java"
    ];
    java_resource_dirs = ["config"];
    libs = [
        "backup-encryption-protos"
        "platform-test-annotations"
        "testng"
        "truth-prebuilt"
        "BackupEncryptionRoboTests"
    ];
    static_libs = [
        "androidx.test.core"
        "androidx.test.runner"
        "androidx.test.rules"
    ];
    instrumentation_for = "BackupEncryption";
};

in { inherit BackupEncryptionRoboIntegTests; }