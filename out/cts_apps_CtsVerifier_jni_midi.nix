{ cc_test_library }:
let

#
#  Copyright (C) 2018 The Android Open Source Project
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

libctsnativemidi_jni = cc_test_library {
    name = "libctsnativemidi_jni";
    srcs = [
        "com_android_cts_verifier_audio_midilib_NativeMidiManager.cpp"
        "MidiTestManager.cpp"
    ];
    include_dirs = [
        "frameworks/base/media/native/midi/include"
        "frameworks/av/media/ndk/include"
        "system/core/include/cutils"
    ];
    sdk_version = "current";
    stl = "libc++_static";
    shared_libs = [
        "liblog"
        "libamidi"
    ];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
        "-Wno-unused-variable"
    ];
};

in { inherit libctsnativemidi_jni; }