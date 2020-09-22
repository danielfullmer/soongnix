{ cc_test }:
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

VtsHalVibratorV1_3TargetTest = cc_test {
    name = "VtsHalVibratorV1_3TargetTest";
    defaults = ["VtsHalTargetTestDefaults"];
    srcs = ["VtsHalVibratorV1_3TargetTest.cpp"];
    static_libs = [
        "android.hardware.vibrator@1.0"
        "android.hardware.vibrator@1.1"
        "android.hardware.vibrator@1.2"
        "android.hardware.vibrator@1.3"
    ];
    test_suites = [
        "general-tests"
        "vts"
    ];
};

in { inherit VtsHalVibratorV1_3TargetTest; }
