{ cc_binary, vts_config }:
let

#
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
#

vts_test_binary_crash_app = cc_binary {
    name = "vts_test_binary_crash_app";
    srcs = ["crash_app.c"];
    shared_libs = [
        "libutils"
        "libcutils"
        "liblog"
    ];
    include_dirs = ["bionic"];
    cflags = [
        "-Werror"
        "-Wall"
    ];
};

vts_test_binary_seg_fault = cc_binary {
    name = "vts_test_binary_seg_fault";
    srcs = ["seg_fault.c"];
    shared_libs = [
        "libutils"
        "libcutils"
        "liblog"
    ];
    include_dirs = ["bionic"];
    cflags = [
        "-Werror"
        "-Wall"
    ];
};

ShellBinaryCrashTest = vts_config {
    name = "ShellBinaryCrashTest";
};

in { inherit ShellBinaryCrashTest vts_test_binary_crash_app vts_test_binary_seg_fault; }
