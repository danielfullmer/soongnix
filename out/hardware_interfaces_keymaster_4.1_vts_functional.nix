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

VtsHalKeymasterV4_1TargetTest = cc_test {
    name = "VtsHalKeymasterV4_1TargetTest";
    defaults = ["VtsHalTargetTestDefaults"];
    srcs = [
        "EarlyBootKeyTest.cpp"
        "DeviceUniqueAttestationTest.cpp"
        "Keymaster4_1HidlTest.cpp"
        "UnlockedDeviceRequiredTest.cpp"
    ];
    static_libs = [
        "android.hardware.keymaster@4.0"
        "android.hardware.keymaster@4.1"
        "libcrypto_static"
        "libkeymaster4_1support"
        "libkeymaster4support"
        "libkeymaster4vtstest"
    ];
    cflags = [
        "-Wall"
        "-O0"
    ];
    test_suites = [
        "general-tests"
        "vts"
    ];
};

in { inherit VtsHalKeymasterV4_1TargetTest; }