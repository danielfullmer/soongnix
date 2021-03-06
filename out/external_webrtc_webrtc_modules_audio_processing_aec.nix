{ cc_library_static }:
let

#  Copyright (c) 2012 The WebRTC project authors. All Rights Reserved.
#
#  Use of this source code is governed by a BSD-style license
#  that can be found in the LICENSE file in the root of the source
#  tree. An additional intellectual property rights grant can be found
#  in the file PATENTS.  All contributing project authors may
#  be found in the AUTHORS file in the root of the source tree.

libwebrtc_aec = cc_library_static {
    name = "libwebrtc_aec";
    defaults = ["webrtc_flags"];

    srcs = [
        "echo_cancellation.c"
        "aec_resampler.c"
        "aec_core.c"
        "aec_rdft.c"
    ];

    arch = {
        arm = {
            instruction_set = "thumb";
        };
        x86 = {
            srcs = [
                "aec_core_sse2.c"
                "aec_rdft_sse2.c"
            ];
        };
        x86_64 = {
            srcs = [
                "aec_core_sse2.c"
                "aec_rdft_sse2.c"
            ];
        };
    };

    static_libs = [
        "libwebrtc_apm_utility"
        "libwebrtc_spl"
    ];
};

in { inherit libwebrtc_aec; }
