{ cc_library }:
let

#  Copyright (C) 2018 The Android Open Source Project
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

libfusesideload = cc_library {
    name = "libfusesideload";
    recovery_available = true;

    defaults = [
        "recovery_defaults"
    ];

    cflags = [
        "-D_XOPEN_SOURCE"
        "-D_GNU_SOURCE"
    ];

    srcs = [
        "fuse_provider.cpp"
        "fuse_sideload.cpp"
    ];

    export_include_dirs = [
        "include"
    ];

    static_libs = [
        "libotautil"
    ];

    shared_libs = [
        "libbase"
        "libcrypto"
    ];
};

in { inherit libfusesideload; }
