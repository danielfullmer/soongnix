{ cc_defaults, cc_fuzz, cc_library_static, cc_test, filegroup, vts_config }:
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

libdm = cc_library_static {
    name = "libdm";
    defaults = ["fs_mgr_defaults"];
    recovery_available = true;
    host_supported = true;

    export_include_dirs = ["include"];

    srcs = [
        "dm_table.cpp"
        "dm_target.cpp"
        "dm.cpp"
        "loop_control.cpp"
        "utility.cpp"
    ];

    static_libs = [
        "libext2_uuid"
    ];
    header_libs = [
        "libbase_headers"
        "liblog_headers"
    ];
    target = {
        darwin = {
            enabled = false;
        };
    };
};

libdm_test_srcs = filegroup {
    name = "libdm_test_srcs";
    srcs = [
        "dm_test.cpp"
        "loop_control_test.cpp"
        "test_util.cpp"
    ];
};

libdm_test_defaults = cc_defaults {
    name = "libdm_test_defaults";
    defaults = ["fs_mgr_defaults"];
    static_libs = [
        "libdm"
        "libext2_uuid"
        "libfs_mgr"
    ];
    shared_libs = [
        "libbase"
        "liblog"
    ];
    srcs = [":libdm_test_srcs"];
    auto_gen_config = true;
    require_root = true;
};

libdm_test = cc_test {
    name = "libdm_test";
    defaults = ["libdm_test_defaults"];
    test_suites = ["device-tests"];
};

vts_libdm_test = cc_test {
    name = "vts_libdm_test";
    defaults = ["libdm_test_defaults"];
    test_suites = ["vts"];
    test_min_api_level = 29;
};

dm_linear_table_fuzzer = cc_fuzz {
    name = "dm_linear_table_fuzzer";
    defaults = ["fs_mgr_defaults"];
    srcs = [
        "dm_linear_fuzzer.cpp"
        "test_util.cpp"
    ];
    static_libs = [
        "libdm"
        "libbase"
        "libext2_uuid"
        "libfs_mgr"
        "liblog"
    ];
};

VtsKernelLibdmTest = vts_config {
    name = "VtsKernelLibdmTest";
};

in { inherit VtsKernelLibdmTest dm_linear_table_fuzzer libdm libdm_test libdm_test_defaults libdm_test_srcs vts_libdm_test; }
