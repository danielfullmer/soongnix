{ cc_test, vts_config }:
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

vts_selftest_flaky_test = cc_test {
    name = "vts_selftest_flaky_test";
    srcs = ["vts_selftest_flaky_test.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
        "-O0"
        "-g"
    ];
};

VtsSelfTestFlakyTest = vts_config {
    name = "VtsSelfTestFlakyTest";
};

in { inherit VtsSelfTestFlakyTest vts_selftest_flaky_test; }
