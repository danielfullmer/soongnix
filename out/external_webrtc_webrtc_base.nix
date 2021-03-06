{ cc_library_static }:
let

#  Copyright (c) 2015 The WebRTC project authors. All Rights Reserved.
#
#  Use of this source code is governed by a BSD-style license
#  that can be found in the LICENSE file in the root of the source
#  tree. An additional intellectual property rights grant can be found
#  in the file PATENTS.  All contributing project authors may
#  be found in the AUTHORS file in the root of the source tree.

libwebrtc_base = cc_library_static {
    name = "libwebrtc_base";
    defaults = ["webrtc_flags"];

    srcs = [
        "checks.cc"
        "criticalsection.cc"
        "event.cc"
        "event_tracer.cc"
        "logging.cc"
        "platform_file.cc"
        "platform_thread.cc"
        "stringencode.cc"
        "systeminfo.cc"
        "timeutils.cc"
    ];

    shared_libs = ["liblog"];
};

in { inherit libwebrtc_base; }
