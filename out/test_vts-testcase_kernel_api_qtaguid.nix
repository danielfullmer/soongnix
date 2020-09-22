{ cc_defaults, cc_test, vts_config }:
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

vts_test_binary_qtaguid_defaults = cc_defaults {
    name = "vts_test_binary_qtaguid_defaults";
    srcs = ["SocketTagUserSpace.cpp"];
    shared_libs = [
        "libutils"
        "liblog"
        "libbase"
    ];
    static_libs = ["libqtaguid"];
    cflags = [
        "-fno-strict-aliasing"
        "-Wall"
        "-Werror"
        "-Wno-unused-variable"
    ];

};

vts_test_binary_qtaguid_module = cc_test {
    name = "vts_test_binary_qtaguid_module";
    defaults = ["vts_test_binary_qtaguid_defaults"];
};

vts_core_test_binary_qtaguid_module = cc_test {
    name = "vts_core_test_binary_qtaguid_module";
    defaults = ["vts_test_binary_qtaguid_defaults"];
    auto_gen_config = true;
    require_root = true;
    test_suites = ["vts"];
};

VtsKernelQtaguidTest = vts_config {
    name = "VtsKernelQtaguidTest";
};

in { inherit VtsKernelQtaguidTest vts_core_test_binary_qtaguid_module vts_test_binary_qtaguid_defaults vts_test_binary_qtaguid_module; }
