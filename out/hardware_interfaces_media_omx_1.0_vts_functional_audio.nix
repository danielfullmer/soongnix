{ cc_test }:
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

VtsHalMediaOmxV1_0TargetAudioEncTest = cc_test {
    name = "VtsHalMediaOmxV1_0TargetAudioEncTest";
    stem = "vts_hal_media_omx_v1_0_audio_enc_test";
    defaults = ["VtsHalMediaOmxV1_0Defaults"];
    srcs = [
        "VtsHalMediaOmxV1_0TargetAudioEncTest.cpp"
        "media_audio_hidl_test_common.cpp"
    ];
    data = [":media_omx_audio_res"];
    test_config = "VtsHalMediaOmxV1_0TargetAudioEncTest.xml";
    test_suites = [
        "vts"
    ];
};

VtsHalMediaOmxV1_0TargetAudioDecTest = cc_test {
    name = "VtsHalMediaOmxV1_0TargetAudioDecTest";
    stem = "vts_hal_media_omx_v1_0_audio_dec_test";
    defaults = ["VtsHalMediaOmxV1_0Defaults"];
    srcs = [
        "VtsHalMediaOmxV1_0TargetAudioDecTest.cpp"
        "media_audio_hidl_test_common.cpp"
    ];
    data = [":media_omx_audio_res"];
    test_config = "VtsHalMediaOmxV1_0TargetAudioDecTest.xml";
    test_suites = [
        "vts"
    ];
};

in { inherit VtsHalMediaOmxV1_0TargetAudioDecTest VtsHalMediaOmxV1_0TargetAudioEncTest; }
