{ cc_test_library }:
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

libctsmediav2muxer_jni = cc_test_library {
    name = "libctsmediav2muxer_jni";
    srcs = [
        "NativeMediaCommon.cpp"
        "NativeMuxerTest.cpp"
        "NativeMuxerUnitTest.cpp"
    ];
    shared_libs = [
        "libmediandk"
        "liblog"
    ];
    include_dirs = [
        "frameworks/av/media/ndk/include/media"
    ];
    stl = "libc++_static";
    cflags = [
        "-Werror"
        "-Wall"
    ];
    gtest = false;
};

libctsmediav2extractor_jni = cc_test_library {
    name = "libctsmediav2extractor_jni";
    srcs = [
        "NativeMediaCommon.cpp"
        "NativeExtractorTest.cpp"
        "NativeExtractorUnitTest.cpp"
    ];
    shared_libs = [
        "libmediandk"
        "liblog"
    ];
    include_dirs = [
        "frameworks/av/media/ndk/include/media"
    ];
    stl = "libc++_static";
    cflags = [
        "-Werror"
        "-Wall"
    ];
    gtest = false;
};

libctsmediav2codec_jni = cc_test_library {
    name = "libctsmediav2codec_jni";
    srcs = [
        "NativeMediaCommon.cpp"
        "NativeCodecDecoderTest.cpp"
        "NativeCodecEncoderTest.cpp"
        "NativeCodecTestBase.cpp"
        "NativeCodecUnitTest.cpp"
        "NativeCodecEncoderSurfaceTest.cpp"
    ];
    shared_libs = [
        "libmediandk"
        "liblog"
        "libandroid"
    ];
    include_dirs = [
        "frameworks/av/media/ndk/include/media"
    ];
    stl = "libc++_static";
    cflags = [
        "-Werror"
        "-Wall"
    ];
    gtest = false;
};

in { inherit libctsmediav2codec_jni libctsmediav2extractor_jni libctsmediav2muxer_jni; }
