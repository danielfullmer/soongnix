{ cc_test_library }:
let

#  Copyright (C) 2015 The Android Open Source Project
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
#

libaudio_jni = cc_test_library {
    name = "libaudio_jni";
    srcs = [
        "appendix-b-1-1-buffer-queue.cpp"
        "appendix-b-1-2-recording.cpp"
        "audio-metadata-native.cpp"
        "audio-record-native.cpp"
        "audio-track-native.cpp"
        "sl-utils.cpp"
    ];
    include_dirs = ["system/core/include"];
    shared_libs = [
        "libandroid"
        "liblog"
        "libnativehelper_compat_libc++"
        "libOpenSLES"
    ];
    header_libs = [
        "libaudioutils_headers"
    ];
    stl = "libc++_static";
    cflags = [
        "-Werror"
        "-Wall"
        "-Wno-deprecated-declarations"
    ];
    gtest = false;
    sdk_version = "current";
};

in { inherit libaudio_jni; }
