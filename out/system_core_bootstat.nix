{ cc_binary, cc_defaults, cc_library_static, cc_test }:
let

#
#  Copyright (C) 2016 The Android Open Source Project
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

bootstat_lib_src_files = [
    "boot_event_record_store.cpp"
];

bootstat_defaults = cc_defaults {
    name = "bootstat_defaults";

    cflags = [
        "-Wall"
        "-Wextra"
        "-Werror"
    ];
    shared_libs = [
        "libbase"
        "libcutils"
        "liblog"
        "libmetricslogger"
    ];
};

#  bootstat static library
#  -----------------------------------------------------------------------------
libbootstat = cc_library_static {
    name = "libbootstat";
    defaults = ["bootstat_defaults"];
    srcs = bootstat_lib_src_files;
};

#  bootstat static library, debug
#  -----------------------------------------------------------------------------
libbootstat_debug = cc_library_static {
    name = "libbootstat_debug";
    defaults = ["bootstat_defaults"];
    host_supported = true;
    srcs = bootstat_lib_src_files;

    target = {
        host = {
            cflags = ["-UNDEBUG"];
        };
    };
};

#  bootstat binary
#  -----------------------------------------------------------------------------
bootstat = cc_binary {
    name = "bootstat";
    defaults = ["bootstat_defaults"];
    static_libs = ["libbootstat"];
    shared_libs = [
        "libstatslog"
    ];
    init_rc = ["bootstat.rc"];
    product_variables = {
        pdk = {
            enabled = false;
        };
        debuggable = {
            init_rc = ["bootstat-debug.rc"];
        };
    };
    srcs = ["bootstat.cpp"];
};

#  Native tests
#  -----------------------------------------------------------------------------
bootstat_tests = cc_test {
    name = "bootstat_tests";
    test_suites = ["device-tests"];
    defaults = ["bootstat_defaults"];
    host_supported = true;
    static_libs = [
        "libbootstat_debug"
        "libgmock"
    ];
    srcs = [
        "boot_event_record_store_test.cpp"
        "testrunner.cpp"
    ];
};

in { inherit bootstat bootstat_defaults bootstat_tests libbootstat libbootstat_debug; }
