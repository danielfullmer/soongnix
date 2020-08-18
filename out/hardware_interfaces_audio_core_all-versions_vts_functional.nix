{ cc_defaults, cc_test }:
let

#
#  Copyright (C) 2017 The Android Open Source Project
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

VtsHalAudioTargetTest_defaults = cc_defaults {
    name = "VtsHalAudioTargetTest_defaults";
    defaults = ["VtsHalTargetTestDefaults"];
    static_libs = [
        "android.hardware.audio.common.test.utility"
        "libaudiopolicycomponents"
        "libmedia_helper"
        "libxml2"
    ];
    shared_libs = [
        "libfmq"
    ];
    header_libs = [
        "android.hardware.audio.common.util@all-versions"
    ];
    test_suites = ["general-tests"];
};

VtsHalAudioV2_0TargetTest = cc_test {
    name = "VtsHalAudioV2_0TargetTest";
    defaults = ["VtsHalAudioTargetTest_defaults"];
    srcs = [
        "2.0/AudioPrimaryHidlHalTest.cpp"
    ];
    static_libs = [
        "android.hardware.audio@2.0"
        "android.hardware.audio.common@2.0"
    ];
    cflags = [
        "-DMAJOR_VERSION=2"
        "-DMINOR_VERSION=0"
        "-include common/all-versions/VersionMacro.h"
    ];
};

VtsHalAudioV4_0TargetTest = cc_test {
    name = "VtsHalAudioV4_0TargetTest";
    defaults = ["VtsHalAudioTargetTest_defaults"];
    srcs = [
        "4.0/AudioPrimaryHidlHalTest.cpp"
    ];
    static_libs = [
        "android.hardware.audio@4.0"
        "android.hardware.audio.common@4.0"
    ];
    cflags = [
        "-DMAJOR_VERSION=4"
        "-DMINOR_VERSION=0"
        "-include common/all-versions/VersionMacro.h"
    ];
};

VtsHalAudioV5_0TargetTest = cc_test {
    name = "VtsHalAudioV5_0TargetTest";
    defaults = ["VtsHalAudioTargetTest_defaults"];
    srcs = [
        "5.0/AudioPrimaryHidlHalTest.cpp"
    ];
    static_libs = [
        "android.hardware.audio@5.0"
        "android.hardware.audio.common@5.0"
    ];
    cflags = [
        "-DMAJOR_VERSION=5"
        "-DMINOR_VERSION=0"
        "-include common/all-versions/VersionMacro.h"
    ];
};

in { inherit VtsHalAudioTargetTest_defaults VtsHalAudioV2_0TargetTest VtsHalAudioV4_0TargetTest VtsHalAudioV5_0TargetTest; }
