{ filegroup }:
let

#
#  Copyright (C) 2020 The Android Open Source Project
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

media_omx_audio_res = filegroup {
    name = "media_omx_audio_res";
    path = "res";
    srcs = [
        "res/bbb_aac_stereo_128kbps_48000hz.aac"
        "res/bbb_aac_stereo_128kbps_48000hz.info"
        "res/bbb_amrwb_1ch_14kbps_16000hz.amrwb"
        "res/bbb_amrwb_1ch_14kbps_16000hz.info"
        "res/bbb_flac_stereo_680kbps_48000hz.flac"
        "res/bbb_flac_stereo_680kbps_48000hz.info"
        "res/bbb_g711alaw_1ch_8khz.info"
        "res/bbb_g711alaw_1ch_8khz.raw"
        "res/bbb_g711mulaw_1ch_8khz.info"
        "res/bbb_g711mulaw_1ch_8khz.raw"
        "res/bbb_gsm_1ch_8khz_13kbps.info"
        "res/bbb_gsm_1ch_8khz_13kbps.raw"
        "res/bbb_mp3_stereo_192kbps_48000hz.info"
        "res/bbb_mp3_stereo_192kbps_48000hz.mp3"
        "res/bbb_opus_stereo_128kbps_48000hz.info"
        "res/bbb_opus_stereo_128kbps_48000hz.opus"
        "res/bbb_raw_1ch_16khz_s16le.raw"
        "res/bbb_raw_1ch_8khz_s16le.raw"
        "res/bbb_raw_1ch_8khz_s32le.info"
        "res/bbb_raw_1ch_8khz_s32le.raw"
        "res/bbb_raw_2ch_48khz_s16le.raw"
        "res/bbb_vorbis_stereo_128kbps_48000hz.info"
        "res/bbb_vorbis_stereo_128kbps_48000hz.vorbis"
        "res/sine_amrnb_1ch_12kbps_8000hz.amrnb"
        "res/sine_amrnb_1ch_12kbps_8000hz.info"
    ];
};

media_omx_video_res = filegroup {
    name = "media_omx_video_res";
    path = "res";
    srcs = [
        "res/bbb_352x288_420p_30fps_32frames.yuv"
        "res/bbb_avc_176x144_300kbps_60fps.h264"
        "res/bbb_avc_176x144_300kbps_60fps.info"
        "res/bbb_avc_640x360_768kbps_30fps.h264"
        "res/bbb_avc_640x360_768kbps_30fps.info"
        "res/bbb_h263_352x288_300kbps_12fps.h263"
        "res/bbb_h263_352x288_300kbps_12fps.info"
        "res/bbb_hevc_176x144_176kbps_60fps.hevc"
        "res/bbb_hevc_176x144_176kbps_60fps.info"
        "res/bbb_hevc_640x360_1600kbps_30fps.hevc"
        "res/bbb_hevc_640x360_1600kbps_30fps.info"
        "res/bbb_mpeg2_176x144_105kbps_25fps.info"
        "res/bbb_mpeg2_176x144_105kbps_25fps.m2v"
        "res/bbb_mpeg2_352x288_1mbps_60fps.info"
        "res/bbb_mpeg2_352x288_1mbps_60fps.m2v"
        "res/bbb_mpeg4_352x288_512kbps_30fps.info"
        "res/bbb_mpeg4_352x288_512kbps_30fps.m4v"
        "res/bbb_vp8_176x144_240kbps_60fps.info"
        "res/bbb_vp8_176x144_240kbps_60fps.vp8"
        "res/bbb_vp8_640x360_2mbps_30fps.info"
        "res/bbb_vp8_640x360_2mbps_30fps.vp8"
        "res/bbb_vp9_176x144_285kbps_60fps.info"
        "res/bbb_vp9_176x144_285kbps_60fps.vp9"
        "res/bbb_vp9_640x360_1600kbps_30fps.info"
        "res/bbb_vp9_640x360_1600kbps_30fps.vp9"
    ];
};

in { inherit media_omx_audio_res media_omx_video_res; }
