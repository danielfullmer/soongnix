{ cc_binary, cc_defaults, cc_library_headers, cc_library_static, cc_test }:
let

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

minadbd_defaults = cc_defaults {
    name = "minadbd_defaults";

    cflags = [
        "-DADB_HOST=0"
        "-Wall"
        "-Werror"
    ];

    cpp_std = "experimental";

    include_dirs = [
        "system/core/adb"
    ];

    header_libs = [
        "libminadbd_headers"
    ];
};

#  `libminadbd_services` is analogous to the `libadbd_services` for regular `adbd`, but providing
#  the sideload service only.
libminadbd_services = cc_library_static {
    name = "libminadbd_services";
    recovery_available = true;

    defaults = [
        "minadbd_defaults"
        "librecovery_utils_defaults"
    ];

    srcs = [
        "fuse_adb_provider.cpp"
        "minadbd_services.cpp"
    ];

    static_libs = [
        "librecovery_utils"
        "libotautil"
    ];

    shared_libs = [
        "libadbd"
        "libbase"
        "libcrypto"
        "libfusesideload"
    ];
};

libminadbd_headers = cc_library_headers {
    name = "libminadbd_headers";
    recovery_available = true;
    export_include_dirs = [
        "include"
    ];
    #  adb_install.cpp
    visibility = [
        "//bootable/recovery/install"
    ];
};

minadbd = cc_binary {
    name = "minadbd";
    recovery = true;

    defaults = [
        "minadbd_defaults"
        "libadbd_binary_dependencies"
        "librecovery_utils_defaults"
    ];

    srcs = [
        "minadbd.cpp"
    ];

    shared_libs = [
        "libbase"
        "libcrypto"
    ];

    static_libs = [
        "libminadbd_services"
        "libfusesideload"
        "librecovery_utils"
    ];

    required = [
        "adbd_system_api_recovery"
    ];
};

minadbd_test = cc_test {
    name = "minadbd_test";
    isolated = true;

    defaults = [
        "minadbd_defaults"
        "librecovery_utils_defaults"
        "libadbd_binary_dependencies"
    ];

    srcs = [
        "fuse_adb_provider_test.cpp"
        "minadbd_services_test.cpp"
    ];

    static_libs = [
        "libminadbd_services"
        "libfusesideload"
        "librecovery_utils"
        "libotautil"
    ];

    shared_libs = [
        "libbase"
        "libcrypto"
        "libcutils"
        "liblog"
    ];

    test_suites = [
        "device-tests"
    ];
};

in { inherit libminadbd_headers libminadbd_services minadbd minadbd_defaults minadbd_test; }
