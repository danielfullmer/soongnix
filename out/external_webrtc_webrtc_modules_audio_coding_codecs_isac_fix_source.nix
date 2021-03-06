{ cc_library_static }:
let

#  Copyright (c) 2012 The WebRTC project authors. All Rights Reserved.
#
#  Use of this source code is governed by a BSD-style license
#  that can be found in the LICENSE file in the root of the source
#  tree. An additional intellectual property rights grant can be found
#  in the file PATENTS.  All contributing project authors may
#  be found in the AUTHORS file in the root of the source tree.

libwebrtc_isacfix = cc_library_static {
    name = "libwebrtc_isacfix";
    defaults = ["webrtc_flags"];

    arch = {
        arm = {
            #  Using .S (instead of .s) extention is to include a C header file in assembly.
            srcs = [
                "lattice_armv7.S"
                "pitch_filter_armv6.S"
            ];
            exclude_srcs = [
                "lattice_c.c"
                "pitch_filter_c.c"
            ];
        };
        mips = {
            #  TODO: Use pitch_estimator_mips.c for mips, pitch_estimator_c.c
        };
    };

    srcs = [
        "arith_routines.c"
        "arith_routines_hist.c"
        "arith_routines_logist.c"
        "bandwidth_estimator.c"
        "decode.c"
        "decode_bwe.c"
        "decode_plc.c"
        "encode.c"
        "entropy_coding.c"
        "fft.c"
        "filterbank_tables.c"
        "filterbanks.c"
        "filters.c"
        "initialize.c"
        "isacfix.c"
        "lattice.c"
        "lpc_masking_model.c"
        "lpc_tables.c"
        "pitch_estimator.c"
        "pitch_estimator_c.c"
        "pitch_filter.c"
        "pitch_gain_tables.c"
        "pitch_lag_tables.c"
        "spectrum_ar_model_tables.c"
        "transform_tables.c"
        "transform.c"

        #  These are replaced by assembly versions in arm builds
        "lattice_c.c"
        "pitch_filter_c.c"
    ];

    header_libs = ["libwebrtc_isacfix_headers"];
    export_header_lib_headers = ["libwebrtc_isacfix_headers"];
    static_libs = ["libwebrtc_spl"];
};

in { inherit libwebrtc_isacfix; }
