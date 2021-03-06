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

libcgrouprc = cc_library {
    name = "libcgrouprc";
    host_supported = true;
    recovery_available = true;
    #  Do not ever mark this as vendor_available; otherwise, vendor modules
    #  that links to the static library will behave unexpectedly. All on-device
    #  modules should use libprocessgroup which links to the LL-NDK library
    #  defined below. The static library is built for tests.
    vendor_available = false;
    srcs = [
        "cgroup_controller.cpp"
        "cgroup_file.cpp"
    ];
    cflags = [
        "-Wall"
        "-Werror"
    ];
    export_include_dirs = [
        "include"
    ];
    header_libs = [
        "libprocessgroup_headers"
    ];
    shared_libs = [
        "libbase"
    ];
    static_libs = [
        "libcgrouprc_format"
    ];
    stubs = {
        symbol_file = "libcgrouprc.llndk.txt";
        versions = ["29"];
    };
    target = {
        linux = {
            version_script = "libcgrouprc.llndk.txt";
        };
    };
};

in { inherit libcgrouprc; }
