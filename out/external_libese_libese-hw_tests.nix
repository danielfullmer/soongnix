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

ese_hw_tests = cc_test {
    name = "ese_hw_tests";
    proprietary = true;
    srcs = ["ese_hw_echo_tests.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    host_supported = true;
    shared_libs = [
        "libese"
        "libese-teq1"
        "libese-hw-echo"
        "liblog"
    ];
};

in { inherit ese_hw_tests; }
