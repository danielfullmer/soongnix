{ cc_defaults, cc_library_headers, cc_test, filegroup }:
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

libfiemap_headers = cc_library_headers {
    name = "libfiemap_headers";
    recovery_available = true;
    export_include_dirs = ["include"];
};

libfiemap_srcs = filegroup {
    name = "libfiemap_srcs";
    srcs = [
        "fiemap_writer.cpp"
        "fiemap_status.cpp"
        "image_manager.cpp"
        "metadata.cpp"
        "split_fiemap_writer.cpp"
        "utility.cpp"
    ];
};

libfiemap_binder_srcs = filegroup {
    name = "libfiemap_binder_srcs";
    srcs = [
        "binder.cpp"
    ];
};

libfiemap_binder_defaults = cc_defaults {
    name = "libfiemap_binder_defaults";
    srcs = [":libfiemap_binder_srcs"];
    whole_static_libs = [
        "gsi_aidl_interface-cpp"
        "libgsi"
    ];
    shared_libs = [
        "libbinder"
        "libutils"
    ];
};

#  Open up a passthrough IImageManager interface. Use libfiemap_binder whenever
#  possible. This should only be used when binder is not available.
libfiemap_passthrough_srcs = filegroup {
    name = "libfiemap_passthrough_srcs";
    srcs = [
        "passthrough.cpp"
    ];
};

fiemap_writer_test = cc_test {
    name = "fiemap_writer_test";
    static_libs = [
        "libbase"
        "libdm"
        "libfs_mgr"
        "liblog"
        "libgsi"
    ];

    data = [
        "testdata/unaligned_file"
        "testdata/file_4k"
        "testdata/file_32k"
    ];

    srcs = [
        "fiemap_writer_test.cpp"
    ];

    test_suites = [
        "vts"
        "device-tests"
    ];
    auto_gen_config = true;
    test_min_api_level = 29;
    require_root = true;
};

fiemap_image_test = cc_test {
    name = "fiemap_image_test";
    static_libs = [
        "libdm"
        "libext4_utils"
        "libfs_mgr"
        "liblp"
    ];
    shared_libs = [
        "libbase"
        "libcrypto"
        "libcrypto_utils"
        "libcutils"
        "liblog"
    ];
    srcs = [
        "image_test.cpp"
    ];
    test_suites = ["device-tests"];
    auto_gen_config = true;
    require_root = true;
};

/* BUG(148874852) temporary test */
fiemap_image_test_presubmit = cc_test {
    name = "fiemap_image_test_presubmit";
    cppflags = [
        "-DSKIP_TEST_IN_PRESUBMIT"
    ];
    static_libs = [
        "libdm"
        "libext4_utils"
        "libfs_mgr"
        "liblp"
    ];
    shared_libs = [
        "libbase"
        "libcrypto"
        "libcrypto_utils"
        "libcutils"
        "liblog"
    ];
    srcs = [
        "image_test.cpp"
    ];
    test_suites = ["device-tests"];
    auto_gen_config = true;
    require_root = true;
};

in { inherit fiemap_image_test fiemap_image_test_presubmit fiemap_writer_test libfiemap_binder_defaults libfiemap_binder_srcs libfiemap_headers libfiemap_passthrough_srcs libfiemap_srcs; }
