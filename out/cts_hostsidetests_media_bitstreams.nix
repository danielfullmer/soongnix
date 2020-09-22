{ java_test_host }:
let

#  Copyright (C) 2017 The Android Open Source Project
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.

CtsMediaBitstreamsTestCases = java_test_host {
    name = "CtsMediaBitstreamsTestCases";
    srcs = [
        "src/android/media/cts/bitstreams/FullPackage.java"
        "src/android/media/cts/bitstreams/H264Yuv420_8bitBpBitstreamsFullTest.java"
        "src/android/media/cts/bitstreams/H264Yuv420_8bitBpBitstreamsTest.java"
        "src/android/media/cts/bitstreams/H264Yuv420_8bitHpBitstreamsFullTest.java"
        "src/android/media/cts/bitstreams/H264Yuv420_8bitHpBitstreamsTest.java"
        "src/android/media/cts/bitstreams/H264Yuv420_8bitMpBitstreamsFullTest.java"
        "src/android/media/cts/bitstreams/H264Yuv420_8bitMpBitstreamsTest.java"
        "src/android/media/cts/bitstreams/HevcYuv400BitstreamsFullTest.java"
        "src/android/media/cts/bitstreams/HevcYuv420BitstreamsFullTest.java"
        "src/android/media/cts/bitstreams/HevcYuv420BitstreamsTest.java"
        "src/android/media/cts/bitstreams/HevcYuv422BitstreamsFullTest.java"
        "src/android/media/cts/bitstreams/HevcYuv444BitstreamsFullTest.java"
        "src/android/media/cts/bitstreams/MediaBitstreamsTest.java"
        "src/android/media/cts/bitstreams/ReportProcessor.java"
        "src/android/media/cts/bitstreams/SupportedBitstreamsProcessor.java"
        "src/android/media/cts/bitstreams/Vp8BitstreamsFullTest.java"
        "src/android/media/cts/bitstreams/Vp8BitstreamsTest.java"
        "src/android/media/cts/bitstreams/Vp9Yuv420BitstreamsFullTest.java"
        "src/android/media/cts/bitstreams/Vp9Yuv420BitstreamsTest.java"
        "src/android/media/cts/bitstreams/Vp9Yuv422BitstreamsFullTest.java"
        "src/android/media/cts/bitstreams/Vp9Yuv444BitstreamsFullTest.java"
        "common/src/android/media/cts/bitstreams/MediaBitstreams.java"
    ];
    libs = [
        "compatibility-host-util"
        "cts-tradefed"
        "tradefed"
    ];
    static_libs = [
        "cts-host-utils"
    ];
    #  Tag this module as a cts test artifact
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
    java_resources = ["DynamicConfig.xml"];
    required = ["cts-dynamic-config"];
};

in { inherit CtsMediaBitstreamsTestCases; }
