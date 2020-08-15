{ android_library }:
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

live-tv-tuner = android_library {
    name = "live-tv-tuner";
    srcs = [
        "src/com/android/tv/tuner/DvbDeviceAccessor.java"
        "src/com/android/tv/tuner/DvbTunerHal.java"
        "src/com/android/tv/tuner/TunerHal.java"
        "src/com/android/tv/tuner/api/ChannelScanListener.java"
        "src/com/android/tv/tuner/api/ScanChannel.java"
        "src/com/android/tv/tuner/api/Tuner.java"
        "src/com/android/tv/tuner/api/TunerFactory.java"
        "src/com/android/tv/tuner/builtin/BuiltInTunerHalFactory.java"
        "src/com/android/tv/tuner/cc/CaptionLayout.java"
        "src/com/android/tv/tuner/cc/CaptionTrackRenderer.java"
        "src/com/android/tv/tuner/cc/CaptionWindowLayout.java"
        "src/com/android/tv/tuner/data/Cea708Data.java"
        "src/com/android/tv/tuner/data/Cea708Parser.java"
        "src/com/android/tv/tuner/data/PsiData.java"
        "src/com/android/tv/tuner/data/PsipData.java"
        "src/com/android/tv/tuner/data/SectionParser.java"
        "src/com/android/tv/tuner/data/TunerChannel.java"
        "src/com/android/tv/tuner/exoplayer/Cea708TextTrackRenderer.java"
        "src/com/android/tv/tuner/exoplayer/ExoPlayerExtractorsFactory.java"
        "src/com/android/tv/tuner/exoplayer/ExoPlayerSampleExtractor.java"
        "src/com/android/tv/tuner/exoplayer/FileSampleExtractor.java"
        "src/com/android/tv/tuner/exoplayer/MpegTsPlayer.java"
        "src/com/android/tv/tuner/exoplayer/MpegTsRendererBuilder.java"
        "src/com/android/tv/tuner/exoplayer/MpegTsSampleExtractor.java"
        "src/com/android/tv/tuner/exoplayer/MpegTsSampleSource.java"
        "src/com/android/tv/tuner/exoplayer/MpegTsVideoTrackRenderer.java"
        "src/com/android/tv/tuner/exoplayer/SampleExtractor.java"
        "src/com/android/tv/tuner/exoplayer/audio/AudioClock.java"
        "src/com/android/tv/tuner/exoplayer/audio/AudioDecoder.java"
        "src/com/android/tv/tuner/exoplayer/audio/AudioTrackMonitor.java"
        "src/com/android/tv/tuner/exoplayer/audio/AudioTrackWrapper.java"
        "src/com/android/tv/tuner/exoplayer/audio/MediaCodecAudioDecoder.java"
        "src/com/android/tv/tuner/exoplayer/audio/MpegTsDefaultAudioTrackRenderer.java"
        "src/com/android/tv/tuner/exoplayer/audio/MpegTsMediaCodecAudioTrackRenderer.java"
        "src/com/android/tv/tuner/exoplayer/buffer/BufferManager.java"
        "src/com/android/tv/tuner/exoplayer/buffer/DvrStorageManager.java"
        "src/com/android/tv/tuner/exoplayer/buffer/PlaybackBufferListener.java"
        "src/com/android/tv/tuner/exoplayer/buffer/RecordingSampleBuffer.java"
        "src/com/android/tv/tuner/exoplayer/buffer/SampleChunk.java"
        "src/com/android/tv/tuner/exoplayer/buffer/SampleChunkIoHelper.java"
        "src/com/android/tv/tuner/exoplayer/buffer/SamplePool.java"
        "src/com/android/tv/tuner/exoplayer/buffer/SampleQueue.java"
        "src/com/android/tv/tuner/exoplayer/buffer/SimpleSampleBuffer.java"
        "src/com/android/tv/tuner/exoplayer/buffer/TrickplayStorageManager.java"
        "src/com/android/tv/tuner/exoplayer/text/SubtitleView.java"
        "src/com/android/tv/tuner/exoplayer2/VideoRendererExoV2.java"
        "src/com/android/tv/tuner/features/TunerFeatures.java"
        "src/com/android/tv/tuner/layout/ScaledLayout.java"
        "src/com/android/tv/tuner/livetuner/LiveTvTunerTvInputService.java"
        "src/com/android/tv/tuner/modules/TunerModule.java"
        "src/com/android/tv/tuner/modules/TunerSingletonsModule.java"
        "src/com/android/tv/tuner/prefs/TunerPreferences.java"
        "src/com/android/tv/tuner/setup/BaseTunerSetupActivity.java"
        "src/com/android/tv/tuner/setup/ChannelScanFileParser.java"
        "src/com/android/tv/tuner/setup/ConnectionTypeFragment.java"
        "src/com/android/tv/tuner/setup/LineupFragment.java"
        "src/com/android/tv/tuner/setup/LiveTvTunerSetupActivity.java"
        "src/com/android/tv/tuner/setup/LocationFragment.java"
        "src/com/android/tv/tuner/setup/PostalCodeFragment.java"
        "src/com/android/tv/tuner/setup/ScanFragment.java"
        "src/com/android/tv/tuner/setup/ScanResultFragment.java"
        "src/com/android/tv/tuner/setup/WelcomeFragment.java"
        "src/com/android/tv/tuner/singletons/TunerSingletons.java"
        "src/com/android/tv/tuner/source/FileSourceEventDetector.java"
        "src/com/android/tv/tuner/source/FileTsStreamer.java"
        "src/com/android/tv/tuner/source/TsDataSource.java"
        "src/com/android/tv/tuner/source/TsDataSourceManager.java"
        "src/com/android/tv/tuner/source/TsStreamWriter.java"
        "src/com/android/tv/tuner/source/TsStreamer.java"
        "src/com/android/tv/tuner/source/TunerSourceModule.java"
        "src/com/android/tv/tuner/source/TunerTsStreamer.java"
        "src/com/android/tv/tuner/source/TunerTsStreamerManager.java"
        "src/com/android/tv/tuner/ts/EventDetector.java"
        "src/com/android/tv/tuner/ts/TsParser.java"
        "src/com/android/tv/tuner/tvinput/AudioCapabilitiesReceiverV1Wrapper.java"
        "src/com/android/tv/tuner/tvinput/BaseTunerTvInputService.java"
        "src/com/android/tv/tuner/tvinput/TunerRecordingSession.java"
        "src/com/android/tv/tuner/tvinput/TunerRecordingSessionWorker.java"
        "src/com/android/tv/tuner/tvinput/TunerSession.java"
        "src/com/android/tv/tuner/tvinput/TunerSessionExoV2.java"
        "src/com/android/tv/tuner/tvinput/TunerSessionOverlay.java"
        "src/com/android/tv/tuner/tvinput/TunerSessionWorker.java"
        "src/com/android/tv/tuner/tvinput/TunerSessionWorkerExoV2.java"
        "src/com/android/tv/tuner/tvinput/TunerStorageCleanUpService.java"
        "src/com/android/tv/tuner/tvinput/datamanager/ChannelDataManager.java"
        "src/com/android/tv/tuner/tvinput/debug/TunerDebug.java"
        "src/com/android/tv/tuner/tvinput/factory/TunerSessionFactory.java"
        "src/com/android/tv/tuner/tvinput/factory/TunerSessionFactoryImpl.java"
        "src/com/android/tv/tuner/util/ByteArrayBuffer.java"
        "src/com/android/tv/tuner/util/ConvertUtils.java"
        "src/com/android/tv/tuner/util/GlobalSettingsUtils.java"
        "src/com/android/tv/tuner/util/Ints.java"
        "src/com/android/tv/tuner/util/StatusTextUtils.java"
        "src/com/google/android/exoplayer/MediaFormatUtil.java"
        "src/com/google/android/exoplayer/MediaSoftwareCodecUtil.java"
    ];
    sdk_version = "system_current";
    resource_dirs = ["res"];
    libs = [
        "tv-auto-value-jar"
        "tv-auto-factory-jar"
        "android-support-annotations"
        "tv-error-prone-annotations-jar"
        "tv-guava-android-jar"
        "tv-javax-annotations-jar"
        "jsr330"
        "tv-lib-dagger"
        "tv-lib-exoplayer"
        "tv-lib-exoplayer-v2-core"
        "live-tv-tuner-proto"
        "android-support-compat"
        "android-support-core-ui"
        "android-support-v7-palette"
        "android-support-v7-recyclerview"
        "android-support-v17-leanback"
        "androidx.tvprovider_tvprovider"
        "tv-lib-dagger-android"
        "tv-common"
    ];
    plugins = [
        "tv-auto-value"
        "tv-auto-factory"
    ];
    min_sdk_version = "23";
};

in { inherit live-tv-tuner; }
