{ cc_test }:
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

VtsHalEvsV1_1TargetTest = cc_test {
    name = "VtsHalEvsV1_1TargetTest";
    srcs = [
        "FrameHandler.cpp"
        "FrameHandlerUltrasonics.cpp"
        "VtsHalEvsV1_1TargetTest.cpp"
    ];
    defaults = ["VtsHalTargetTestDefaults"];
    shared_libs = [
        "libui"
        "libcamera_metadata"
        "libhidlmemory"
        "android.hidl.allocator@1.0"
        "android.hidl.memory@1.0"
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
    test_suites = ["vts"];
    cflags = [
        "-O0"
        "-g"
    ];
};

in { inherit VtsHalEvsV1_1TargetTest; }
