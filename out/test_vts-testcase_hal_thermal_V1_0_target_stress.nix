{ cc_test, vts_config }:
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
#

thermal_hidl_stress_test = cc_test {
    name = "thermal_hidl_stress_test";
    gtest = true;
    srcs = ["thermal_hidl_stress_test.cpp"];
    shared_libs = [
        "libbase"
        "liblog"
        "libcutils"
        "libhidlbase"
        "libhidltransport"
        "libhwbinder"
        "libnativehelper"
        "libutils"
        "android.hardware.thermal@1.0"
    ];
    static_libs = ["libgtest"];
    cflags = [
        "-O0"
        "-g"
        "-Wall"
        "-Werror"
    ];
};

ThermalHidlTargetStressTest = vts_config {
    name = "ThermalHidlTargetStressTest";
};

in { inherit ThermalHidlTargetStressTest thermal_hidl_stress_test; }
