{ android_app }:
let

#
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
#

startop_test_app = android_app {
    name = "startop_test_app";
    srcs = [
        "src/ApplicationBenchmarks.java"
        "src/ComplexLayoutInflationActivity.java"
        "src/CPUIntensiveBenchmarkActivity.java"
        "src/CPUIntensiveBenchmarks.java"
        "src/EmptyActivity.java"
        "src/FrameLayoutInflationActivity.java"
        "src/InitCheckOverheadBenchmarkActivity.java"
        "src/InitCheckOverheadBenchmarks.java"
        "src/LayoutInflationActivity.java"
        "src/NonInteractiveMicrobenchmarkActivity.java"
        "src/InteractiveMicrobenchmarkActivity.java"
        "src/SystemServerBenchmarks.java"
        "src/TextViewInflationActivity.java"
    ];
    sdk_version = "26"; #  Android O (8.0) and higher
};

in { inherit startop_test_app; }
