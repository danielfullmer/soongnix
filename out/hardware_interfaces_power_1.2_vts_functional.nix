{ cc_test }:
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

VtsHalPowerV1_2TargetTest = cc_test {
    name = "VtsHalPowerV1_2TargetTest";
    defaults = ["VtsHalTargetTestDefaults"];
    srcs = ["VtsHalPowerV1_2TargetTest.cpp"];
    static_libs = [
        "android.hardware.power@1.0"
        "android.hardware.power@1.1"
        "android.hardware.power@1.2"
    ];
    test_suites = [
        "general-tests"
        "vts"
    ];
};

in { inherit VtsHalPowerV1_2TargetTest; }
