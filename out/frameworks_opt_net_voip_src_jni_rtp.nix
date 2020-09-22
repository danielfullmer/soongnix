{ cc_library_shared }:
let

#  Copyright 2010 Google Inc. All rights reserved.
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

librtp_jni = cc_library_shared {
    name = "librtp_jni";
    srcs = [
        "AudioCodec.cpp"
        "AudioGroup.cpp"
        "EchoSuppressor.cpp"
        "RtpStream.cpp"
        "util.cpp"
        "rtp_jni.cpp"

        "AmrCodec.cpp"
        "G711Codec.cpp"
        "GsmCodec.cpp"
    ];
    header_libs = [
        "libmedia_headers"
        "libmediametrics_headers"
    ];

    shared_libs = [
        "libaudioclient"
        "libaudiofoundation"
        "libcutils"
        "liblog"
        "libnativehelper"
        "libstagefright_amrnb_common"
        "libutils"
    ];
    static_libs = [
        "libgsm"
        "libstagefright_amrnbdec"
        "libstagefright_amrnbenc"
    ];
    include_dirs = [
        "frameworks/av/media/libstagefright/codecs/amrnb/enc/src"
        "frameworks/av/media/libstagefright/codecs/amrnb/dec/src"
    ];
    cflags = [
        "-fvisibility=hidden"
        "-Wall"
        "-Wextra"
        # getInput() is deprecated but we want to continue to track the usage of it elsewhere
        "-Wno-deprecated-declarations"
        "-Werror"
    ];
};

in { inherit librtp_jni; }
