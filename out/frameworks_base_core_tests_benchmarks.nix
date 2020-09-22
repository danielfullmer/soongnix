{ java_library }:
let

#  -*- mode: makefile -*-
#  Copyright (C) 2015 The Android Open Source Project
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

#  build framework base core benchmarks
#  ============================================================

frameworks-base-core-benchmarks = java_library {
    name = "frameworks-base-core-benchmarks";
    installable = true;
    srcs = [
        "src/android/net/NetworkStatsBenchmark.java"
        "src/android/net/TrafficStatsBenchmark.java"
        "src/android/os/FileUtilsBenchmark.java"
        "src/android/os/ParcelArrayBenchmark.java"
        "src/android/os/ParcelBenchmark.java"
        "src/android/os/ParcelStringBenchmark.java"
        "src/android/os/StrictModeBenchmark.java"
        "src/android/text/SpannableStringBuilderBenchmark.java"
        "src/android/text/SpannableStringInternalCopyBenchmark.java"
        "src/android/text/format/AndroidTimeVsOthersBenchmark.java"
        "src/android/text/util/LinkifyBenchmark.java"
        "src/android/util/FloatMathBenchmark.java"
        "src/android/util/StreamsBenchmark.java"
        "src/com/android/internal/util/IndentingPrintWriterBenchmark.java"
    ];
    libs = ["caliper-api-target"];
};

in { inherit frameworks-base-core-benchmarks; }
