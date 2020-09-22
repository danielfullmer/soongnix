{ cc_benchmark }:
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

VibratorHalDrv2624Benchmark = cc_benchmark {
    name = "VibratorHalDrv2624Benchmark";
    defaults = ["VibratorHalDrv2624TestDefaults"];
    srcs = [
        "benchmark.cpp"
    ];
    static_libs = [
        "libc++fs"
    ];
    shared_libs = [
        "libbase"
    ];
    #  TODO(b/135767253): Remove when fixed.
    test_suites = ["device-tests"];
    #  TODO(b/142024316): Remove when fixed.
    require_root = true;
};

in { inherit VibratorHalDrv2624Benchmark; }
