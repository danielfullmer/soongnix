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

VtsHalMediaOmxV1_0TargetVideoDecTest = cc_test {
    name = "VtsHalMediaOmxV1_0TargetVideoDecTest";
    stem = "vts_hal_media_omx_v1_0_video_dec_test";
    defaults = ["VtsHalMediaOmxV1_0Defaults"];
    srcs = [
        "VtsHalMediaOmxV1_0TargetVideoDecTest.cpp"
        "media_video_hidl_test_common.cpp"
    ];
    data = [":media_omx_video_res"];
    test_config = "VtsHalMediaOmxV1_0TargetVideoDecTest.xml";
    test_suites = [
        "vts"
    ];
};

VtsHalMediaOmxV1_0TargetVideoEncTest = cc_test {
    name = "VtsHalMediaOmxV1_0TargetVideoEncTest";
    stem = "vts_hal_media_omx_v1_0_video_enc_test";
    defaults = ["VtsHalMediaOmxV1_0Defaults"];
    srcs = [
        "VtsHalMediaOmxV1_0TargetVideoEncTest.cpp"
        "media_video_hidl_test_common.cpp"
    ];
    static_libs = [
        "libnativewindow"
    ];
    data = [":media_omx_video_res"];
    test_config = "VtsHalMediaOmxV1_0TargetVideoEncTest.xml";
    test_suites = [
        "vts"
    ];
};

in { inherit VtsHalMediaOmxV1_0TargetVideoDecTest VtsHalMediaOmxV1_0TargetVideoEncTest; }
