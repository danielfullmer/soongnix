{ java_library_host, java_library_static }:
let

#
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
#

apkzlib_zip = java_library_static {
    name = "apkzlib_zip";
    sdk_version = "24";
    srcs = [
        "src/main/java/com/android/tools/build/apkzlib/utils/ApkZLibPair.java"
        "src/main/java/com/android/tools/build/apkzlib/utils/CachedFileContents.java"
        "src/main/java/com/android/tools/build/apkzlib/utils/CachedSupplier.java"
        "src/main/java/com/android/tools/build/apkzlib/utils/IOExceptionConsumer.java"
        "src/main/java/com/android/tools/build/apkzlib/utils/IOExceptionFunction.java"
        "src/main/java/com/android/tools/build/apkzlib/utils/IOExceptionRunnable.java"
        "src/main/java/com/android/tools/build/apkzlib/utils/IOExceptionWrapper.java"
        "src/main/java/com/android/tools/build/apkzlib/utils/package-info.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/AlignmentRule.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/AlignmentRules.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/CentralDirectory.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/CentralDirectoryHeader.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/CentralDirectoryHeaderCompressInfo.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/CompressionMethod.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/CompressionResult.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/Compressor.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/DataDescriptorType.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/EncodeUtils.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/Eocd.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/ExtraField.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/FileUseMap.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/FileUseMapEntry.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/GPFlags.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/InflaterByteSource.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/LazyDelegateByteSource.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/ProcessedAndRawByteSources.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/StoredEntry.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/StoredEntryType.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/VerifyLog.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/VerifyLogs.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/ZFile.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/ZFileExtension.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/ZFileOptions.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/ZipField.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/ZipFieldInvariant.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/ZipFieldInvariantMaxValue.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/ZipFieldInvariantNonNegative.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/ZipFileState.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/compress/BestAndDefaultDeflateExecutorCompressor.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/compress/DeflateExecutionCompressor.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/compress/ExecutorCompressor.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/compress/Zip64NotSupportedException.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/compress/package-info.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/utils/ByteTracker.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/utils/CloseableByteSource.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/utils/CloseableDelegateByteSource.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/utils/LittleEndianUtils.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/utils/MsDosDateTimeUtils.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/utils/RandomAccessFileUtils.java"
    ];
    static_libs = ["guava"];
};

apkzlib = java_library_host {
    name = "apkzlib";
    srcs = [
        "src/main/java/com/android/tools/build/apkzlib/sign/DigestAlgorithm.java"
        "src/main/java/com/android/tools/build/apkzlib/sign/ManifestGenerationExtension.java"
        "src/main/java/com/android/tools/build/apkzlib/sign/SignatureAlgorithm.java"
        "src/main/java/com/android/tools/build/apkzlib/sign/SigningExtension.java"
        "src/main/java/com/android/tools/build/apkzlib/sign/ZFileDataSource.java"
        "src/main/java/com/android/tools/build/apkzlib/sign/package-info.java"
        "src/main/java/com/android/tools/build/apkzlib/utils/ApkZLibPair.java"
        "src/main/java/com/android/tools/build/apkzlib/utils/CachedFileContents.java"
        "src/main/java/com/android/tools/build/apkzlib/utils/CachedSupplier.java"
        "src/main/java/com/android/tools/build/apkzlib/utils/IOExceptionConsumer.java"
        "src/main/java/com/android/tools/build/apkzlib/utils/IOExceptionFunction.java"
        "src/main/java/com/android/tools/build/apkzlib/utils/IOExceptionRunnable.java"
        "src/main/java/com/android/tools/build/apkzlib/utils/IOExceptionWrapper.java"
        "src/main/java/com/android/tools/build/apkzlib/utils/package-info.java"
        "src/main/java/com/android/tools/build/apkzlib/zfile/ApkCreator.java"
        "src/main/java/com/android/tools/build/apkzlib/zfile/ApkCreatorFactory.java"
        "src/main/java/com/android/tools/build/apkzlib/zfile/ApkZFileCreator.java"
        "src/main/java/com/android/tools/build/apkzlib/zfile/ApkZFileCreatorFactory.java"
        "src/main/java/com/android/tools/build/apkzlib/zfile/ManifestAttributes.java"
        "src/main/java/com/android/tools/build/apkzlib/zfile/NativeLibrariesPackagingMode.java"
        "src/main/java/com/android/tools/build/apkzlib/zfile/ZFiles.java"
        "src/main/java/com/android/tools/build/apkzlib/zfile/package-info.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/AlignmentRule.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/AlignmentRules.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/CentralDirectory.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/CentralDirectoryHeader.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/CentralDirectoryHeaderCompressInfo.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/CompressionMethod.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/CompressionResult.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/Compressor.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/DataDescriptorType.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/EncodeUtils.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/Eocd.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/ExtraField.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/FileUseMap.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/FileUseMapEntry.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/GPFlags.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/InflaterByteSource.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/LazyDelegateByteSource.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/ProcessedAndRawByteSources.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/StoredEntry.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/StoredEntryType.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/VerifyLog.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/VerifyLogs.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/ZFile.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/ZFileExtension.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/ZFileOptions.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/ZipField.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/ZipFieldInvariant.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/ZipFieldInvariantMaxValue.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/ZipFieldInvariantNonNegative.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/ZipFileState.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/compress/BestAndDefaultDeflateExecutorCompressor.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/compress/DeflateExecutionCompressor.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/compress/ExecutorCompressor.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/compress/Zip64NotSupportedException.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/compress/package-info.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/utils/ByteTracker.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/utils/CloseableByteSource.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/utils/CloseableDelegateByteSource.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/utils/LittleEndianUtils.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/utils/MsDosDateTimeUtils.java"
        "src/main/java/com/android/tools/build/apkzlib/zip/utils/RandomAccessFileUtils.java"
    ];
    static_libs = [
        "guava"
        "apksig"
    ];
};

in { inherit apkzlib apkzlib_zip; }
