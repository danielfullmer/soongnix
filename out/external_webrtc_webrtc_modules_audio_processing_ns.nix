{ cc_library_static }:
let

#  Copyright (c) 2012 The WebRTC project authors. All Rights Reserved.
#
#  Use of this source code is governed by a BSD-style license
#  that can be found in the LICENSE file in the root of the source
#  tree. An additional intellectual property rights grant can be found
#  in the file PATENTS.  All contributing project authors may
#  be found in the AUTHORS file in the root of the source tree.

libwebrtc_ns = cc_library_static {
    name = "libwebrtc_ns";
    defaults = ["webrtc_flags"];

    srcs = [
        "noise_suppression_x.c"
        "nsx_core.c"
        "nsx_core_c.c"

        #  TODO: nsx_core.S, nsx_core_mips.c

        #  Files for floating point.
        #  noise_suppression.c ns_core.c
    ];

    static_libs = [
        "libwebrtc_apm_utility"
        "libwebrtc_spl"
        "libwebrtc_system_wrappers"
    ];

    arch = {
        arm = {
            instruction_set = "thumb";
        };
    };
};

in { inherit libwebrtc_ns; }
