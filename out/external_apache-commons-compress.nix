{ java_library }:
let

apache-commons-compress = java_library {
    name = "apache-commons-compress";
    srcs = [
        "src/main/java/org/apache/commons/compress/MemoryLimitException.java"
        "src/main/java/org/apache/commons/compress/PasswordRequiredException.java"
        "src/main/java/org/apache/commons/compress/archivers/ArchiveEntry.java"
        "src/main/java/org/apache/commons/compress/archivers/ArchiveException.java"
        "src/main/java/org/apache/commons/compress/archivers/ArchiveInputStream.java"
        "src/main/java/org/apache/commons/compress/archivers/ArchiveOutputStream.java"
        "src/main/java/org/apache/commons/compress/archivers/ArchiveStreamFactory.java"
        "src/main/java/org/apache/commons/compress/archivers/ArchiveStreamProvider.java"
        "src/main/java/org/apache/commons/compress/archivers/EntryStreamOffsets.java"
        "src/main/java/org/apache/commons/compress/archivers/Lister.java"
        "src/main/java/org/apache/commons/compress/archivers/StreamingNotSupportedException.java"
        "src/main/java/org/apache/commons/compress/archivers/ar/ArArchiveEntry.java"
        "src/main/java/org/apache/commons/compress/archivers/ar/ArArchiveInputStream.java"
        "src/main/java/org/apache/commons/compress/archivers/ar/ArArchiveOutputStream.java"
        "src/main/java/org/apache/commons/compress/archivers/arj/ArjArchiveEntry.java"
        "src/main/java/org/apache/commons/compress/archivers/arj/ArjArchiveInputStream.java"
        "src/main/java/org/apache/commons/compress/archivers/arj/LocalFileHeader.java"
        "src/main/java/org/apache/commons/compress/archivers/arj/MainHeader.java"
        "src/main/java/org/apache/commons/compress/archivers/cpio/CpioArchiveEntry.java"
        "src/main/java/org/apache/commons/compress/archivers/cpio/CpioArchiveInputStream.java"
        "src/main/java/org/apache/commons/compress/archivers/cpio/CpioArchiveOutputStream.java"
        "src/main/java/org/apache/commons/compress/archivers/cpio/CpioConstants.java"
        "src/main/java/org/apache/commons/compress/archivers/cpio/CpioUtil.java"
        "src/main/java/org/apache/commons/compress/archivers/dump/Dirent.java"
        "src/main/java/org/apache/commons/compress/archivers/dump/DumpArchiveConstants.java"
        "src/main/java/org/apache/commons/compress/archivers/dump/DumpArchiveEntry.java"
        "src/main/java/org/apache/commons/compress/archivers/dump/DumpArchiveException.java"
        "src/main/java/org/apache/commons/compress/archivers/dump/DumpArchiveInputStream.java"
        "src/main/java/org/apache/commons/compress/archivers/dump/DumpArchiveSummary.java"
        "src/main/java/org/apache/commons/compress/archivers/dump/DumpArchiveUtil.java"
        "src/main/java/org/apache/commons/compress/archivers/dump/InvalidFormatException.java"
        "src/main/java/org/apache/commons/compress/archivers/dump/ShortFileException.java"
        "src/main/java/org/apache/commons/compress/archivers/dump/TapeInputStream.java"
        "src/main/java/org/apache/commons/compress/archivers/dump/UnrecognizedFormatException.java"
        "src/main/java/org/apache/commons/compress/archivers/dump/UnsupportedCompressionAlgorithmException.java"
        "src/main/java/org/apache/commons/compress/archivers/examples/Archiver.java"
        "src/main/java/org/apache/commons/compress/archivers/examples/Expander.java"
        "src/main/java/org/apache/commons/compress/archivers/jar/JarArchiveEntry.java"
        "src/main/java/org/apache/commons/compress/archivers/jar/JarArchiveInputStream.java"
        "src/main/java/org/apache/commons/compress/archivers/jar/JarArchiveOutputStream.java"
        "src/main/java/org/apache/commons/compress/archivers/sevenz/AES256SHA256Decoder.java"
        "src/main/java/org/apache/commons/compress/archivers/sevenz/Archive.java"
        "src/main/java/org/apache/commons/compress/archivers/sevenz/BindPair.java"
        "src/main/java/org/apache/commons/compress/archivers/sevenz/BoundedSeekableByteChannelInputStream.java"
        "src/main/java/org/apache/commons/compress/archivers/sevenz/CLI.java"
        "src/main/java/org/apache/commons/compress/archivers/sevenz/Coder.java"
        "src/main/java/org/apache/commons/compress/archivers/sevenz/CoderBase.java"
        "src/main/java/org/apache/commons/compress/archivers/sevenz/Coders.java"
        "src/main/java/org/apache/commons/compress/archivers/sevenz/DeltaDecoder.java"
        "src/main/java/org/apache/commons/compress/archivers/sevenz/Folder.java"
        "src/main/java/org/apache/commons/compress/archivers/sevenz/LZMA2Decoder.java"
        "src/main/java/org/apache/commons/compress/archivers/sevenz/LZMADecoder.java"
        "src/main/java/org/apache/commons/compress/archivers/sevenz/NID.java"
        "src/main/java/org/apache/commons/compress/archivers/sevenz/SevenZArchiveEntry.java"
        "src/main/java/org/apache/commons/compress/archivers/sevenz/SevenZFile.java"
        "src/main/java/org/apache/commons/compress/archivers/sevenz/SevenZMethod.java"
        "src/main/java/org/apache/commons/compress/archivers/sevenz/SevenZMethodConfiguration.java"
        "src/main/java/org/apache/commons/compress/archivers/sevenz/SevenZOutputFile.java"
        "src/main/java/org/apache/commons/compress/archivers/sevenz/StartHeader.java"
        "src/main/java/org/apache/commons/compress/archivers/sevenz/StreamMap.java"
        "src/main/java/org/apache/commons/compress/archivers/sevenz/SubStreamsInfo.java"
        "src/main/java/org/apache/commons/compress/archivers/tar/TarArchiveEntry.java"
        "src/main/java/org/apache/commons/compress/archivers/tar/TarArchiveInputStream.java"
        "src/main/java/org/apache/commons/compress/archivers/tar/TarArchiveOutputStream.java"
        "src/main/java/org/apache/commons/compress/archivers/tar/TarArchiveSparseEntry.java"
        "src/main/java/org/apache/commons/compress/archivers/tar/TarConstants.java"
        "src/main/java/org/apache/commons/compress/archivers/tar/TarUtils.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/AbstractUnicodeExtraField.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/AsiExtraField.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/BinaryTree.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/BitStream.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/CharsetAccessor.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/CircularBuffer.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/ExplodingInputStream.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/ExtraFieldUtils.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/GeneralPurposeBit.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/InflaterInputStreamWithStatistics.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/JarMarker.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/NioZipEncoding.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/PKWareExtraHeader.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/ParallelScatterZipCreator.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/ResourceAlignmentExtraField.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/ScatterStatistics.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/ScatterZipOutputStream.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/StreamCompressor.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/UnicodeCommentExtraField.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/UnicodePathExtraField.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/UnixStat.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/UnparseableExtraFieldData.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/UnrecognizedExtraField.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/UnshrinkingInputStream.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/UnsupportedZipFeatureException.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/X000A_NTFS.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/X0014_X509Certificates.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/X0015_CertificateIdForFile.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/X0016_CertificateIdForCentralDirectory.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/X0017_StrongEncryptionHeader.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/X0019_EncryptionRecipientCertificateList.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/X5455_ExtendedTimestamp.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/X7875_NewUnix.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/Zip64ExtendedInformationExtraField.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/Zip64Mode.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/Zip64RequiredException.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/ZipArchiveEntry.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/ZipArchiveEntryPredicate.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/ZipArchiveEntryRequest.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/ZipArchiveEntryRequestSupplier.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/ZipArchiveInputStream.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/ZipArchiveOutputStream.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/ZipConstants.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/ZipEightByteInteger.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/ZipEncoding.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/ZipEncodingHelper.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/ZipExtraField.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/ZipFile.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/ZipLong.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/ZipMethod.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/ZipShort.java"
        "src/main/java/org/apache/commons/compress/archivers/zip/ZipUtil.java"
        "src/main/java/org/apache/commons/compress/changes/Change.java"
        "src/main/java/org/apache/commons/compress/changes/ChangeSet.java"
        "src/main/java/org/apache/commons/compress/changes/ChangeSetPerformer.java"
        "src/main/java/org/apache/commons/compress/changes/ChangeSetResults.java"
        "src/main/java/org/apache/commons/compress/compressors/CompressorException.java"
        "src/main/java/org/apache/commons/compress/compressors/CompressorInputStream.java"
        "src/main/java/org/apache/commons/compress/compressors/CompressorOutputStream.java"
        "src/main/java/org/apache/commons/compress/compressors/CompressorStreamFactory.java"
        "src/main/java/org/apache/commons/compress/compressors/CompressorStreamProvider.java"
        "src/main/java/org/apache/commons/compress/compressors/FileNameUtil.java"
        "src/main/java/org/apache/commons/compress/compressors/brotli/BrotliCompressorInputStream.java"
        "src/main/java/org/apache/commons/compress/compressors/brotli/BrotliUtils.java"
        "src/main/java/org/apache/commons/compress/compressors/bzip2/BZip2CompressorInputStream.java"
        "src/main/java/org/apache/commons/compress/compressors/bzip2/BZip2CompressorOutputStream.java"
        "src/main/java/org/apache/commons/compress/compressors/bzip2/BZip2Constants.java"
        "src/main/java/org/apache/commons/compress/compressors/bzip2/BZip2Utils.java"
        "src/main/java/org/apache/commons/compress/compressors/bzip2/BlockSort.java"
        "src/main/java/org/apache/commons/compress/compressors/bzip2/CRC.java"
        "src/main/java/org/apache/commons/compress/compressors/bzip2/Rand.java"
        "src/main/java/org/apache/commons/compress/compressors/deflate/DeflateCompressorInputStream.java"
        "src/main/java/org/apache/commons/compress/compressors/deflate/DeflateCompressorOutputStream.java"
        "src/main/java/org/apache/commons/compress/compressors/deflate/DeflateParameters.java"
        "src/main/java/org/apache/commons/compress/compressors/deflate64/Deflate64CompressorInputStream.java"
        "src/main/java/org/apache/commons/compress/compressors/deflate64/HuffmanDecoder.java"
        "src/main/java/org/apache/commons/compress/compressors/deflate64/HuffmanState.java"
        "src/main/java/org/apache/commons/compress/compressors/gzip/GzipCompressorInputStream.java"
        "src/main/java/org/apache/commons/compress/compressors/gzip/GzipCompressorOutputStream.java"
        "src/main/java/org/apache/commons/compress/compressors/gzip/GzipParameters.java"
        "src/main/java/org/apache/commons/compress/compressors/gzip/GzipUtils.java"
        "src/main/java/org/apache/commons/compress/compressors/lz4/BlockLZ4CompressorInputStream.java"
        "src/main/java/org/apache/commons/compress/compressors/lz4/BlockLZ4CompressorOutputStream.java"
        "src/main/java/org/apache/commons/compress/compressors/lz4/FramedLZ4CompressorInputStream.java"
        "src/main/java/org/apache/commons/compress/compressors/lz4/FramedLZ4CompressorOutputStream.java"
        "src/main/java/org/apache/commons/compress/compressors/lz4/XXHash32.java"
        "src/main/java/org/apache/commons/compress/compressors/lz77support/AbstractLZ77CompressorInputStream.java"
        "src/main/java/org/apache/commons/compress/compressors/lz77support/LZ77Compressor.java"
        "src/main/java/org/apache/commons/compress/compressors/lz77support/Parameters.java"
        "src/main/java/org/apache/commons/compress/compressors/lzma/LZMACompressorInputStream.java"
        "src/main/java/org/apache/commons/compress/compressors/lzma/LZMACompressorOutputStream.java"
        "src/main/java/org/apache/commons/compress/compressors/lzma/LZMAUtils.java"
        "src/main/java/org/apache/commons/compress/compressors/lzw/LZWInputStream.java"
        "src/main/java/org/apache/commons/compress/compressors/pack200/InMemoryCachingStreamBridge.java"
        "src/main/java/org/apache/commons/compress/compressors/pack200/Pack200CompressorInputStream.java"
        "src/main/java/org/apache/commons/compress/compressors/pack200/Pack200CompressorOutputStream.java"
        "src/main/java/org/apache/commons/compress/compressors/pack200/Pack200Strategy.java"
        "src/main/java/org/apache/commons/compress/compressors/pack200/Pack200Utils.java"
        "src/main/java/org/apache/commons/compress/compressors/pack200/StreamBridge.java"
        "src/main/java/org/apache/commons/compress/compressors/pack200/TempFileCachingStreamBridge.java"
        "src/main/java/org/apache/commons/compress/compressors/snappy/FramedSnappyCompressorInputStream.java"
        "src/main/java/org/apache/commons/compress/compressors/snappy/FramedSnappyCompressorOutputStream.java"
        "src/main/java/org/apache/commons/compress/compressors/snappy/FramedSnappyDialect.java"
        "src/main/java/org/apache/commons/compress/compressors/snappy/PureJavaCrc32C.java"
        "src/main/java/org/apache/commons/compress/compressors/snappy/SnappyCompressorInputStream.java"
        "src/main/java/org/apache/commons/compress/compressors/snappy/SnappyCompressorOutputStream.java"
        "src/main/java/org/apache/commons/compress/compressors/xz/XZCompressorInputStream.java"
        "src/main/java/org/apache/commons/compress/compressors/xz/XZCompressorOutputStream.java"
        "src/main/java/org/apache/commons/compress/compressors/xz/XZUtils.java"
        "src/main/java/org/apache/commons/compress/compressors/z/ZCompressorInputStream.java"
        "src/main/java/org/apache/commons/compress/compressors/zstandard/ZstdCompressorInputStream.java"
        "src/main/java/org/apache/commons/compress/compressors/zstandard/ZstdCompressorOutputStream.java"
        "src/main/java/org/apache/commons/compress/compressors/zstandard/ZstdUtils.java"
        "src/main/java/org/apache/commons/compress/parallel/FileBasedScatterGatherBackingStore.java"
        "src/main/java/org/apache/commons/compress/parallel/InputStreamSupplier.java"
        "src/main/java/org/apache/commons/compress/parallel/ScatterGatherBackingStore.java"
        "src/main/java/org/apache/commons/compress/parallel/ScatterGatherBackingStoreSupplier.java"
        "src/main/java/org/apache/commons/compress/utils/ArchiveUtils.java"
        "src/main/java/org/apache/commons/compress/utils/BitInputStream.java"
        "src/main/java/org/apache/commons/compress/utils/BoundedInputStream.java"
        "src/main/java/org/apache/commons/compress/utils/ByteUtils.java"
        "src/main/java/org/apache/commons/compress/utils/CRC32VerifyingInputStream.java"
        "src/main/java/org/apache/commons/compress/utils/CharsetNames.java"
        "src/main/java/org/apache/commons/compress/utils/Charsets.java"
        "src/main/java/org/apache/commons/compress/utils/ChecksumCalculatingInputStream.java"
        "src/main/java/org/apache/commons/compress/utils/ChecksumVerifyingInputStream.java"
        "src/main/java/org/apache/commons/compress/utils/CloseShieldFilterInputStream.java"
        "src/main/java/org/apache/commons/compress/utils/CountingInputStream.java"
        "src/main/java/org/apache/commons/compress/utils/CountingOutputStream.java"
        "src/main/java/org/apache/commons/compress/utils/FixedLengthBlockOutputStream.java"
        "src/main/java/org/apache/commons/compress/utils/FlushShieldFilterOutputStream.java"
        "src/main/java/org/apache/commons/compress/utils/IOUtils.java"
        "src/main/java/org/apache/commons/compress/utils/InputStreamStatistics.java"
        "src/main/java/org/apache/commons/compress/utils/Iterators.java"
        "src/main/java/org/apache/commons/compress/utils/Lists.java"
        "src/main/java/org/apache/commons/compress/utils/SeekableInMemoryByteChannel.java"
        "src/main/java/org/apache/commons/compress/utils/ServiceLoaderIterator.java"
        "src/main/java/org/apache/commons/compress/utils/Sets.java"
        "src/main/java/org/apache/commons/compress/utils/SkipShieldingInputStream.java"
        "src/stub/java/com/github/luben/zstd/ZstdInputStream.java"
        "src/stub/java/com/github/luben/zstd/ZstdOutputStream.java"
        "src/stub/java/org/tukaani/xz/LZMAOutputStream.java"
    ];
    static_libs = [
        "xz-java"
        "brotli-java"
    ];
    sdk_version = "current";
};

in { inherit apache-commons-compress; }
