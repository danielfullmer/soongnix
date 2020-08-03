{ cc_library }:
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

sourceFiles = [
    "performance_client.cpp"
    "performance_rpc.cpp"
];

includeFiles = ["include"];

sharedLibraries = [
    "libbase"
    "libbinder"
    "libcutils"
    "liblog"
    "libutils"
    "libpdx_default_transport"
];

libperformance = cc_library {
    srcs = sourceFiles;
    cflags = [
        "-DLOG_TAG=\"libperformance\""
        "-DTRACE=0"
        "-Wall"
        "-Werror"
    ];
    export_include_dirs = includeFiles;
    shared_libs = sharedLibraries;
    name = "libperformance";
};

in { inherit libperformance; }
