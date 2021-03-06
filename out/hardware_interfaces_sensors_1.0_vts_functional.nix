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

VtsHalSensorsV1_0TargetTest = cc_test {
    name = "VtsHalSensorsV1_0TargetTest";
    cflags = ["-DLOG_TAG=\"sensors_hidl_hal_test\""];
    defaults = ["VtsHalTargetTestDefaults"];
    srcs = [
        "SensorsHidlEnvironmentV1_0.cpp"
        "VtsHalSensorsV1_0TargetTest.cpp"
    ];
    static_libs = [
        "android.hardware.graphics.allocator@2.0"
        "android.hardware.graphics.allocator@3.0"
        "android.hardware.graphics.mapper@2.0"
        "android.hardware.graphics.mapper@2.1"
        "android.hardware.graphics.mapper@3.0"
        "android.hardware.sensors@1.0"
        "VtsHalSensorsTargetTestUtils"
    ];
    test_suites = ["general-tests"];
};

in { inherit VtsHalSensorsV1_0TargetTest; }
