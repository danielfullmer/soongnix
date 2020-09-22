{ cc_binary }:
let

#  Copyright 2013 The Android Open Source Project
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

screenrecord = cc_binary {
    name = "screenrecord";

    srcs = [
        "screenrecord.cpp"
        "EglWindow.cpp"
        "FrameOutput.cpp"
        "TextRenderer.cpp"
        "Overlay.cpp"
        "Program.cpp"
    ];

    header_libs = [
        "libmediadrm_headers"
        "libmediametrics_headers"
    ];

    shared_libs = [
        "libstagefright"
        "libmedia"
        "libmediandk"
        "libmedia_omx"
        "libutils"
        "libbinder"
        "libstagefright_foundation"
        "libjpeg"
        "libui"
        "libgui"
        "libcutils"
        "liblog"
        "libEGL"
        "libGLESv2"
    ];

    include_dirs = [
        "frameworks/av/media/libstagefright"
        "frameworks/av/media/libstagefright/include"
        "frameworks/native/include/media/openmax"
    ];

    cflags = [
        "-Werror"
        "-Wall"
        "-Wno-multichar"
        # "-UNDEBUG",
    ];
};

in { inherit screenrecord; }
