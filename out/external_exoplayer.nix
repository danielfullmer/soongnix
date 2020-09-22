{ android_library, java_library }:
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

#  Exposes ExoPlayer classes required for implementing the MediaParser API.
exoplayer2-extractor = android_library {
    name = "exoplayer2-extractor";
    manifest = "tree/library/extractor/src/main/AndroidManifest.xml";
    srcs = [
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/BinarySearchSeeker.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/CeaUtil.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ChunkIndex.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ConstantBitrateSeekMap.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/DefaultExtractorInput.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/DefaultExtractorsFactory.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/DummyExtractorOutput.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/DummyTrackOutput.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/Extractor.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ExtractorInput.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ExtractorOutput.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ExtractorUtil.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ExtractorsFactory.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/FlacFrameReader.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/FlacMetadataReader.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/FlacSeekTableSeekMap.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/FlacStreamMetadata.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/GaplessInfoHolder.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/Id3Peeker.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/PositionHolder.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/SeekMap.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/SeekPoint.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/TrackOutput.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/VorbisBitArray.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/VorbisUtil.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/package-info.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/amr/AmrExtractor.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/amr/package-info.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/flac/FlacBinarySearchSeeker.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/flac/FlacExtractor.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/flac/package-info.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/flv/AudioTagPayloadReader.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/flv/FlvExtractor.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/flv/ScriptTagPayloadReader.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/flv/TagPayloadReader.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/flv/VideoTagPayloadReader.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/flv/package-info.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/mkv/DefaultEbmlReader.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/mkv/EbmlProcessor.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/mkv/EbmlReader.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/mkv/MatroskaExtractor.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/mkv/Sniffer.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/mkv/VarintReader.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/mkv/package-info.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/mp3/ConstantBitrateSeeker.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/mp3/IndexSeeker.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/mp3/MlltSeeker.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/mp3/Mp3Extractor.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/mp3/Seeker.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/mp3/VbriSeeker.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/mp3/XingSeeker.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/mp3/package-info.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/mp4/Atom.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/mp4/AtomParsers.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/mp4/DefaultSampleValues.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/mp4/FixedSampleSizeRechunker.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/mp4/FragmentedMp4Extractor.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/mp4/MdtaMetadataEntry.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/mp4/MetadataUtil.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/mp4/Mp4Extractor.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/mp4/PsshAtomUtil.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/mp4/Sniffer.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/mp4/Track.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/mp4/TrackEncryptionBox.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/mp4/TrackFragment.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/mp4/TrackSampleTable.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/mp4/package-info.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ogg/DefaultOggSeeker.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ogg/FlacReader.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ogg/OggExtractor.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ogg/OggPacket.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ogg/OggPageHeader.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ogg/OggSeeker.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ogg/OpusReader.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ogg/StreamReader.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ogg/VorbisReader.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ogg/package-info.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/rawcc/RawCcExtractor.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/rawcc/package-info.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ts/Ac3Extractor.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ts/Ac3Reader.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ts/Ac4Extractor.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ts/Ac4Reader.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ts/AdtsExtractor.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ts/AdtsReader.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ts/DefaultTsPayloadReaderFactory.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ts/DtsReader.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ts/DvbSubtitleReader.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ts/ElementaryStreamReader.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ts/H262Reader.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ts/H264Reader.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ts/H265Reader.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ts/Id3Reader.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ts/LatmReader.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ts/MpegAudioReader.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ts/NalUnitTargetBuffer.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ts/PassthroughSectionPayloadReader.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ts/PesReader.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ts/PsBinarySearchSeeker.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ts/PsDurationReader.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ts/PsExtractor.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ts/SectionPayloadReader.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ts/SectionReader.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ts/SeiReader.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ts/TsBinarySearchSeeker.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ts/TsDurationReader.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ts/TsExtractor.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ts/TsPayloadReader.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ts/TsUtil.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ts/UserDataReader.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/ts/package-info.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/wav/WavExtractor.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/wav/WavHeader.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/wav/WavHeaderReader.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/wav/WavSeekMap.java"
        "tree/library/extractor/src/main/java/com/google/android/exoplayer2/extractor/wav/package-info.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/C.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/ExoPlayerLibraryInfo.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/Format.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/MediaItem.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/MediaMetadata.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/ParserException.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/package-info.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/audio/AacUtil.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/audio/Ac3Util.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/audio/Ac4Util.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/audio/DtsUtil.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/audio/MpegAudioUtil.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/audio/WavUtil.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/audio/package-info.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/decoder/Buffer.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/decoder/CryptoInfo.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/decoder/DecoderInputBuffer.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/decoder/package-info.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/drm/DrmInitData.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/drm/ExoMediaCrypto.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/drm/package-info.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/metadata/Metadata.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/metadata/MetadataDecoder.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/metadata/MetadataInputBuffer.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/metadata/package-info.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/metadata/emsg/EventMessage.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/metadata/emsg/EventMessageDecoder.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/metadata/emsg/EventMessageEncoder.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/metadata/emsg/package-info.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/metadata/flac/PictureFrame.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/metadata/flac/VorbisComment.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/metadata/flac/package-info.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/metadata/id3/ApicFrame.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/metadata/id3/BinaryFrame.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/metadata/id3/ChapterFrame.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/metadata/id3/ChapterTocFrame.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/metadata/id3/CommentFrame.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/metadata/id3/GeobFrame.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/metadata/id3/Id3Decoder.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/metadata/id3/Id3Frame.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/metadata/id3/InternalFrame.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/metadata/id3/MlltFrame.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/metadata/id3/PrivFrame.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/metadata/id3/TextInformationFrame.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/metadata/id3/UrlLinkFrame.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/metadata/id3/package-info.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/offline/StreamKey.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/offline/package-info.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/upstream/DataReader.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/upstream/DataSource.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/upstream/DataSourceException.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/upstream/DataSpec.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/upstream/HttpDataSource.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/upstream/TransferListener.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/upstream/package-info.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/util/Assertions.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/util/CodecSpecificDataUtil.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/util/CopyOnWriteMultiset.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/util/FlacConstants.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/util/Function.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/util/Log.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/util/LongArray.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/util/MimeTypes.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/util/NalUnitUtil.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/util/NonNullApi.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/util/ParsableBitArray.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/util/ParsableByteArray.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/util/ParsableNalUnitBitArray.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/util/Predicate.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/util/Supplier.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/util/TimestampAdjuster.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/util/TraceUtil.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/util/UnknownNull.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/util/Util.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/util/package-info.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/video/AvcConfig.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/video/ColorInfo.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/video/DolbyVisionConfig.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/video/HevcConfig.java"
        "tree/library/common/src/main/java/com/google/android/exoplayer2/video/package-info.java"
    ];
    sdk_version = "29"; #  Needs to be a prebuilt, so not "current".
    apex_available = [
        "com.android.media"
    ];
    min_sdk_version = "16"; #  match with tree/constants.gradle
    static_libs = [
        "exoplayer2-extractor-annotation-stubs"
        "androidx.annotation_annotation"
        "jsr305"
    ];
    jarjar_rules = "exoplayer2-extractor-jarjar-rules.txt";
    visibility = ["//frameworks/base:__subpackages__"];
    notice = "LICENSE";
};

#  Compile dummy implementations of annotations used by exoplayer but not
#  present in the Android tree.
exoplayer2-extractor-annotation-stubs = java_library {
    name = "exoplayer2-extractor-annotation-stubs";
    host_supported = true;
    sdk_version = "core_current";
    apex_available = [
        "com.android.media"
    ];
    min_sdk_version = "16";
    srcs = [
        "annotation-stubs/src/kotlin/annotations/jvm/MigrationStatus.java"
        "annotation-stubs/src/kotlin/annotations/jvm/UnderMigration.java"
        "annotation-stubs/src/org/checkerframework/checker/initialization/qual/UnknownInitialization.java"
        "annotation-stubs/src/org/checkerframework/checker/nullness/compatqual/NullableType.java"
        "annotation-stubs/src/org/checkerframework/checker/nullness/qual/EnsuresNonNull.java"
        "annotation-stubs/src/org/checkerframework/checker/nullness/qual/EnsuresNonNullIf.java"
        "annotation-stubs/src/org/checkerframework/checker/nullness/qual/MonotonicNonNull.java"
        "annotation-stubs/src/org/checkerframework/checker/nullness/qual/Nullable.java"
        "annotation-stubs/src/org/checkerframework/checker/nullness/qual/PolyNull.java"
        "annotation-stubs/src/org/checkerframework/checker/nullness/qual/RequiresNonNull.java"
    ];
    static_libs = ["jsr305"];
    visibility = ["//visibility:private"];
};

#  Exposes util classes for testing MediaParser.
exoplayer2-extractor-test-utils = android_library {
    name = "exoplayer2-extractor-test-utils";
    manifest = "tree/library/extractor/src/test/AndroidManifest.xml";
    srcs = [
        "tree/testutils/src/main/java/com/google/android/exoplayer2/testutil/Dumper.java"
        "tree/testutils/src/main/java/com/google/android/exoplayer2/testutil/FakeExtractorInput.java"
        "tree/testutils/src/main/java/com/google/android/exoplayer2/testutil/FakeExtractorOutput.java"
        "tree/testutils/src/main/java/com/google/android/exoplayer2/testutil/FakeTrackOutput.java"
        "tree/testutils/src/main/java/com/google/android/exoplayer2/testutil/TestUtil.java"
        "tree/library/core/src/main/java/com/google/android/exoplayer2/database/DatabaseProvider.java"
        "tree/library/core/src/main/java/com/google/android/exoplayer2/database/DefaultDatabaseProvider.java"
    ];
    sdk_version = "29";
    static_libs = [
        "exoplayer2-extractor"
        "exoplayer2-extractor-annotation-stubs"
        "androidx.annotation_annotation"
        "truth-prebuilt"
        "junit"
        "androidx.test.core"
    ];
    jarjar_rules = "exoplayer2-extractor-jarjar-rules.txt";
    visibility = ["//cts/tests/tests/mediaparser:__subpackages__"];
    notice = "LICENSE";
};

#  Exposes the assets for testing MediaParser.
exoplayer2-extractor-tests-assets = android_library {
    name = "exoplayer2-extractor-tests-assets";
    manifest = "tree/library/extractor/src/main/AndroidManifest.xml";
    srcs = [];
    sdk_version = "29";
    visibility = ["//cts/tests/tests/mediaparser:__subpackages__"];
    asset_dirs = ["tree/testdata/src/test/assets/"];
    #  Do not compress media files.
    aaptflags = [
        "-0 .ac3"
        "-0 .ac4"
        "-0 .adts"
        "-0 .amr"
        "-0 .eac3"
        "-0 .flac"
        "-0 .flv"
        "-0 .id3"
        "-0 .mkv"
        "-0 .mp3"
        "-0 .mp4"
        "-0 .mpg"
        "-0 .ogg"
        "-0 .opus"
        "-0 .ps"
        "-0 .rawcc"
        "-0 .ts"
        "-0 .wav"
        "-0 .webm"
    ];
};

in { inherit exoplayer2-extractor exoplayer2-extractor-annotation-stubs exoplayer2-extractor-test-utils exoplayer2-extractor-tests-assets; }
