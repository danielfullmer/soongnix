{ cc_binary, cc_library_static }:
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

sharedLibraries = [
    "libbase"
    "libcutils"
    "libgtest_prod"
    "libgui"
    "liblog"
    "libpdx_default_transport"
    "libsync"
    "libui"
    "libutils"
];

libbufferhubd = cc_library_static {
    name = "libbufferhubd";
    srcs = [
        "buffer_hub.cpp"
        "consumer_channel.cpp"
        "consumer_queue_channel.cpp"
        "producer_channel.cpp"
        "producer_queue_channel.cpp"
    ];
    cflags = [
        "-DLOG_TAG=\"libbufferhubd\""
        "-DTRACE=0"
        "-DATRACE_TAG=ATRACE_TAG_GRAPHICS"
    ];
    export_include_dirs = ["include"];
    header_libs = ["libdvr_headers"];
    shared_libs = sharedLibraries;
    static_libs = [
        "libbufferhub"
    ];
};

bufferhubd = cc_binary {
    srcs = ["bufferhubd.cpp"];
    cflags = [
        "-DLOG_TAG=\"bufferhubd\""
        "-DTRACE=0"
        "-DATRACE_TAG=ATRACE_TAG_GRAPHICS"
    ];
    header_libs = ["libdvr_headers"];
    shared_libs = sharedLibraries;
    static_libs = [
        "libbufferhub"
        "libbufferhubd"
        "libperformance"
    ];
    name = "bufferhubd";
    init_rc = ["bufferhubd.rc"];
};

in { inherit bufferhubd libbufferhubd; }
