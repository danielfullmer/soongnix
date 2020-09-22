{ cc_library }:
let

#  Copyright (C) 2019 The Android Open Source Project
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

libadbd_auth = cc_library {
    name = "libadbd_auth";
    cflags = [
        "-Wall"
        "-Wextra"
        "-Wthread-safety"
        "-Werror"
    ];
    stl = "libc++_static";

    srcs = ["adbd_auth.cpp"];
    export_include_dirs = ["include"];

    version_script = "libadbd_auth.map.txt";
    stubs = {
        versions = ["30"];
        symbol_file = "libadbd_auth.map.txt";
    };

    host_supported = true;
    recovery_available = true;
    target = {
        darwin = {
            enabled = false;
        };
    };

    static_libs = [
        "libbase"
        "libcutils"
        "liblog"
    ];
};

in { inherit libadbd_auth; }