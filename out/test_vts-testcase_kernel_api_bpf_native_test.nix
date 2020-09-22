{ bpf, cc_defaults, cc_test, vts_config }:
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

binary_bpf_defaults = cc_defaults {
    name = "binary_bpf_defaults";
    srcs = ["BpfTest.cpp"];
    shared_libs = [
        "libcgrouprc"
        "libcutils"
        "libutils"
        "liblog"
        "libbase"
    ];
    static_libs = [
        "libbpf"
        "libbpf_android"
        "libnetdutils"
        "libprocessgroup"
        "libtestUtil"
    ];
    cflags = [
        "-fno-strict-aliasing"
        "-Wall"
        "-Werror"
        "-Wno-unused-variable"
    ];
    data = [
        ":kern.o"
    ];

};

"kern.o" = bpf {
    name = "kern.o";
    #  header_libs: ["netd_bpf_progs_headers"],
    include_dirs = ["system/netd/bpf_progs"];
    srcs = ["kern.c"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
};

bpf_module_test = cc_test {
    name = "bpf_module_test";
    defaults = ["binary_bpf_defaults"];
    test_config = "bpf_module_test.xml";
    test_suites = [
        "device-tests"
        "vts"
    ];
};

vts_test_binary_bpf_module = cc_test {
    name = "vts_test_binary_bpf_module";
    defaults = ["binary_bpf_defaults"];
};

VtsKernelNetBpfTest = vts_config {
    name = "VtsKernelNetBpfTest";
};

in { inherit "kern.o" VtsKernelNetBpfTest binary_bpf_defaults bpf_module_test vts_test_binary_bpf_module; }
