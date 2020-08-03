{ cc_library_static }:
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

libotautil = cc_library_static {
    name = "libotautil";

    host_supported = true;
    recovery_available = true;

    defaults = [
        "recovery_defaults"
    ];

    #  Minimal set of files to support host build.
    srcs = [
        "paths.cpp"
        "rangeset.cpp"
    ];

    shared_libs = [
        "libbase"
    ];

    export_include_dirs = [
        "include"
    ];

    target = {
        android = {
            srcs = [
                "dirutil.cpp"
                "logging.cpp"
                "mounts.cpp"
                "parse_install_logs.cpp"
                "roots.cpp"
                "sysutil.cpp"
                "thermalutil.cpp"
            ];

            include_dirs = [
                "system/vold"
            ];

            static_libs = [
                "libfstab"
            ];

            shared_libs = [
                "libcutils"
                "libext4_utils"
                "libfs_mgr"
                "libselinux"
            ];
        };
    };
};

in { inherit libotautil; }
