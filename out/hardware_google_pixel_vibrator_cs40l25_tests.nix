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

VibratorHalCs40l25TestSuite = cc_test {
    name = "VibratorHalCs40l25TestSuite";
    defaults = ["VibratorHalCs40l25TestDefaults"];
    srcs = [
        "test-hwapi.cpp"
        "test-hwcal.cpp"
        "test-vibrator.cpp"
    ];
    static_libs = [
        "libc++fs"
        "libgmock"
    ];
    shared_libs = [
        "libbase"
    ];
};

in { inherit VibratorHalCs40l25TestSuite; }
