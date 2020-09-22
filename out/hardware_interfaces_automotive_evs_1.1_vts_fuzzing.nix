{ cc_defaults, cc_fuzz }:
let

#
#  Copyright 2020 The Android Open Source Project
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

"android.hardware.automotive.evs@fuzz-defaults" = cc_defaults {
    name = "android.hardware.automotive.evs@fuzz-defaults";
    defaults = ["VtsHalTargetTestDefaults"];
    shared_libs = [
        "libui"
        "libcamera_metadata"
    ];
    static_libs = [
        "android.hardware.automotive.evs@1.0"
        "android.hardware.automotive.evs@1.1"
        "android.hardware.automotive.evs@common-default-lib"
        "android.hardware.graphics.common@1.0"
        "android.hardware.graphics.common@1.1"
        "android.hardware.graphics.common@1.2"
        "android.hardware.camera.device@3.2"
    ];
    cflags = [
        "-O0"
        "-g"
    ];
};

VtsHalEvsV1_1CameraOpenFuzz = cc_fuzz {
    name = "VtsHalEvsV1_1CameraOpenFuzz";
    defaults = ["android.hardware.automotive.evs@fuzz-defaults"];
    srcs = [
        "VtsHalEvsV1_1CameraOpenFuzz.cpp"
    ];
    fuzz_config = {
        #  wait for Haiku device ready
        fuzz_on_haiku_device = false;
        fuzz_on_haiku_host = false;
    };
};

in { inherit "android.hardware.automotive.evs@fuzz-defaults" VtsHalEvsV1_1CameraOpenFuzz; }
