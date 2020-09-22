{ cc_test, vts_config }:
let

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

vts_kernel_kheaders = cc_test {
    name = "vts_kernel_kheaders";
    srcs = ["vts_kernel_kheaders.cpp"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = [
        "libbase"
    ];
    static_libs = [
        "libgmock"
    ];
    test_suites = [
        "general-tests"
        "vts"
    ];
    require_root = true;
    auto_gen_config = true;
};

VtsKernelKheaders = vts_config {
    name = "VtsKernelKheaders";
};

in { inherit VtsKernelKheaders vts_kernel_kheaders; }