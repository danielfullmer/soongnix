{ cc_library }:
let

#
#  Copyright (C) 2017 The Android Open Source Project
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

libese-hw-fake = cc_library {
    name = "libese-hw-fake";
    proprietary = true;
    defaults = ["libese-defaults"];
    srcs = ["ese_hw_fake.c"];
    host_supported = true;
    cflags = [
        "-DLOG_NDEBUG=0"
        "-Wall"
        "-Werror"
    ];
    shared_libs = [
        "liblog"
        "libese"
    ];
};

libese-hw-echo = cc_library {
    name = "libese-hw-echo";
    proprietary = true;
    defaults = ["libese-defaults"];
    host_supported = true;
    srcs = ["ese_hw_echo.c"];
    cflags = [
        "-DLOG_NDEBUG=0"
        "-Wall"
        "-Werror"
    ];
    shared_libs = [
        "liblog"
        "libese"
        "libese-teq1"
    ];
};

subdirs = [
    "tests"
    "nxp"
];

in { inherit libese-hw-echo libese-hw-fake; }
