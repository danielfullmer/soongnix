{ cc_test }:
let

#  Copyright (c) 2012 The WebRTC project authors. All Rights Reserved.
#
#  Use of this source code is governed by a BSD-style license
#  that can be found in the LICENSE file in the root of the source
#  tree. An additional intellectual property rights grant can be found
#  in the file PATENTS.  All contributing project authors may
#  be found in the AUTHORS file in the root of the source tree.

webrtc_isac_test = cc_test {
    name = "webrtc_isac_test";
    defaults = ["webrtc_flags"];

    srcs = ["kenny.cc"];

    static_libs = [
        "libwebrtc_isacfix"
        "libwebrtc_spl"
        "libwebrtc_system_wrappers"
    ];

    shared_libs = ["libutils"];

    arch = {
        arm = {
            instruction_set = "thumb";
        };
    };
};

in { inherit webrtc_isac_test; }
