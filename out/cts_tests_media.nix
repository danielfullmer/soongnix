{ android_test }:
let

#  Copyright (C) 2019 The Android Open Source Project
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

CtsMediaV2TestCases = android_test {
    name = "CtsMediaV2TestCases";
    defaults = ["cts_defaults"];
    compile_multilib = "both";
    static_libs = [
        "compatibility-device-util-axt"
        "ctstestrunner-axt"
    ];
    libs = [
        "android.test.runner.stubs"
        "android.test.base.stubs"
    ];
    jni_uses_platform_apis = true;
    jni_libs = [
        "libctsmediav2muxer_jni"
        "libctsmediav2extractor_jni"
        "libctsmediav2codec_jni"
    ];
    srcs = [
        "src/android/mediav2/cts/CodecDecoderExtTest.java"
        "src/android/mediav2/cts/CodecDecoderSurfaceTest.java"
        "src/android/mediav2/cts/CodecDecoderTest.java"
        "src/android/mediav2/cts/CodecEncoderSurfaceTest.java"
        "src/android/mediav2/cts/CodecEncoderTest.java"
        "src/android/mediav2/cts/CodecTestActivity.java"
        "src/android/mediav2/cts/CodecTestBase.java"
        "src/android/mediav2/cts/CodecUnitTest.java"
        "src/android/mediav2/cts/EncoderColorAspectsTest.java"
        "src/android/mediav2/cts/EncoderProfileLevelTest.java"
        "src/android/mediav2/cts/ExtractorTest.java"
        "src/android/mediav2/cts/ExtractorUnitTest.java"
        "src/android/mediav2/cts/MuxerTest.java"
        "src/android/mediav2/cts/MuxerUnitTest.java"
        "src/android/mediav2/cts/WorkDir.java"
    ];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    sdk_version = "test_current";
};

in { inherit CtsMediaV2TestCases; }
