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

VtsHalMediaC2V1_0TargetVideoDecTest = cc_test {
    name = "VtsHalMediaC2V1_0TargetVideoDecTest";
    stem = "vts_media_c2_v1_0_video_dec_test";
    defaults = ["VtsHalMediaC2V1_0Defaults"];
    srcs = ["VtsHalMediaC2V1_0TargetVideoDecTest.cpp"];
    header_libs = [
        "libnativewindow_headers"
    ];
    shared_libs = [
        "libbinder"
        "libgui"
        "libutils"
        "libcrypto"
    ];
    data = [":media_c2_v1_video_decode_res"];
    test_config = "VtsHalMediaC2V1_0TargetVideoDecTest.xml";
};

VtsHalMediaC2V1_0TargetVideoEncTest = cc_test {
    name = "VtsHalMediaC2V1_0TargetVideoEncTest";
    stem = "vts_media_c2_v1_0_video_enc_test";
    defaults = ["VtsHalMediaC2V1_0Defaults"];
    srcs = ["VtsHalMediaC2V1_0TargetVideoEncTest.cpp"];
    data = [":media_c2_v1_video_encode_res"];
    test_config = "VtsHalMediaC2V1_0TargetVideoEncTest.xml";
};

in { inherit VtsHalMediaC2V1_0TargetVideoDecTest VtsHalMediaC2V1_0TargetVideoEncTest; }
