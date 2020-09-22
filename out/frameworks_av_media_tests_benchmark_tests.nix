{ cc_test }:
let

/*
 * Copyright (C) 2019 The Android Open Source Project
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

extractorTest = cc_test {
    name = "extractorTest";
    gtest = true;
    defaults = [
        "libmediabenchmark_common-defaults"
        "libmediabenchmark_soft_sanitize_all-defaults"
    ];

    srcs = ["ExtractorTest.cpp"];

    static_libs = ["libmediabenchmark_extractor"];
};

decoderTest = cc_test {
    name = "decoderTest";
    gtest = true;
    defaults = [
        "libmediabenchmark_common-defaults"
        "libmediabenchmark_soft_sanitize_all-defaults"
    ];

    srcs = ["DecoderTest.cpp"];

    static_libs = [
        "libmediabenchmark_extractor"
        "libmediabenchmark_decoder"
    ];
};

muxerTest = cc_test {
    name = "muxerTest";
    gtest = true;
    defaults = [
        "libmediabenchmark_common-defaults"
        "libmediabenchmark_soft_sanitize_all-defaults"
    ];

    srcs = ["MuxerTest.cpp"];

    static_libs = [
        "libmediabenchmark_extractor"
        "libmediabenchmark_muxer"
    ];
};

encoderTest = cc_test {
    name = "encoderTest";
    gtest = true;
    defaults = [
        "libmediabenchmark_common-defaults"
        "libmediabenchmark_soft_sanitize_all-defaults"
    ];

    srcs = ["EncoderTest.cpp"];

    static_libs = [
        "libmediabenchmark_extractor"
        "libmediabenchmark_decoder"
        "libmediabenchmark_encoder"
    ];
};

C2DecoderTest = cc_test {
    name = "C2DecoderTest";
    gtest = true;
    defaults = [
        "libmediabenchmark_codec2_common-defaults"
        "libmediabenchmark_soft_sanitize_all-defaults"
    ];

    srcs = ["C2DecoderTest.cpp"];

    static_libs = [
        "libmediabenchmark_codec2_extractor"
        "libmediabenchmark_codec2_common"
        "libmediabenchmark_codec2_decoder"
    ];
};

C2EncoderTest = cc_test {
    name = "C2EncoderTest";
    gtest = true;
    defaults = [
        "libmediabenchmark_codec2_common-defaults"
    ];

    srcs = ["C2EncoderTest.cpp"];

    static_libs = [
        "libmediabenchmark_codec2_extractor"
        "libmediabenchmark_codec2_decoder"
        "libmediabenchmark_codec2_common"
        "libmediabenchmark_codec2_encoder"
    ];
};

in { inherit C2DecoderTest C2EncoderTest decoderTest encoderTest extractorTest muxerTest; }
