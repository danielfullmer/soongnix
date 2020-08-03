{ cc_library_static }:
let

#  Copyright (c) 2015 The WebRTC project authors. All Rights Reserved.
#
#  Use of this source code is governed by a BSD-style license
#  that can be found in the LICENSE file in the root of the source
#  tree. An additional intellectual property rights grant can be found
#  in the file PATENTS.  All contributing project authors may
#  be found in the AUTHORS file in the root of the source tree.

libwebrtc_beamformer = cc_library_static {
    name = "libwebrtc_beamformer";
    defaults = ["webrtc_flags"];

    srcs = [
        "array_util.cc"
        "covariance_matrix_generator.cc"
        "nonlinear_beamformer.cc"
    ];
};

in { inherit libwebrtc_beamformer; }
