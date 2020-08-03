{ cc_library_shared }:
let

#  Copyright 2014 The Android Open Source Project
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

libsoundtriggerservice = cc_library_shared {
    name = "libsoundtriggerservice";

    srcs = [
        "SoundTriggerHwService.cpp"
        "SoundTriggerHalHidl.cpp"
    ];

    shared_libs = [
        "liblog"
        "libutils"
        "libbinder"
        "libcutils"
        "libhardware"
        "libsoundtrigger"
        "libaudioclient"
        "libaudioutils"
        "libmediautils"

        "libhwbinder"
        "libhidlbase"
        "libhidlmemory"
        "libhidltransport"
        "libbase"
        "libaudiohal"
        "libaudiohal_deathhandler"
        "android.hardware.soundtrigger@2.0"
        "android.hardware.soundtrigger@2.1"
        "android.hardware.soundtrigger@2.2"
        "android.hardware.audio.common@2.0"
        "android.hidl.allocator@1.0"
        "android.hidl.memory@1.0"
    ];

    include_dirs = ["frameworks/av/services/audioflinger"];

    cflags = [
        "-Wall"
        "-Werror"
    ];
};

in { inherit libsoundtriggerservice; }
