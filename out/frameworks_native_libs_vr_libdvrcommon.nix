{ cc_library, cc_test }:
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

localIncludeFiles = [
    "include"
];

sharedLibraries = [
    "libbase"
    "libcutils"
    "liblog"
    "libutils"
    "libEGL"
    "libGLESv2"
    "libui"
    "libgui"
    "libhardware"
    "libpdx_default_transport"
];

staticLibraries = ["libbroadcastring"];

headerLibraries = [
    "libeigen"
];

libdvrcommon = cc_library {
    local_include_dirs = localIncludeFiles;

    cflags = [
        "-DLOG_TAG=\"libdvrcommon\""
        "-DTRACE=0"
        "-Wall"
        "-Werror"
    ];
    export_include_dirs = localIncludeFiles;

    header_libs = headerLibraries;
    export_header_lib_headers = headerLibraries;

    name = "libdvrcommon";
};

testFiles = [
    "tests/numeric_test.cpp"
    "tests/pose_test.cpp"
];

libdvrcommon_test = cc_test {
    name = "libdvrcommon_test";

    srcs = testFiles;
    cflags = [
        "-Wall"
        "-Werror"
        "-Wno-unused-parameter"
    ];

    shared_libs = sharedLibraries;

    static_libs = [
        "libgmock_main"
        "libgmock"
        "libgtest"
        "libdvrcommon"
    ] ++ staticLibraries;
};

in { inherit libdvrcommon libdvrcommon_test; }
