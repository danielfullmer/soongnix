{ cc_binary, cc_binary_host, cc_test }:
let

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

libufdt_tests_cflags = [
    "-Wall"
    "-Werror"
    "-Wno-error=format"
];

ufdt_gen_test_dts = cc_binary_host {
    name = "ufdt_gen_test_dts";
    cflags = libufdt_tests_cflags;
    srcs = ["ufdt_gen_test_dts.c"];
};

ufdt_apply_overlay = cc_binary {
    name = "ufdt_apply_overlay";
    host_supported = true;
    cflags = libufdt_tests_cflags;
    srcs = [
        "ufdt_overlay_test_app.c"
        "util.c"
    ];
    static_libs = [
        "libufdt"
        "libfdt"
        "libufdt_sysdeps"
    ];
    required = ["dtc"];
    target = {
        host = {
            stl = "none";
            dist = {
                targets = ["dist_files"];
                dir = "libufdt";
            };
        };
    };
};

extract_dtb = cc_binary_host {
    name = "extract_dtb";
    cflags = libufdt_tests_cflags;
    srcs = [
        "extract_dtb.c"
        "util.c"
    ];
    static_libs = [
        "libfdt"
        "libufdt_sysdeps"
    ];
    required = ["dtc"];
    stl = "none";
    dist = {
        targets = ["dist_files"];
        dir = "libufdt";
    };
};

fdt_apply_overlay = cc_binary {
    name = "fdt_apply_overlay";
    cflags = libufdt_tests_cflags;
    srcs = [
        "fdt_overlay_test_app.c"
        "util.c"
    ];
    static_libs = [
        "libfdt"
        "libufdt_sysdeps"
    ];
    required = ["dtc"];
};

ufdt_verify_overlay_host = cc_binary_host {
    name = "ufdt_verify_overlay_host";
    cflags = libufdt_tests_cflags;
    srcs = ["ufdt_verify_overlay_app.cpp"];
    static_libs = [
        "libufdt"
        "libfdt"
        "libufdt_sysdeps"
        "libufdt_verify"
    ];
    required = ["dtc"];

};

ufdt_verify_overlay = cc_test {
    name = "ufdt_verify_overlay";
    cflags = libufdt_tests_cflags;
    srcs = ["ufdt_verify_overlay_app.cpp"];
    static_libs = [
        "libufdt"
        "libfdt"
        "libufdt_sysdeps"
        "libufdt_verify"
    ];
    required = ["dtc"];
    test_suites = ["vts"];
    auto_gen_config = false;
};

in { inherit extract_dtb fdt_apply_overlay ufdt_apply_overlay ufdt_gen_test_dts ufdt_verify_overlay ufdt_verify_overlay_host; }
