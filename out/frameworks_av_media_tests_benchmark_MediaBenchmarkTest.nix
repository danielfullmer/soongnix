{ android_library, android_test, java_defaults }:
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

MediaBenchmarkTest = android_test {
    name = "MediaBenchmarkTest";

    defaults = [
        "MediaBenchmark-defaults"
    ];

    #  Include all the test code
    srcs = [
        "src/androidTest/java/com/android/media/benchmark/tests/DecoderTest.java"
        "src/androidTest/java/com/android/media/benchmark/tests/EncoderTest.java"
        "src/androidTest/java/com/android/media/benchmark/tests/ExtractorTest.java"
        "src/androidTest/java/com/android/media/benchmark/tests/MuxerTest.java"
    ];

    resource_dirs = ["res"];

    libs = [
        "android.test.runner"
        "android.test.base"
    ];

    jni_libs = [
        "libmediabenchmark_jni"
    ];

    static_libs = [
        "libMediaBenchmark"
        "junit"
        "androidx.test.runner"
    ];
};

libMediaBenchmark = android_library {
    name = "libMediaBenchmark";

    defaults = [
        "MediaBenchmark-defaults"
    ];

    #  Include all the libraries
    srcs = [
        "src/main/java/com/android/media/benchmark/library/CodecUtils.java"
        "src/main/java/com/android/media/benchmark/library/Decoder.java"
        "src/main/java/com/android/media/benchmark/library/Encoder.java"
        "src/main/java/com/android/media/benchmark/library/Extractor.java"
        "src/main/java/com/android/media/benchmark/library/Muxer.java"
        "src/main/java/com/android/media/benchmark/library/Native.java"
        "src/main/java/com/android/media/benchmark/library/Stats.java"
    ];

    static_libs = [
        "androidx.test.core"
    ];
};

MediaBenchmark-defaults = java_defaults {
    name = "MediaBenchmark-defaults";

    sdk_version = "system_current";
    min_sdk_version = "28";
    target_sdk_version = "29";
};

in { inherit MediaBenchmark-defaults MediaBenchmarkTest libMediaBenchmark; }
