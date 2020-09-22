{ cc_library, cc_library_headers, cc_test }:
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

libbufferhub_headers = cc_library_headers {
    name = "libbufferhub_headers";
    export_include_dirs = ["include"];
    vendor_available = true; #  TODO(b/112338314): Does shouldn't be available to vendor.
};

sourceFiles = [
    "buffer_hub_base.cpp"
    "buffer_hub_rpc.cpp"
    "consumer_buffer.cpp"
    "ion_buffer.cpp"
    "producer_buffer.cpp"
];

sharedLibraries = [
    "libbase"
    "libcutils"
    "liblog"
    "libui"
    "libutils"
    "libpdx_default_transport"
];

headerLibraries = [
    "libbufferhub_headers"
    "libdvr_headers"
    "libnativebase_headers"
];

libbufferhub = cc_library {
    srcs = sourceFiles;
    cflags = [
        "-DLOG_TAG=\"libbufferhub\""
        "-DTRACE=0"
        "-DATRACE_TAG=ATRACE_TAG_GRAPHICS"
        "-Wall"
        "-Werror"
    ];
    shared_libs = sharedLibraries;
    header_libs = headerLibraries;
    name = "libbufferhub";
    export_header_lib_headers = [
        "libbufferhub_headers"
        "libnativebase_headers"
    ];
};

buffer_hub-test = cc_test {
    srcs = ["buffer_hub-test.cpp"];
    static_libs = ["libbufferhub"];
    shared_libs = sharedLibraries;
    header_libs = headerLibraries;
    name = "buffer_hub-test";
};

in { inherit buffer_hub-test libbufferhub libbufferhub_headers; }
