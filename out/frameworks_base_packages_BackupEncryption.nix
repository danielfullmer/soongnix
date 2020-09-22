{ android_app, java_library }:
let

#
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
#

BackupEncryption = android_app {
    name = "BackupEncryption";
    srcs = [
        "src/com/android/server/backup/encryption/BackupEncryptionService.java"
        "src/com/android/server/backup/encryption/CryptoSettings.java"
        "src/com/android/server/backup/encryption/EncryptionKeyHelper.java"
        "src/com/android/server/backup/encryption/FullBackupDataProcessor.java"
        "src/com/android/server/backup/encryption/FullRestoreDataProcessor.java"
        "src/com/android/server/backup/encryption/FullRestoreDownloader.java"
        "src/com/android/server/backup/encryption/KeyValueEncrypter.java"
        "src/com/android/server/backup/encryption/StreamUtils.java"
        "src/com/android/server/backup/encryption/chunk/ChunkHash.java"
        "src/com/android/server/backup/encryption/chunk/ChunkListingMap.java"
        "src/com/android/server/backup/encryption/chunk/ChunkOrderingType.java"
        "src/com/android/server/backup/encryption/chunk/EncryptedChunkOrdering.java"
        "src/com/android/server/backup/encryption/chunking/BackupFileBuilder.java"
        "src/com/android/server/backup/encryption/chunking/BackupWriter.java"
        "src/com/android/server/backup/encryption/chunking/ByteRange.java"
        "src/com/android/server/backup/encryption/chunking/ChunkEncryptor.java"
        "src/com/android/server/backup/encryption/chunking/ChunkHasher.java"
        "src/com/android/server/backup/encryption/chunking/Chunker.java"
        "src/com/android/server/backup/encryption/chunking/DecryptedChunkFileOutput.java"
        "src/com/android/server/backup/encryption/chunking/DiffScriptBackupWriter.java"
        "src/com/android/server/backup/encryption/chunking/DiffScriptWriter.java"
        "src/com/android/server/backup/encryption/chunking/EncryptedChunk.java"
        "src/com/android/server/backup/encryption/chunking/EncryptedChunkEncoder.java"
        "src/com/android/server/backup/encryption/chunking/InlineLengthsEncryptedChunkEncoder.java"
        "src/com/android/server/backup/encryption/chunking/LengthlessEncryptedChunkEncoder.java"
        "src/com/android/server/backup/encryption/chunking/OutputStreamWrapper.java"
        "src/com/android/server/backup/encryption/chunking/ProtoStore.java"
        "src/com/android/server/backup/encryption/chunking/RawBackupWriter.java"
        "src/com/android/server/backup/encryption/chunking/SingleStreamDiffScriptWriter.java"
        "src/com/android/server/backup/encryption/chunking/cdc/ContentDefinedChunker.java"
        "src/com/android/server/backup/encryption/chunking/cdc/FingerprintMixer.java"
        "src/com/android/server/backup/encryption/chunking/cdc/Hkdf.java"
        "src/com/android/server/backup/encryption/chunking/cdc/IsChunkBreakpoint.java"
        "src/com/android/server/backup/encryption/chunking/cdc/RabinFingerprint64.java"
        "src/com/android/server/backup/encryption/client/CryptoBackupServer.java"
        "src/com/android/server/backup/encryption/client/UnexpectedActiveSecondaryOnServerException.java"
        "src/com/android/server/backup/encryption/keys/KeyWrapUtils.java"
        "src/com/android/server/backup/encryption/keys/RecoverableKeyStoreSecondaryKey.java"
        "src/com/android/server/backup/encryption/keys/RecoverableKeyStoreSecondaryKeyManager.java"
        "src/com/android/server/backup/encryption/keys/RestoreKeyFetcher.java"
        "src/com/android/server/backup/encryption/keys/SecondaryKeyRotationScheduler.java"
        "src/com/android/server/backup/encryption/keys/TertiaryKeyGenerator.java"
        "src/com/android/server/backup/encryption/keys/TertiaryKeyManager.java"
        "src/com/android/server/backup/encryption/keys/TertiaryKeyRotationScheduler.java"
        "src/com/android/server/backup/encryption/keys/TertiaryKeyRotationTracker.java"
        "src/com/android/server/backup/encryption/keys/TertiaryKeyRotationWindowedCount.java"
        "src/com/android/server/backup/encryption/keys/TertiaryKeyStore.java"
        "src/com/android/server/backup/encryption/kv/DecryptedChunkKvOutput.java"
        "src/com/android/server/backup/encryption/kv/KeyValueListingBuilder.java"
        "src/com/android/server/backup/encryption/storage/BackupEncryptionDb.java"
        "src/com/android/server/backup/encryption/storage/BackupEncryptionDbContract.java"
        "src/com/android/server/backup/encryption/storage/BackupEncryptionDbHelper.java"
        "src/com/android/server/backup/encryption/storage/EncryptionDbException.java"
        "src/com/android/server/backup/encryption/storage/TertiaryKey.java"
        "src/com/android/server/backup/encryption/storage/TertiaryKeysTable.java"
        "src/com/android/server/backup/encryption/tasks/ActiveSecondaryNotInKeychainException.java"
        "src/com/android/server/backup/encryption/tasks/BackupEncrypter.java"
        "src/com/android/server/backup/encryption/tasks/BackupFileDecryptorTask.java"
        "src/com/android/server/backup/encryption/tasks/BackupStreamEncrypter.java"
        "src/com/android/server/backup/encryption/tasks/ClearCryptoStateTask.java"
        "src/com/android/server/backup/encryption/tasks/DecryptedChunkOutput.java"
        "src/com/android/server/backup/encryption/tasks/EncryptedBackupTask.java"
        "src/com/android/server/backup/encryption/tasks/EncryptedFullBackupDataProcessor.java"
        "src/com/android/server/backup/encryption/tasks/EncryptedFullBackupTask.java"
        "src/com/android/server/backup/encryption/tasks/EncryptedFullRestoreTask.java"
        "src/com/android/server/backup/encryption/tasks/EncryptedKvBackupTask.java"
        "src/com/android/server/backup/encryption/tasks/EncryptedKvRestoreTask.java"
        "src/com/android/server/backup/encryption/tasks/EncryptedRestoreException.java"
        "src/com/android/server/backup/encryption/tasks/FullRestoreToFileTask.java"
        "src/com/android/server/backup/encryption/tasks/InitializeRecoverableSecondaryKeyTask.java"
        "src/com/android/server/backup/encryption/tasks/KvBackupEncrypter.java"
        "src/com/android/server/backup/encryption/tasks/MalformedEncryptedFileException.java"
        "src/com/android/server/backup/encryption/tasks/MessageDigestMismatchException.java"
        "src/com/android/server/backup/encryption/tasks/NoActiveSecondaryKeyException.java"
        "src/com/android/server/backup/encryption/tasks/NonIncrementalBackupRequiredException.java"
        "src/com/android/server/backup/encryption/tasks/RotateSecondaryKeyTask.java"
        "src/com/android/server/backup/encryption/tasks/SizeQuotaExceededException.java"
        "src/com/android/server/backup/encryption/tasks/StartSecondaryKeyRotationTask.java"
        "src/com/android/server/backup/encryption/tasks/UnsupportedEncryptedFileException.java"
        "src/com/android/server/backup/encryption/transport/IntermediateEncryptingTransport.java"
        "src/com/android/server/backup/encryption/transport/IntermediateEncryptingTransportManager.java"
    ];
    static_libs = [
        "backup-encryption-protos"
        "backuplib"
    ];
    optimize = {
        enabled = false;
    };
    platform_apis = true;
    certificate = "platform";
    privileged = true;
};

backup-encryption-protos = java_library {
    name = "backup-encryption-protos";
    proto = {
        type = "nano";
    };
    srcs = [
        "proto/backup_chunks_metadata.proto"
        "proto/key_value_listing.proto"
        "proto/key_value_pair.proto"
        "proto/wrapped_key.proto"
    ];
};

in { inherit BackupEncryption backup-encryption-protos; }
