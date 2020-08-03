{ cc_library, cc_library_headers, cc_test }:
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

libbpf_android_headers = cc_library_headers {
    name = "libbpf_android_headers";
    vendor_available = false;
    host_supported = false;
    export_include_dirs = ["include"];
    target = {
        linux_bionic = {
            enabled = true;
        };
    };
};

libbpf_android = cc_library {
    name = "libbpf_android";
    vendor_available = false;
    host_supported = false;
    target = {
        android = {
            srcs = [
                "BpfUtils.cpp"
                "Loader.cpp"
            ];
            sanitize = {
                misc_undefined = ["integer"];
            };
        };
    };

    shared_libs = [
        "libbase"
        "libutils"
        "libprocessgroup"
        "liblog"
        "libnetdutils"
        "libbpf"
    ];
    header_libs = [
        "libbpf_android_headers"
    ];
    export_header_lib_headers = ["libbpf_android_headers"];
    local_include_dirs = ["include"];

    defaults = ["bpf_defaults"];
    cflags = [
        "-Werror"
        "-Wall"
        "-Wextra"
    ];
};

libbpf_android_test = cc_test {
    name = "libbpf_android_test";
    srcs = [
        "BpfMapTest.cpp"
    ];
    defaults = ["bpf_defaults"];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-error=unused-variable"
    ];
    static_libs = ["libgmock"];
    shared_libs = [
        "libbpf_android"
        "libbase"
        "liblog"
        "libnetdutils"
        "libutils"
    ];
};

libbpf_load_test = cc_test {
    name = "libbpf_load_test";
    srcs = [
        "BpfLoadTest.cpp"
    ];
    defaults = ["bpf_defaults"];
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-error=unused-variable"
    ];
    static_libs = ["libgmock"];
    shared_libs = [
        "libbpf_android"
        "libbpf"
        "libbase"
        "liblog"
        "libnetdutils"
        "libutils"
    ];

    required = [
        "bpf_load_tp_prog.o"
    ];
};

in { inherit libbpf_android libbpf_android_headers libbpf_android_test libbpf_load_test; }
