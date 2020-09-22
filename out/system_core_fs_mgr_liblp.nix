{ cc_defaults, cc_library, cc_test, filegroup, vts_config }:
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

liblp_lib_deps = [
    "libbase"
    "liblog"
    "libcrypto_utils"
    "libsparse"
    "libext4_utils"
    "libz"
];

liblp = cc_library {
    name = "liblp";
    host_supported = true;
    recovery_available = true;
    defaults = ["fs_mgr_defaults"];
    cppflags = [
        "-D_FILE_OFFSET_BITS=64"
    ];
    srcs = [
        "builder.cpp"
        "images.cpp"
        "partition_opener.cpp"
        "property_fetcher.cpp"
        "reader.cpp"
        "utility.cpp"
        "writer.cpp"
    ];
    shared_libs = [
        "libcrypto"
    ] ++ liblp_lib_deps;
    target = {
        windows = {
            enabled = true;
        };
        android = {
            shared_libs = [
                "libcutils"
            ];
        };
    };
    export_include_dirs = ["include"];
};

liblp_test_srcs = filegroup {
    name = "liblp_test_srcs";
    srcs = [
        "builder_test.cpp"
        "device_test.cpp"
        "io_test.cpp"
        "test_partition_opener.cpp"
        "utility_test.cpp"
    ];
};

liblp_test_defaults = cc_defaults {
    name = "liblp_test_defaults";
    defaults = ["fs_mgr_defaults"];
    cppflags = [
        "-Wno-unused-parameter"
    ];
    static_libs = [
        "libcutils"
        "libgmock"
        "libfs_mgr"
        "liblp"
        "libcrypto_static"
    ] ++ liblp_lib_deps;
    header_libs = [
        "libstorage_literals_headers"
    ];
    stl = "libc++_static";
    srcs = [":liblp_test_srcs"];
};

liblp_test = cc_test {
    name = "liblp_test";
    defaults = ["liblp_test_defaults"];
    test_config = "liblp_test.xml";
    test_suites = ["device-tests"];
};

vts_core_liblp_test = cc_test {
    name = "vts_core_liblp_test";
    defaults = ["liblp_test_defaults"];
    test_suites = ["vts"];
    auto_gen_config = true;
    test_min_api_level = 29;
    require_root = true;
};

vts_kernel_liblp_test = cc_test {
    name = "vts_kernel_liblp_test";
    defaults = ["liblp_test_defaults"];
};

VtsKernelLiblpTest = vts_config {
    name = "VtsKernelLiblpTest";
};

in { inherit VtsKernelLiblpTest liblp liblp_test liblp_test_defaults liblp_test_srcs vts_core_liblp_test vts_kernel_liblp_test; }
