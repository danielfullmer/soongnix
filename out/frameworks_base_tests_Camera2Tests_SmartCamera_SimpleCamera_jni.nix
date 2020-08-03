{ cc_test_library }:
let

#  Copyright (C) 2013 The Android Open Source Project
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

libsmartcamera_jni = cc_test_library {
    name = "libsmartcamera_jni";
    sdk_version = "14";
    srcs = [
        "contrast.cpp"
        "brightness.cpp"
        "exposure.cpp"
        "colorspace.cpp"
        "histogram.cpp"
        "frametovalues.cpp"
        "pixelutils.cpp"
        "sobeloperator.cpp"
        "stats_scorer.cpp"
    ];
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
        "-Wno-unused-parameter"
    ];
    stl = "c++_static";
};

in { inherit libsmartcamera_jni; }
