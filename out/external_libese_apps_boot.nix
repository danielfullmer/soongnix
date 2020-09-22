{ cc_binary, cc_library }:
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

libese-app-boot = cc_library {
    name = "libese-app-boot";
    defaults = ["libese-app-defaults"];
    srcs = ["boot.c"];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    host_supported = true;
    shared_libs = [
        "liblog"
        "libese"
        "libese-sysdeps"
    ];
    export_include_dirs = ["include"];
};

libese-app-boot-fortest = cc_library {
    name = "libese-app-boot-fortest";
    defaults = ["libese-app-defaults"];
    srcs = ["boot.c"];
    host_supported = true;
    cflags = [
        "-fvisibility=default"
        "-Wall"
        "-Werror"
    ];
    shared_libs = [
        "liblog"
        "libese"
        "libese-sysdeps"
    ];
    export_include_dirs = ["include"];
};

ese-boot-tool = cc_binary {
    name = "ese-boot-tool";
    proprietary = true;
    srcs = ["ese_boot_tool.cpp"];
    shared_libs = [
        "libcutils"
        "liblog"
        "libese"
        "libese-sysdeps"
        "libese-app-boot"
        "libese-teq1"
        "libese-hw-nxp-pn80t-nq-nci"
    ];
    host_supported = false;
    cflags = [
        "-Wall"
        "-Werror"
    ];
    target = {
        darwin = {
            enabled = false;
        };
    };
};

subdirs = ["tests"];

in { inherit ese-boot-tool libese-app-boot libese-app-boot-fortest; }
