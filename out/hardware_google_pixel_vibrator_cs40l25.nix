{ cc_binary, cc_defaults, cc_library }:
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

"android.hardware.vibrator-defaults.cs40l25" = cc_defaults {
    name = "android.hardware.vibrator-defaults.cs40l25";
    cflags = [
        "-DATRACE_TAG=(ATRACE_TAG_VIBRATOR | ATRACE_TAG_HAL)"
        "-DLOG_TAG=\"android.hardware.vibrator-cs40l25\""
    ];
};

VibratorHalCs40l25BinaryDefaults = cc_defaults {
    name = "VibratorHalCs40l25BinaryDefaults";
    defaults = [
        "PixelVibratorBinaryDefaults"
        "android.hardware.vibrator-defaults.cs40l25"
    ];
};

VibratorHalCs40l25TestDefaults = cc_defaults {
    name = "VibratorHalCs40l25TestDefaults";
    defaults = [
        "PixelVibratorTestDefaults"
        "android.hardware.vibrator-defaults.cs40l25"
    ];
    static_libs = ["android.hardware.vibrator-impl.cs40l25"];
};

"android.hardware.vibrator-impl.cs40l25" = cc_library {
    name = "android.hardware.vibrator-impl.cs40l25";
    defaults = ["VibratorHalCs40l25BinaryDefaults"];
    srcs = ["Vibrator.cpp"];
    export_include_dirs = ["."];
    vendor_available = true;
    visibility = [":__subpackages__"];
};

"android.hardware.vibrator-service.cs40l25" = cc_binary {
    name = "android.hardware.vibrator-service.cs40l25";
    defaults = ["VibratorHalCs40l25BinaryDefaults"];
    init_rc = ["android.hardware.vibrator-service.cs40l25.rc"];
    vintf_fragments = ["android.hardware.vibrator-service.cs40l25.xml"];
    srcs = ["service.cpp"];
    static_libs = ["android.hardware.vibrator-impl.cs40l25"];
    proprietary = true;
};

in { inherit "android.hardware.vibrator-defaults.cs40l25" "android.hardware.vibrator-impl.cs40l25" "android.hardware.vibrator-service.cs40l25" VibratorHalCs40l25BinaryDefaults VibratorHalCs40l25TestDefaults; }
