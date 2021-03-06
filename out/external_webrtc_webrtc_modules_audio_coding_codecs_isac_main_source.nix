{ cc_library_static }:
let

#  Copyright (c) 2011 The WebRTC project authors. All Rights Reserved.
#
#  Use of this source code is governed by a BSD-style license
#  that can be found in the LICENSE file in the root of the source
#  tree. An additional intellectual property rights grant can be found
#  in the file PATENTS.  All contributing project authors may
#  be found in the AUTHORS file in the root of the source tree.

libwebrtc_isac = cc_library_static {
    name = "libwebrtc_isac";
    defaults = ["webrtc_flags"];

    srcs = [
        "arith_routines.c"
        "arith_routines_hist.c"
        "arith_routines_logist.c"
        "bandwidth_estimator.c"
        "crc.c"
        "decode.c"
        "decode_bwe.c"
        "encode.c"
        "encode_lpc_swb.c"
        "entropy_coding.c"
        "fft.c"
        "filter_functions.c"
        "filterbank_tables.c"
        "filterbanks.c"
        "intialize.c"
        "isac.c"
        "pitch_lag_tables.c"
        "lattice.c"
        "lpc_gain_swb_tables.c"
        "lpc_analysis.c"
        "lpc_shape_swb12_tables.c"
        "lpc_shape_swb16_tables.c"
        "lpc_tables.c"
        "pitch_estimator.c"
        "pitch_filter.c"
        "pitch_gain_tables.c"
        "spectrum_ar_model_tables.c"
        "transform.c"
    ];

    header_libs = ["libwebrtc_isac_interface"];
    static_libs = ["libwebrtc_spl"];
};

in { inherit libwebrtc_isac; }
