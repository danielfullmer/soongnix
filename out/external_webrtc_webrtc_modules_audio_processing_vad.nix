{ cc_library_static }:
let

#  Copyright (c) 2015 The WebRTC project authors. All Rights Reserved.
#
#  Use of this source code is governed by a BSD-style license
#  that can be found in the LICENSE file in the root of the source
#  tree. An additional intellectual property rights grant can be found
#  in the file PATENTS.  All contributing project authors may
#  be found in the AUTHORS file in the root of the source tree.

libwebrtc_apvad = cc_library_static {
    name = "libwebrtc_apvad";
    defaults = ["webrtc_flags"];

    srcs = [
        "gmm.cc"
        "pitch_based_vad.cc"
        "pitch_internal.cc"
        "pole_zero_filter.cc"
        "standalone_vad.cc"
        "vad_audio_proc.cc"
        "vad_circular_buffer.cc"
        "voice_activity_detector.cc"
    ];
};

in { inherit libwebrtc_apvad; }
