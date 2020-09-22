{ android_robolectric_test, filegroup }:
let

#  Copyright (C) 2018 The Android Open Source Project
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

BackupEncryptionRoboTests = android_robolectric_test {
    name = "BackupEncryptionRoboTests";
    srcs = [
        "src/com/android/server/backup/encryption/CryptoSettingsTest.java"
        "src/com/android/server/backup/encryption/StreamUtilsTest.java"
        "src/com/android/server/backup/encryption/chunk/ChunkHashTest.java"
        "src/com/android/server/backup/encryption/chunk/ChunkListingMapTest.java"
        "src/com/android/server/backup/encryption/chunk/EncryptedChunkOrderingTest.java"
        "src/com/android/server/backup/encryption/chunking/BackupFileBuilderTest.java"
        "src/com/android/server/backup/encryption/chunking/ByteRangeTest.java"
        "src/com/android/server/backup/encryption/chunking/ChunkEncryptorTest.java"
        "src/com/android/server/backup/encryption/chunking/ChunkHasherTest.java"
        "src/com/android/server/backup/encryption/chunking/DecryptedChunkFileOutputTest.java"
        "src/com/android/server/backup/encryption/chunking/DiffScriptBackupWriterTest.java"
        "src/com/android/server/backup/encryption/chunking/EncryptedChunkTest.java"
        "src/com/android/server/backup/encryption/chunking/InlineLengthsEncryptedChunkEncoderTest.java"
        "src/com/android/server/backup/encryption/chunking/LengthlessEncryptedChunkEncoderTest.java"
        "src/com/android/server/backup/encryption/chunking/ProtoStoreTest.java"
        "src/com/android/server/backup/encryption/chunking/RawBackupWriterTest.java"
        "src/com/android/server/backup/encryption/chunking/SingleStreamDiffScriptWriterTest.java"
        "src/com/android/server/backup/encryption/chunking/cdc/ContentDefinedChunkerTest.java"
        "src/com/android/server/backup/encryption/chunking/cdc/FingerprintMixerTest.java"
        "src/com/android/server/backup/encryption/chunking/cdc/HkdfTest.java"
        "src/com/android/server/backup/encryption/chunking/cdc/IsChunkBreakpointTest.java"
        "src/com/android/server/backup/encryption/chunking/cdc/RabinFingerprint64Test.java"
        "src/com/android/server/backup/encryption/keys/KeyWrapUtilsTest.java"
        "src/com/android/server/backup/encryption/keys/RecoverableKeyStoreSecondaryKeyManagerTest.java"
        "src/com/android/server/backup/encryption/keys/RecoverableKeyStoreSecondaryKeyTest.java"
        "src/com/android/server/backup/encryption/keys/RestoreKeyFetcherTest.java"
        "src/com/android/server/backup/encryption/keys/SecondaryKeyRotationSchedulerTest.java"
        "src/com/android/server/backup/encryption/keys/TertiaryKeyGeneratorTest.java"
        "src/com/android/server/backup/encryption/keys/TertiaryKeyManagerTest.java"
        "src/com/android/server/backup/encryption/keys/TertiaryKeyRotationSchedulerTest.java"
        "src/com/android/server/backup/encryption/keys/TertiaryKeyRotationTrackerTest.java"
        "src/com/android/server/backup/encryption/keys/TertiaryKeyRotationWindowedCountTest.java"
        "src/com/android/server/backup/encryption/keys/TertiaryKeyStoreTest.java"
        "src/com/android/server/backup/encryption/kv/DecryptedChunkKvOutputTest.java"
        "src/com/android/server/backup/encryption/kv/KeyValueListingBuilderTest.java"
        "src/com/android/server/backup/encryption/storage/BackupEncryptionDbTest.java"
        "src/com/android/server/backup/encryption/storage/TertiaryKeysTableTest.java"
        "src/com/android/server/backup/encryption/tasks/BackupFileDecryptorTaskTest.java"
        "src/com/android/server/backup/encryption/tasks/BackupStreamEncrypterTest.java"
        "src/com/android/server/backup/encryption/tasks/ClearCryptoStateTaskTest.java"
        "src/com/android/server/backup/encryption/tasks/EncryptedBackupTaskTest.java"
        "src/com/android/server/backup/encryption/tasks/EncryptedFullBackupDataProcessorTest.java"
        "src/com/android/server/backup/encryption/tasks/EncryptedFullBackupTaskTest.java"
        "src/com/android/server/backup/encryption/tasks/EncryptedFullRestoreTaskTest.java"
        "src/com/android/server/backup/encryption/tasks/EncryptedKvBackupTaskTest.java"
        "src/com/android/server/backup/encryption/tasks/EncryptedKvRestoreTaskTest.java"
        "src/com/android/server/backup/encryption/tasks/FullRestoreToFileTaskTest.java"
        "src/com/android/server/backup/encryption/tasks/InitializeRecoverableSecondaryKeyTaskTest.java"
        "src/com/android/server/backup/encryption/tasks/KvBackupEncrypterTest.java"
        "src/com/android/server/backup/encryption/tasks/RotateSecondaryKeyTaskTest.java"
        "src/com/android/server/backup/encryption/tasks/StartSecondaryKeyRotationTaskTest.java"
        "src/com/android/server/backup/encryption/testing/DiffScriptProcessor.java"
        "src/com/android/server/backup/encryption/testing/QueuingNonAutomaticExecutorService.java"
        "src/com/android/server/backup/testing/RandomInputStream.java"
        "src/com/android/server/testing/CryptoTestUtils.java"
        "src/com/android/server/testing/TestFileUtils.java"
        "src/com/android/server/testing/fakes/FakeCryptoBackupServer.java"
        "src/com/android/server/testing/fakes/FakeCryptoBackupServerTest.java"
        "src/com/android/server/testing/shadows/DataEntity.java"
        "src/com/android/server/testing/shadows/ShadowBackupDataInput.java"
        "src/com/android/server/testing/shadows/ShadowBackupDataOutput.java"
        "src/com/android/server/testing/shadows/ShadowInternalRecoveryServiceException.java"
        "src/com/android/server/testing/shadows/ShadowRecoveryController.java"
        #         ":FrameworksServicesRoboShadows",
    ];
    java_resource_dirs = ["config"];
    libs = [
        "backup-encryption-protos"
        "platform-test-annotations"
        "testng"
        "truth-prebuilt"
    ];
    static_libs = [
        "androidx.test.core"
        "androidx.test.runner"
        "androidx.test.rules"
    ];
    instrumentation_for = "BackupEncryption";
};

BackupEncryptionRoboShadows = filegroup {
    name = "BackupEncryptionRoboShadows";
    srcs = [
        "src/com/android/server/testing/shadows/DataEntity.java"
        "src/com/android/server/testing/shadows/ShadowBackupDataInput.java"
        "src/com/android/server/testing/shadows/ShadowBackupDataOutput.java"
        "src/com/android/server/testing/shadows/ShadowInternalRecoveryServiceException.java"
        "src/com/android/server/testing/shadows/ShadowRecoveryController.java"
    ];
};

in { inherit BackupEncryptionRoboShadows BackupEncryptionRoboTests; }
