{ cc_test }:
let

#
#  Copyright (C) 2016 The Android Open Source Project
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

VtsHalSensorManagerV1_0TargetTest = cc_test {
    name = "VtsHalSensorManagerV1_0TargetTest";
    defaults = ["hidl_defaults"];
    srcs = ["VtsHalSensorManagerV1_0TargetTest.cpp"];
    shared_libs = [
        "libbase"
        "libcutils"
        "libhidlbase"
        "libutils"
        "android.hidl.allocator@1.0"
        "android.hardware.sensors@1.0"
        "android.frameworks.sensorservice@1.0"
    ];
    static_libs = [
        "android.hardware.sensors@1.0-convert"
    ];
    cflags = [
        "-O0"
        "-g"
    ];
};

in { inherit VtsHalSensorManagerV1_0TargetTest; }
