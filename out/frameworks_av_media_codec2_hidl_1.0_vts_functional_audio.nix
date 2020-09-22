{ cc_test }:
let

/*
 * Copyright (C) 2018 The Android Open Source Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

VtsHalMediaC2V1_0TargetAudioDecTest = cc_test {
    name = "VtsHalMediaC2V1_0TargetAudioDecTest";
    stem = "vts_media_c2_v1_0_audio_dec_test";
    defaults = ["VtsHalMediaC2V1_0Defaults"];
    srcs = [
        "VtsHalMediaC2V1_0TargetAudioDecTest.cpp"
    ];
    data = [":media_c2_v1_audio_decode_res"];
    test_config = "VtsHalMediaC2V1_0TargetAudioDecTest.xml";
};

VtsHalMediaC2V1_0TargetAudioEncTest = cc_test {
    name = "VtsHalMediaC2V1_0TargetAudioEncTest";
    stem = "vts_media_c2_v1_0_audio_enc_test";
    defaults = ["VtsHalMediaC2V1_0Defaults"];
    srcs = [
        "VtsHalMediaC2V1_0TargetAudioEncTest.cpp"
    ];
    data = [":media_c2_v1_audio_encode_res"];
    test_config = "VtsHalMediaC2V1_0TargetAudioEncTest.xml";
};

in { inherit VtsHalMediaC2V1_0TargetAudioDecTest VtsHalMediaC2V1_0TargetAudioEncTest; }
