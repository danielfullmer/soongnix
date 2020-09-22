{ cc_defaults, cc_test_library }:
let

#
#  Copyright (C) 2018 The Android Open Source Project
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

VtsHalSensorsV2_XTargetTest-defaults = cc_defaults {
    name = "VtsHalSensorsV2_XTargetTest-defaults";
    cflags = ["-DLOG_TAG=\"sensors_hidl_hal_test\""];
    defaults = ["VtsHalTargetTestDefaults"];
    srcs = [
        "SensorsHidlEnvironmentV2_X.cpp"
    ];
    export_include_dirs = ["."];
    header_libs = [
        "android.hardware.sensors@2.X-shared-utils"
    ];
    shared_libs = [
        "libbinder"
    ];
    static_libs = [
        "android.hardware.sensors@1.0"
        "android.hardware.sensors@1.0-convert"
        "android.hardware.sensors@2.0"
        "android.hardware.sensors@2.1"
        "libfmq"
        "VtsHalSensorsTargetTestUtils"
    ];
};

VtsHalSensorsV2_0TargetTest-lib = cc_test_library {
    name = "VtsHalSensorsV2_0TargetTest-lib";
    defaults = ["VtsHalSensorsV2_XTargetTest-defaults"];
};

VtsHalSensorsV2_1TargetTest-lib = cc_test_library {
    name = "VtsHalSensorsV2_1TargetTest-lib";
    cflags = ["-DSENSORS_HAL_2_1"];
    defaults = ["VtsHalSensorsV2_XTargetTest-defaults"];
};

in { inherit VtsHalSensorsV2_0TargetTest-lib VtsHalSensorsV2_1TargetTest-lib VtsHalSensorsV2_XTargetTest-defaults; }
