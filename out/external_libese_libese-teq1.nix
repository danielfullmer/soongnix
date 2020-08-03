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

libese-teq1 = cc_library {
    name = "libese-teq1";
    defaults = ["libese-api-defaults"];
    host_supported = true;
    srcs = ["teq1.c"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    shared_libs = [
        "liblog"
        "libese"
        "libese-sysdeps"
    ];
};

libese-teq1-private = cc_library {
    name = "libese-teq1-private";
    #  Used by tests to access hidden symbols.
    defaults = ["libese-defaults"];
    host_supported = true;

    srcs = ["teq1.c"];
    cflags = [
        "-Wall"
        "-Werror"
    ];

    #  Ensure that only explicitly exported symbols are visible.
    shared_libs = [
        "liblog"
        "libese"
        "libese-sysdeps"
    ];
    export_include_dirs = [
        "."
        "include"
    ];
};

subdirs = ["tests"];

in { inherit libese-teq1 libese-teq1-private; }
