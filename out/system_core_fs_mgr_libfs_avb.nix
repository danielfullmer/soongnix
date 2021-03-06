{ cc_defaults, cc_library_host_static, cc_library_static, cc_test, cc_test_host }:
let

#
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
#

libfs_avb = cc_library_static {
    name = "libfs_avb";
    defaults = ["fs_mgr_defaults"];
    recovery_available = true;
    host_supported = true;
    export_include_dirs = ["include"];
    srcs = [
        "avb_ops.cpp"
        "avb_util.cpp"
        "fs_avb.cpp"
        "fs_avb_util.cpp"
        "types.cpp"
        "util.cpp"
    ];
    static_libs = [
        "libavb"
        "libdm"
        "libfstab"
    ];
    export_static_lib_headers = [
        "libfstab"
    ];
    shared_libs = [
        "libcrypto"
    ];
    header_libs = [
        "libbase_headers"
    ];
    target = {
        darwin = {
            enabled = false;
        };
    };
};

libfs_avb_host_test_defaults = cc_defaults {
    name = "libfs_avb_host_test_defaults";
    required = [
        "avbtool"
    ];
    data = [
        "tests/data/testkey_rsa2048.pem"
        "tests/data/testkey_rsa4096.pem"
        "tests/data/testkey_rsa8192.pem"
    ];
    static_libs = [
        "libavb"
        "libavb_host_sysdeps"
        "libdm"
        "libfs_avb"
        "libfstab"
        "libgtest_host"
    ];
    shared_libs = [
        "libbase"
        "libchrome"
    ];
    target = {
        darwin = {
            enabled = false;
        };
    };
    cflags = [
        "-DHOST_TEST"
    ];
};

libfs_avb_test_util = cc_library_host_static {
    name = "libfs_avb_test_util";
    defaults = ["libfs_avb_host_test_defaults"];
    srcs = [
        "tests/fs_avb_test_util.cpp"
    ];
};

libfs_avb_test = cc_test_host {
    name = "libfs_avb_test";
    defaults = ["libfs_avb_host_test_defaults"];
    test_suites = ["general-tests"];
    static_libs = [
        "libfs_avb_test_util"
    ];
    shared_libs = [
        "libcrypto"
    ];
    srcs = [
        "tests/basic_test.cpp"
        "tests/fs_avb_test.cpp"
        "tests/fs_avb_util_test.cpp"
    ];
};

libfs_avb_internal_test = cc_test_host {
    name = "libfs_avb_internal_test";
    defaults = ["libfs_avb_host_test_defaults"];
    test_suites = ["general-tests"];
    static_libs = [
        "libfs_avb_test_util"
    ];
    srcs = [
        "avb_util.cpp"
        "util.cpp"
        "tests/avb_util_test.cpp"
        "tests/util_test.cpp"
    ];
};

libfs_avb_device_test = cc_test {
    name = "libfs_avb_device_test";
    test_suites = ["device-tests"];
    static_libs = [
        "libavb"
        "libdm"
        "libfs_avb"
        "libfstab"
    ];
    shared_libs = [
        "libbase"
        "libcrypto"
    ];
    srcs = [
        "tests/fs_avb_device_test.cpp"
    ];
    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
};

in { inherit libfs_avb libfs_avb_device_test libfs_avb_host_test_defaults libfs_avb_internal_test libfs_avb_test libfs_avb_test_util; }
