{ cc_defaults, cc_library, cc_library_headers }:
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

libbpf_defaults = cc_defaults {
    name = "libbpf_defaults";
    cpp_std = "c++17";
    cflags = [
        "-Wall"
        "-Werror"
        "-Wnullable-to-nonnull-conversion"
        "-Wthread-safety"
        "-Wunused-parameter"
    ];
    tidy = true;
    tidy_checks = [
        "android-*"
        "cert-*"
        "clang-analyzer-security*"
        #  Disabling due to many unavoidable warnings from POSIX API usage.
        "-google-runtime-int"
    ];
};

libbpf_headers = cc_library_headers {
    name = "libbpf_headers";
    vendor_available = false;
    host_supported = false;
    export_include_dirs = ["src/cc/includes/"];
    target = {
        linux_bionic = {
            enabled = true;
        };
    };
};

libbpf = cc_library {
    name = "libbpf";
    vendor_available = false;
    host_supported = false;
    target = {
        android = {
            srcs = [
                "src/cc/libbpf.c"
                "src/cc/perf_reader.c"
            ];
            sanitize = {
                misc_undefined = ["integer"];
            };
        };
    };

    header_libs = [
        "libbpf_headers"
    ];
    export_header_lib_headers = ["libbpf_headers"];
    local_include_dirs = ["src/cc"];

    defaults = ["bpf_defaults"];
    cflags = [
        "-Werror"
        "-Wall"
        "-Wextra"
    ];
};

in { inherit libbpf libbpf_defaults libbpf_headers; }
