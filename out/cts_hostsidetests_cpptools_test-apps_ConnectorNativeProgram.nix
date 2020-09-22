{ cc_test }:
let

#  Copyright 2019 The Android Open Source Project
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

connector = cc_test {
    name = "connector";
    srcs = ["connector.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    #  Include both the 32 and 64 bit versions
    compile_multilib = "both";
    multilib = {
        lib32 = {
            suffix = "32";
        };
        lib64 = {
            suffix = "64";
        };
    };
    test_suites = [
        "cts"
        "vts10"
        "general-tests"
    ];
};

in { inherit connector; }