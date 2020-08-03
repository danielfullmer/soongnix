{ cc_library_static }:
let

#  Copyright (c) 2011 The WebRTC project authors. All Rights Reserved.
#
#  Use of this source code is governed by a BSD-style license
#  that can be found in the LICENSE file in the root of the source
#  tree. An additional intellectual property rights grant can be found
#  in the file PATENTS.  All contributing project authors may
#  be found in the AUTHORS file in the root of the source tree.

libwebrtc_apm_utility = cc_library_static {
    name = "libwebrtc_apm_utility";
    defaults = ["webrtc_flags"];

    srcs = [
        "delay_estimator.c"
        "delay_estimator_wrapper.c"
    ];

    export_include_dirs = ["."];
    static_libs = ["libwebrtc_spl"];
};

in { inherit libwebrtc_apm_utility; }
