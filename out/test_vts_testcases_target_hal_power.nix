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

VtsHalPowerTestCases = cc_test {
    name = "VtsHalPowerTestCases";
    multilib = {
        lib32 = {
            suffix = "32";
        };
        lib64 = {
            suffix = "64";
        };
    };

    shared_libs = [
        "libdl"
        "libhardware"
    ];

    whole_static_libs = ["libVtsGtestMain"];

    static_libs = [
        "libbase"
        "libtinyxml2"
        "liblog"
        "libgtest"
    ];

    #  Tag this module as a vts10 test artifact
    test_suites = [
        "vts10"
    ];

    srcs = ["hal_power_basic_test.cpp"];

    cflags = [
        "-Wall"
        "-Wextra"
        "-Wunused"
        "-Werror"
    ];
};

in { inherit VtsHalPowerTestCases; }
