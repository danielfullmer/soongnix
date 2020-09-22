{ cc_defaults, cc_test }:
let

#
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

VtsHalAudioEffectTargetTest_default = cc_defaults {
    name = "VtsHalAudioEffectTargetTest_default";
    defaults = ["VtsHalTargetTestDefaults"];
    srcs = [
        "VtsHalAudioEffectTargetTest.cpp"
        "ValidateAudioEffectsConfiguration.cpp"
    ];
    static_libs = [
        "android.hardware.audio.common.test.utility"
        "android.hidl.allocator@1.0"
        "android.hidl.memory@1.0"
        "libeffectsconfig"
        "libxml2"
    ];
    header_libs = [
        "android.hardware.audio.common.util@all-versions"
    ];
    test_suites = [
        "general-tests"
        "vts"
    ];
};

VtsHalAudioEffectV2_0TargetTest = cc_test {
    name = "VtsHalAudioEffectV2_0TargetTest";
    defaults = ["VtsHalAudioEffectTargetTest_default"];
    #  Use test_config for vts suite.
    #  TODO(b/146104851): Add auto-gen rules and remove it.
    test_config = "VtsHalAudioEffectV2_0TargetTest.xml";
    static_libs = [
        "android.hardware.audio.common@2.0"
        "android.hardware.audio.effect@2.0"
    ];
    data = [
        ":audio_effects_conf_V2_0"
    ];
    cflags = [
        "-DMAJOR_VERSION=2"
        "-DMINOR_VERSION=0"
        "-include common/all-versions/VersionMacro.h"
    ];
};

VtsHalAudioEffectV4_0TargetTest = cc_test {
    name = "VtsHalAudioEffectV4_0TargetTest";
    defaults = ["VtsHalAudioEffectTargetTest_default"];
    #  Use test_config for vts suite.
    #  TODO(b/146104851): Add auto-gen rules and remove it.
    test_config = "VtsHalAudioEffectV4_0TargetTest.xml";
    static_libs = [
        "android.hardware.audio.common@4.0"
        "android.hardware.audio.effect@4.0"
    ];
    data = [
        ":audio_effects_conf_V4_0"
    ];
    cflags = [
        "-DMAJOR_VERSION=4"
        "-DMINOR_VERSION=0"
        "-include common/all-versions/VersionMacro.h"
    ];
};

VtsHalAudioEffectV5_0TargetTest = cc_test {
    name = "VtsHalAudioEffectV5_0TargetTest";
    defaults = ["VtsHalAudioEffectTargetTest_default"];
    #  Use test_config for vts suite.
    #  TODO(b/146104851): Add auto-gen rules and remove it.
    test_config = "VtsHalAudioEffectV5_0TargetTest.xml";
    static_libs = [
        "android.hardware.audio.common@5.0"
        "android.hardware.audio.effect@5.0"
    ];
    data = [
        ":audio_effects_conf_V5_0"
    ];
    cflags = [
        "-DMAJOR_VERSION=5"
        "-DMINOR_VERSION=0"
        "-include common/all-versions/VersionMacro.h"
    ];
};

VtsHalAudioEffectV6_0TargetTest = cc_test {
    name = "VtsHalAudioEffectV6_0TargetTest";
    defaults = ["VtsHalAudioEffectTargetTest_default"];
    #  Use test_config for vts suite.
    #  TODO(b/146104851): Add auto-gen rules and remove it.
    test_config = "VtsHalAudioEffectV6_0TargetTest.xml";
    static_libs = [
        "android.hardware.audio.common@6.0"
        "android.hardware.audio.effect@6.0"
    ];
    data = [
        ":audio_effects_conf_V6_0"
    ];
    cflags = [
        "-DMAJOR_VERSION=6"
        "-DMINOR_VERSION=0"
        "-include common/all-versions/VersionMacro.h"
    ];
};

in { inherit VtsHalAudioEffectTargetTest_default VtsHalAudioEffectV2_0TargetTest VtsHalAudioEffectV4_0TargetTest VtsHalAudioEffectV5_0TargetTest VtsHalAudioEffectV6_0TargetTest; }
