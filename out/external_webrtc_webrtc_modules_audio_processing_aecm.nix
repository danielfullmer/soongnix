{ cc_library_static }:
let

#  Copyright (c) 2011 The WebRTC project authors. All Rights Reserved.
#
#  Use of this source code is governed by a BSD-style license
#  that can be found in the LICENSE file in the root of the source
#  tree. An additional intellectual property rights grant can be found
#  in the file PATENTS.  All contributing project authors may
#  be found in the AUTHORS file in the root of the source tree.

libwebrtc_aecm = cc_library_static {
    name = "libwebrtc_aecm";
    defaults = ["webrtc_flags"];

    #  TODO: use aecm_core_mips.c for mips, aecm_core_c.c
    srcs = [
        "echo_control_mobile.c"
        "aecm_core.c"
        "aecm_core_c.c"
    ];

    static_libs = [
        "libwebrtc_apm_utility"
        "libwebrtc_spl"
        "libwebrtc_system_wrappers"
    ];
};

in { inherit libwebrtc_aecm; }
