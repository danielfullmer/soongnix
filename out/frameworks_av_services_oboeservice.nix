{ cc_library_shared }:
let

#  Copyright (C) 2019 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#       http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

libaaudioservice = cc_library_shared {

    name = "libaaudioservice";

    srcs = [
        "AAudioClientTracker.cpp"
        "AAudioEndpointManager.cpp"
        "AAudioMixer.cpp"
        "AAudioService.cpp"
        "AAudioServiceEndpoint.cpp"
        "AAudioServiceEndpointCapture.cpp"
        "AAudioServiceEndpointMMAP.cpp"
        "AAudioServiceEndpointPlay.cpp"
        "AAudioServiceEndpointShared.cpp"
        "AAudioServiceStreamBase.cpp"
        "AAudioServiceStreamMMAP.cpp"
        "AAudioServiceStreamShared.cpp"
        "AAudioStreamTracker.cpp"
        "AAudioThread.cpp"
        "SharedMemoryProxy.cpp"
        "SharedRingBuffer.cpp"
        "TimestampScheduler.cpp"
    ];

    cflags = [
        "-Wno-unused-parameter"
        "-Wall"
        "-Werror"
    ];

    shared_libs = [
        "libaaudio_internal"
        "libaudioclient"
        "libaudioflinger"
        "libaudioutils"
        "libmedia_helper"
        "libmediametrics"
        "libmediautils"
        "libbase"
        "libbinder"
        "libcutils"
        "liblog"
        "libutils"
    ];

    header_libs = [
        "libaudiohal_headers"
    ];

    include_dirs = [
        "frameworks/av/media/libnbaio/include_mono"
        "frameworks/av/media/libnbaio/include"
    ];
};

in { inherit libaaudioservice; }
