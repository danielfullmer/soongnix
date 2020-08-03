{ cc_library_static }:
let

#  Copyright (c) 2011 The WebRTC project authors. All Rights Reserved.
#
#  Use of this source code is governed by a BSD-style license
#  that can be found in the LICENSE file in the root of the source
#  tree. An additional intellectual property rights grant can be found
#  in the file PATENTS.  All contributing project authors may
#  be found in the AUTHORS file in the root of the source tree.

libwebrtc_vad = cc_library_static {
    name = "libwebrtc_vad";
    defaults = ["webrtc_flags"];

    srcs = [
        "webrtc_vad.c"
        "vad_core.c"
        "vad_filterbank.c"
        "vad_gmm.c"
        "vad_sp.c"
    ];

    export_include_dirs = ["include"];
    static_libs = ["libwebrtc_spl"];
};

in { inherit libwebrtc_vad; }
