{ cc_fuzz }:
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

FormatConvertFuzzer_copyNV21toRGB32 = cc_fuzz {
    host_supported = true;
    name = "FormatConvertFuzzer_copyNV21toRGB32";
    srcs = [
        "FormatConvertFuzzer.cpp"
    ];
    static_libs = [
        "android.hardware.automotive.evs@common-default-lib"
    ];
    cflags = [
        "-DCOPY_NV21_TO_RGB32"
    ];
};

FormatConvertFuzzer_copyNV21toBGR32 = cc_fuzz {
    host_supported = true;
    name = "FormatConvertFuzzer_copyNV21toBGR32";
    srcs = [
        "FormatConvertFuzzer.cpp"
    ];
    static_libs = [
        "android.hardware.automotive.evs@common-default-lib"
    ];
    cflags = [
        "-DCOPY_NV21_TO_BGR32"
    ];
};

FormatConvertFuzzer_copyYV12toRGB32 = cc_fuzz {
    host_supported = true;
    name = "FormatConvertFuzzer_copyYV12toRGB32";
    srcs = [
        "FormatConvertFuzzer.cpp"
    ];
    static_libs = [
        "android.hardware.automotive.evs@common-default-lib"
    ];
    cflags = [
        "-DCOPY_YV12_TO_RGB32"
    ];
};

FormatConvertFuzzer_copyYV12toBGR32 = cc_fuzz {
    host_supported = true;
    name = "FormatConvertFuzzer_copyYV12toBGR32";
    srcs = [
        "FormatConvertFuzzer.cpp"
    ];
    static_libs = [
        "android.hardware.automotive.evs@common-default-lib"
    ];
    cflags = [
        "-DCOPY_YV12_TO_BGR32"
    ];
};

FormatConvertFuzzer_copyYUYVtoRGB32 = cc_fuzz {
    host_supported = true;
    name = "FormatConvertFuzzer_copyYUYVtoRGB32";
    srcs = [
        "FormatConvertFuzzer.cpp"
    ];
    static_libs = [
        "android.hardware.automotive.evs@common-default-lib"
    ];
    cflags = [
        "-DCOPY_YUYV_TO_RGB32"
    ];
};

FormatConvertFuzzer_copyYUYVtoBGR32 = cc_fuzz {
    host_supported = true;
    name = "FormatConvertFuzzer_copyYUYVtoBGR32";
    srcs = [
        "FormatConvertFuzzer.cpp"
    ];
    static_libs = [
        "android.hardware.automotive.evs@common-default-lib"
    ];
    cflags = [
        "-DCOPY_YUYV_TO_BGR32"
    ];
};

in { inherit FormatConvertFuzzer_copyNV21toBGR32 FormatConvertFuzzer_copyNV21toRGB32 FormatConvertFuzzer_copyYUYVtoBGR32 FormatConvertFuzzer_copyYUYVtoRGB32 FormatConvertFuzzer_copyYV12toBGR32 FormatConvertFuzzer_copyYV12toRGB32; }
