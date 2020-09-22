{ cc_test_library, java_library }:
let

#  Copyright (C) 2016 The Android Open Source Project
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

libndkaudioLib = cc_test_library {
    name = "libndkaudioLib";
    include_dirs = [
        "frameworks/wilhelm/include"
        "frameworks/wilhelm/src/android"
    ];
    srcs = [
        "OpenSLESUtils.cpp"
        "AudioPlayer.cpp"
        "AudioSource.cpp"
        "PeriodicAudioSource.cpp"
        "SystemParams.cpp"
        "WaveTableGenerator.cpp"
        "WaveTableOscillator.cpp"
        "com_android_ndkaudio_AudioPlayer.cpp"
        "AudioRecorder.cpp"
        "com_android_ndkaudio_AudioRecorder.cpp"
    ];
    stl = "libc++_static";
    shared_libs = [
        "liblog"
        "libOpenSLES"
    ];
    cflags = [
        "-Werror"
        "-Wall"
        "-Wno-deprecated-declarations"
    ];
    gtest = false;
    sdk_version = "29";
};

#
#  ndkaudio - java
#
ndkaudio = java_library {
    name = "ndkaudio";
    srcs = [
        "src/com/android/ndkaudio/AudioPlayer.java"
        "src/com/android/ndkaudio/AudioRecorder.java"
    ];
    sdk_version = "current";
    min_sdk_version = "23";
};

in { inherit libndkaudioLib ndkaudio; }
