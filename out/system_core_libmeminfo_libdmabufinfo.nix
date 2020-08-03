{ cc_defaults, cc_library_static, cc_test }:
let

#
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

dmabufinfo_defaults = cc_defaults {
    name = "dmabufinfo_defaults";
    static_libs = [
        "libbase"
        "libprocinfo"
    ];
    shared_libs = [
        "liblog"
    ];

    cflags = [
        "-Wall"
        "-Werror"
        "-Wextra"
    ];
};

libdmabufinfo = cc_library_static {
    name = "libdmabufinfo";
    vendor_available = true;
    defaults = ["dmabufinfo_defaults"];
    export_include_dirs = ["include"];
    srcs = [
        "dmabufinfo.cpp"
    ];
};

dmabufinfo_test = cc_test {
    name = "dmabufinfo_test";
    defaults = ["dmabufinfo_defaults"];
    srcs = [
        "dmabufinfo_test.cpp"
    ];

    static_libs = [
        "libc++fs"
        "libdmabufinfo"
        "libion"
        "libmeminfo"
    ];
};

in { inherit dmabufinfo_defaults dmabufinfo_test libdmabufinfo; }
