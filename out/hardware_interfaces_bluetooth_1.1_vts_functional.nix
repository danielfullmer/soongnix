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

VtsHalBluetoothV1_1TargetTest = cc_test {
    name = "VtsHalBluetoothV1_1TargetTest";
    defaults = ["VtsHalTargetTestDefaults"];
    srcs = ["VtsHalBluetoothV1_1TargetTest.cpp"];
    static_libs = [
        "android.hardware.bluetooth@1.1"
        "android.hardware.bluetooth@1.0"
        "libbluetooth-types"
    ];
    test_suites = [
        "general-tests"
        "vts"
    ];
};

in { inherit VtsHalBluetoothV1_1TargetTest; }