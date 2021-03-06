{ cc_library_static }:
let

#
#  Copyright (C) 2012 The Android Open Source Project
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

libLLVMWrap = cc_library_static {
    name = "libLLVMWrap";
    vendor_available = true;
    host_supported = true;

    srcs = [
        "bitcode_wrapperer.cpp"
        "file_wrapper_input.cpp"
        "file_wrapper_output.cpp"
        "in_memory_wrapper_input.cpp"
        "wrapper_output.cpp"
    ];

    cflags = [
        "-Wall"
        "-Werror"
    ];

    target = {
        host = {
            cflags = ["-D__HOST__"];
        };
        windows = {
            enabled = true;
        };
    };

    header_libs = [
        "libbcinfo-headers"
        "liblog_headers"
    ];
};

in { inherit libLLVMWrap; }
